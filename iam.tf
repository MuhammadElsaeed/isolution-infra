resource "google_service_account" "github_actions_runner" {
  account_id   = "github-actions-runners"
}

resource "google_project_iam_binding" "artifact_registry_binding" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"

  members = [
    "serviceAccount:${google_service_account.github_actions_runner.email}"
  ]
}
