provider "google" {
    project = local.project_id
    region = local.region
}

module "compute_engine_service" {
    source = "./gcp_apis"
    project_id = local.project_id
    service_name = "compute.googleapis.com" 
}

# creates vpc and subnet 
module "google-network" {
  source       = "./vpc"
  
  vpc_name     = "${local.project_id}-vpc"
  routing_mode = "GLOBAL"
  mtu          = 1460

  subnet_name              = "${local.project_id}-subnet"
  ip_cidr_range            = "10.1.0.0/16"
  region                   = local.region
  private_ip_access        = "true"
  secondary_ip_range_names = ["pod-range", "service-range"]
  secondary_ip_ranges      = ["10.2.0.0/24", "10.3.0.0/24"]
}

# Compute Instances

module "compute_instance" {
    for_each = toset([
        "c3-standard-4", # US$0.21 hourly
        "c3d-standard-4", # US$0.18 hourly
        "e2-medium", # US$0.03 hourly
        "n2-standard-4", # US$0.08 hourly
        "n2d-standard-2", # US$0.07 hourly
        "t2d-standard-1", # US$0.04 hourly
        "n1-standard-4", # US$0.03 hourly
        "c2d-standard-2", # US$0.09 hourly
        # "n4-standard-2", # US$0.10 hourly
        # "c2-standard-4", # US$0.17 hourly
        # # "t2a-standard-1", # US$0.04 hourly
        # # "h3-standard-88", # US$4.92 hourly
    ])

    source = "./compute_instance"
    project_id = local.project_id
    region = local.region
    zone = local.zone
    machine_type = each.key 
    image = "debian-cloud/debian-11"
    network = module.google-network.network_name
    subnetwork = module.google-network.subnetwork_name
  
}


