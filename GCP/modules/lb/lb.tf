resource "google_compute_instance_group_manager" "webservers-group-manager" {
  name               = "${var.name}-instance-group-manager"
  project            = var.project
  base_instance_name = "${var.name}-webserver-instance"
  zone               = var.zones[0]
  target_size        = var.webserver_count

  version {
    name              = "ws1"
    instance_template = var.ws-instance_template
  }

  named_port {
    name = "http"
    port = 80
  }
}

resource "google_compute_autoscaler" "autoscaler" {
  name    = "${var.name}-scaler"
  project = var.project
  zone    = var.zones[0]
  target  = google_compute_instance_group_manager.webservers-group-manager.self_link

  autoscaling_policy {
    max_replicas    = 2
    min_replicas    = 1
    cooldown_period = 90

    cpu_utilization {
      target = 0.8
    }
  }
}

resource "google_compute_http_health_check" "healthcheck" {
  name        = "${var.name}-healthcheck"
  project     = var.project
  port        = 80
  request_path = "/"
}

resource "google_compute_backend_service" "backend_service" {
  name          = "${var.name}-backend-service"
  project       = var.project
  port_name     = "http"
  protocol      = "HTTP"
  health_checks = [google_compute_http_health_check.healthcheck.self_link]
}

resource "google_compute_global_forwarding_rule" "global_forwarding_rule" {
  name       = "${var.name}-global-forwarding-rule"
  project    = var.project
  target     = google_compute_backend_service.backend_service.self_link
  port_range = "80"
}
