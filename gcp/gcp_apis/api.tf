resource "google_project_service" "gcp_api" {
  project = var.project_id
  service = var.service_name
}