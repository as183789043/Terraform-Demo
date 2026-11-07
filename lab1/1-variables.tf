variable "REGION" {
  type    = string
  default = "asia-east1"
}

variable "GCP_PROJECT" {
  type    = string
  default = "terraform101-514005"
}


variable "gcs_name" {
  type    = string
  default = "tf-create-gcs"
}


variable "gcs_location" {
  type    = string
  default = "asia"
}

variable "gcs_public_access_prevention" {
  type    = string
  default = "enforced"

}

variable "gcs_storage_class" {
  type    = string
  default = "MULTI_REGIONAL"

}

variable "gcs_lifecycle_age" {
  type    = number
  default = 90

}

variable "gcs_lifecycle_rule_action" {
  type    = string
  default = "Delete"

}