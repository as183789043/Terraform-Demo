terraform {
  required_version = ">=1.17.1"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.10.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.9.1"

    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.8.1"
    }
  }
}

provider "google" {
  project = var.GCP_PROJECT
  region  = var.REGION

}
provider "random" {
  # Configuration options
}

provider "archive" {
  # Configuration options
}