resource "google_compute_network" "xcloud-vpc" {
  name                    = "xcloud-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "xcloud-subnet" {
  name          = "${var.name}-subnet"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.xcloud-vpc.id
  region        = var.region
}

# GCP VPN Gateway
resource "google_compute_vpn_gateway" "xcloud_vpn" {
  name    = "xcloud-vpn"
  region  = var.region
  network = google_compute_network.xcloud-vpc.id
}

resource "google_compute_vpn_tunnel" "gcp_aws_tunnel" {
  name          = "gcp-aws-vpn-tunnel"
  region        = var.region
  vpn_gateway   = google_compute_vpn_gateway.xcloud_vpn.id
  peer_ip       = var.aws_vpn_public_ip
  shared_secret = var.vpn_shared_secret
  ike_version   = 2
}

resource "google_compute_route" "aws_route" {
  name       = "route-to-aws"
  network    = google_compute_network.xcloud-vpc.id
  dest_range = "10.0.0.0/16"
  next_hop_vpn_tunnel = google_compute_vpn_tunnel.gcp_aws_tunnel.id
}
