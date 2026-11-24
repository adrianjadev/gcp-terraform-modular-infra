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

variable "bucket_name" {
  description = "Globally unique name for the GCS remote state bucket"
  type        = string
}
