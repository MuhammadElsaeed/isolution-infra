resource "google_project_service" "kubernetes" {
  service = "container.googleapis.com"
}

# Create a GKE cluster
resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.zone
  network            = var.network
  subnetwork         = var.subnetwork
  initial_node_count = var.initial_node_count
  
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    disk_size_gb = var.disk_size_gb
    spot         = var.spot_instances
    machine_type = var.machine_type
  }

  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint
    master_ipv4_cidr_block = var.master_ipv4_cidr_block

  }
  ip_allocation_policy {
    cluster_ipv4_cidr_block = var.cluster_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
    
  }

  cluster_autoscaling {
  }

  depends_on = [google_project_service.kubernetes]
}
