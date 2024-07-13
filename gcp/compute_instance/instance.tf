resource "google_compute_instance" "instance" {
  name         = "${var.project_id}-${var.machine_type}"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network
    subnetwork = var.subnetwork
  }
}
