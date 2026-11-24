terraform {
  required_version = ">= 1.5.7"

  # Remote GCS backend for team state management.
  # Bootstrap the storage module first with a local backend, then pass the bucket
  # name during init: terraform init -backend-config="bucket=YOUR_BUCKET_NAME"
  # backend "gcs" {
  #   prefix = "terraform/state"
  # }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# 1. Custom VPC and Subnets (Official Google Registry Module)
module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "10.0.0"

  project_id   = var.project_id
  network_name = var.network_name
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = var.region
    },
    {
      subnet_name   = "subnet-02"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = var.region
    }
  ]
}

# 2. Compute Engine Instances Module
module "instances" {
  source = "./modules/instances"

  project_id      = var.project_id
  region          = var.region
  zone            = var.zone
  network         = module.vpc.network_self_link
  subnet_01       = module.vpc.subnets["${var.region}/subnet-01"].self_link
  subnet_02       = module.vpc.subnets["${var.region}/subnet-02"].self_link
  vm_machine_type = var.vm_machine_type
}

# 3. Cloud Storage Module (Used for Remote State Backend)
module "storage" {
  source = "./modules/storage"

  project_id  = var.project_id
  region      = var.region
  zone        = var.zone
  bucket_name = var.state_bucket_name
}

# 4. VPC Firewall Rule (Allow HTTP ingress on TCP port 80)
resource "google_compute_firewall" "tf_firewall" {
  name    = "tf-firewall"
  network = module.vpc.network_self_link

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}
