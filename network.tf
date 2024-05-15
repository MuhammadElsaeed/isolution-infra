resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

# Create a VPC network
resource "google_compute_network" "vpc_network" {
  name = "apps-network"
  depends_on = [ google_project_service.compute ]
}

# Create a subnet within the VPC network
resource "google_compute_subnetwork" "private" {
  name          = "private"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc_network.id
  region         = var.region
}

resource "google_compute_global_address" "hello_world_ip" {
  name = "hello-world-ip"
}