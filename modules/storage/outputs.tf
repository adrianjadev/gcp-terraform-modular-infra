output "bucket_name" {
  description = "Name of the Cloud Storage bucket"
  value       = google_storage_bucket.tf_state_bucket.name
}

output "bucket_url" {
  description = "GCS URL of the Cloud Storage bucket"
  value       = google_storage_bucket.tf_state_bucket.url
}
