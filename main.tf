resource "google_project_service" "kubernetes" {
  service = "container.googleapis.com"
}

# Create a GKE cluster
resource "google_container_cluster" "primary" {
  name               = "apps"
  location            = var.zone
  network = google_compute_network.vpc_network.self_link
  subnetwork = google_compute_subnetwork.private.self_link
  initial_node_count = 1
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    disk_size_gb = 50
    spot = true
    machine_type = var.machine_type
  }

  # Enable autoscaling
  cluster_autoscaling {
  }

  depends_on = [google_project_service.kubernetes]
}

# # Create a firewall rule to allow traffic to the GKE cluster
# resource "google_compute_firewall" "allow-gke-cluster-traffic" {
#   name    = "allow-gke-cluster-traffic"
#   network = google_compute_network.vpc_network.id

#   allow {
#     protocol = "tcp"
#     ports     = ["6443"]
#   }

#   source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["gke-cluster"]
# }
