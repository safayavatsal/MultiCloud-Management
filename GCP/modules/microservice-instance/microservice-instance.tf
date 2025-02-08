resource "random_id" "app_name_suffix" {
  byte_length = 4
}

resource "google_compute_instance" "apps" {
  for_each     = toset(var.zones)
  name         = "apps-${random_id.app_name_suffix.hex}-${each.key}"
  machine_type = var.instance_type
  zone         = each.key

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_self_link

    access_config {
      // Assigns an ephemeral external IP
    }
  }
}
