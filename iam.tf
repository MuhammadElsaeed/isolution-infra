resource "google_service_account" "github_actions_runner" {
  account_id   = "github-actions-runners"
}


resource "google_project_iam_member" "github_actions_runner-project-owner" {
  project = var.project_id
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.github_actions_runner.email}"
}