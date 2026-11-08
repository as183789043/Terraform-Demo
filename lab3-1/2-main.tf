resource "google_service_account" "default" {
  account_id   = var.gsa_account_id
  display_name = "Custom SA for VM Instance"
}

resource "google_compute_instance" "my_gce" {
  name         = var.gce_name
  machine_type = var.gce_machine_type
  zone         = var.gce_zone

  tags = var.gce_tags

  boot_disk {
    initialize_params {
      image = var.gce_image
    }
  }

  network_interface {
    network = var.gce_network

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "sudo apt update && sudo apt upgrade && apt install nginx -y && systemctl start nginx"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}


resource "google_compute_region_disk" "regiondisk" {
  name          = var.disk_name
  type          = var.disk_type
  region        = var.disk_region
  size          = var.disk_size
  replica_zones = var.replica_zones
}

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_region_disk.regiondisk.id
  instance = google_compute_instance.my_gce.id
}