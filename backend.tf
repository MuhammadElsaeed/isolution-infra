terraform {
  backend "gcs" {
    bucket  = "isolution-task-data"
    prefix  = "terraform/state"
  }
}
