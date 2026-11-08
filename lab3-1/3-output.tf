output "Instance_ip" {
  value = google_compute_instance.my_gce.network_interface[0].access_config[0].nat_ip
}