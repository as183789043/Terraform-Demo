resource "google_storage_bucket" "tf-quick-start" {
  name          = var.gcs_name
  location      = var.gcs_location
  force_destroy = true

  public_access_prevention = var.gcs_public_access_prevention
  storage_class            = var.gcs_storage_class
  retention_policy {
    retention_period = var.gcs_retention_period
  }

  lifecycle_rule {
    condition {
      age = var.gcs_lifecycle_age
    }
    action {
      type = var.gcs_lifecycle_rule_action
    }
  }
}