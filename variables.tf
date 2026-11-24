variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Default Google Cloud region"
  type        = string
  default     = "us-west1"
}

variable "zone" {
  description = "Default Google Cloud zone"
  type        = string
  default     = "us-west1-b"
}

variable "network_name" {
  description = "Name of the custom VPC network"
  type        = string
  default     = "tf-vpc-main"
}

variable "state_bucket_name" {
  description = "Globally unique name for the GCS bucket storing Terraform remote state"
  type        = string
}

variable "vm_machine_type" {
  description = "Compute Engine machine type for application instances"
  type        = string
  default     = "e2-standard-2"
}
