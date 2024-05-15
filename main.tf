resource "google_project_service" "kubernetes" {
  service = "container.googleapis.com"
}
module "apps_gke" {
  source = "./modules/gke"
  cluster_name = "apps-cluster"
  zone = var.zone
  network = google_compute_network.vpc_network.self_link
  subnetwork = google_compute_subnetwork.apps-private.self_link
  machine_type = "e2-small"
  master_ipv4_cidr_block = "10.0.32.0/28"
  cluster_ipv4_cidr_block = "10.64.0.0/20"
  services_ipv4_cidr_block = "10.64.16.0/20"
}

module "tools_gke" {
  source = "./modules/gke"
  cluster_name = "tools-cluster"
  zone = var.zone
  network = google_compute_network.vpc_network.self_link
  subnetwork = google_compute_subnetwork.tools-private.self_link
  master_ipv4_cidr_block = "10.0.33.0/28"
  cluster_ipv4_cidr_block = "10.128.0.0/20"
  services_ipv4_cidr_block = "10.128.16.0/20"
}
