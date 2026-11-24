resource "google_storage_bucket" "tf_state_bucket" {
  name                        = var.bucket_name
  project                     = var.project_id
  location                    = "US"
  force_destroy               = true
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }
}
