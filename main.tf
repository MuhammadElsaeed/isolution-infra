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
}

module "tools_gke" {
  source = "./modules/gke"
  cluster_name = "tools-cluster"
  zone = var.zone
  network = google_compute_network.vpc_network.self_link
  subnetwork = google_compute_subnetwork.tools-private.self_link

}
