variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "zone" {
  description = "The GCP zone"
  type        = string
}

variable "machine_type" {
  description = "The machine type to use for the instance"
  type        = string
}

variable "image" {
  description = "The boot disk image for the instance"
  type        = string
}

variable "network" {
  description = "The network to attach the instance to"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to attach the instance to"
  type        = string
}