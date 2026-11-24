output "instance_internal_ips" {
  description = "Map of instance names to their internal IP addresses"
  value = {
    tf-instance-1 = google_compute_instance.tf_instance_1.network_interface[0].network_ip
    tf-instance-2 = google_compute_instance.tf_instance_2.network_interface[0].network_ip
  }
}

output "instance_ids" {
  description = "Map of instance names to their GCP instance IDs"
  value = {
    tf-instance-1 = google_compute_instance.tf_instance_1.instance_id
    tf-instance-2 = google_compute_instance.tf_instance_2.instance_id
  }
}
