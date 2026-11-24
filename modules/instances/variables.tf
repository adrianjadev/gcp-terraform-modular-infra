variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Default Google Cloud region"
  type        = string
}

variable "zone" {
  description = "Default Google Cloud zone"
  type        = string
}

variable "network" {
  description = "VPC network name or self-link"
  type        = string
}

variable "subnet_01" {
  description = "Subnetwork self-link for instance 1"
  type        = string
}

variable "subnet_02" {
  description = "Subnetwork self-link for instance 2"
  type        = string
}

variable "vm_machine_type" {
  description = "Compute Engine machine type"
  type        = string
  default     = "e2-standard-2"
}
