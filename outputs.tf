output "vpc_network_self_link" {
  description = "Self-link of the created VPC network"
  value       = module.vpc.network_self_link
}

output "subnet_names" {
  description = "Names of the created VPC subnets"
  value       = module.vpc.subnets_names
}

output "state_bucket_url" {
  description = "GCS URL for the remote state bucket"
  value       = module.storage.bucket_url
}

output "instance_internal_ips" {
  description = "Internal IP addresses of the deployed Compute Engine VMs"
  value       = module.instances.instance_internal_ips
}
