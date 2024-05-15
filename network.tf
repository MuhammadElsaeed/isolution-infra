resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

# Create a VPC network
resource "google_compute_network" "vpc_network" {
  name = "apps-network"
  auto_create_subnetworks = false
  depends_on = [ google_project_service.compute ]
}

# Create a subnet within the VPC network
resource "google_compute_subnetwork" "apps-private" {
  name          = "apps-private"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.vpc_network.id
  region         = var.region
  private_ip_google_access = "true"
}


resource "google_compute_subnetwork" "tools-private" {
  name          = "tools-private"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc_network.id
  region         = var.region
  private_ip_google_access = "true"
}

# Define router
resource "google_compute_router" "router" {
  name    = "cloud-router"
  network = google_compute_network.vpc_network.self_link
}

# Create Cloud NAT
resource "google_compute_router_nat" "cloud_nat" {
  name         = "cloud-nat"
  router       = google_compute_router.router.name
  nat_ip_allocate_option = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}


resource "google_compute_global_address" "hello_world_ip" {
  name = "hello-world-ip"
}