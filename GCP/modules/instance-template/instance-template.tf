data "template_file" "init" {
  template = file("${path.module}/scripts/startup.sh")
}

resource "google_compute_instance_template" "ws-instance_template" {
  count        = var.enable_autoscaling ? 1 : 0
  name         = "${var.name}-webserver-instance-template"
  project      = var.project
  machine_type = var.instance_type
  region       = var.region

  disk {
    source_image = var.image
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_self_link

    access_config {
      # Assign an ephemeral public IP
    }
  }

  metadata_startup_script = data.template_file.init.rendered

  tags = ["http"]

  labels = {
    environment = var.env
  }
}
