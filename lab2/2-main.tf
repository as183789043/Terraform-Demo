resource "google_compute_network" "custom-vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "jp-subnet" {
  name          = var.jp_subnet_name
  ip_cidr_range = var.jp_subnet_cidr
  region        = var.jp_region
  network       = google_compute_network.custom-vpc.id
}

resource "google_compute_subnetwork" "jp-subnet2" {
  name          = var.jp2_subnet_name
  ip_cidr_range = var.jp2_subnet_cidr
  region        = var.jp2_region
  network       = google_compute_network.custom-vpc.id
}

resource "google_compute_subnetwork" "hk-subnet" {
  name          = var.hk_subnet_name
  ip_cidr_range = var.hk_subnet_cidr
  region        = var.hk_region
  network       = google_compute_network.custom-vpc.id
}


resource "google_compute_subnetwork" "sg-subnet" {
  name          = var.sg_subnet_name
  ip_cidr_range = var.sg_subnet_cidr
  region        = var.sg_region
  network       = google_compute_network.custom-vpc.id
}

resource "google_compute_firewall" "common-port" {
  name    = var.firewall_rule_name
  network = google_compute_network.custom-vpc.name

  allow {
    protocol = "tcp"
    ports    = var.firewall_ports
  }

  source_tags = var.firewall_source_tags
}