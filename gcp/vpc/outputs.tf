output "network_name" {
  description = "The name of the VPC network"
  value       = google_compute_network.vpc_network.name
}

output "subnetwork_name" {
  description = "The name of the VPC subnetwork"
  value       = google_compute_subnetwork.subnet.name
}

