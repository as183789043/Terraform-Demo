module "gcs" {
  source                       = "./modules/gcs"
  gcs_name                     = var.gcs_name
  gcs_location                 = var.gcs_location
  gcs_storage_class            = var.gcs_storage_class
  gcs_lifecycle_age            = var.gcs_lifecycle_age
  gcs_lifecycle_rule_action    = var.gcs_lifecycle_rule_action
  gcs_public_access_prevention = var.gcs_public_access_prevention

}