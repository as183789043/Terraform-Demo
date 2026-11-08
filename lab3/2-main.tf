resource "google_service_account" "default" {
  account_id   = var.gsa_account_id
  display_name = "Custom SA for VM Instance"
}

resource "google_compute_instance" "my_gce" {
  name         = var.gce_name
  machine_type = var.gce_machine_type
  zone         = var.gce_zone

  tags = ["foo", "bar"]

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


  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
