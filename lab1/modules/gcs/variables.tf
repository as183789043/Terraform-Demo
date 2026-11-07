 variable "gcs_name" {
   type    = string
   default = "tf-quick-start-1107"
 }

  variable "gcs_location" {
   type    = string
   default = "asia-east1"
 }

 variable "gcs_public_access_prevention" {
  type = string
  default = "enforced"
   
 }
 
 variable "gcs_storage_class" {
  type = string
  default = "MULTI_REGIONAL"
   
 }

   variable "gcs_lifecycle_age" {
  type = number
  default = 30
   
 }

  variable "gcs_lifecycle_rule_action" {
  type = string
  default = "Delete"
   
 }