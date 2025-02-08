# data "aws_availability_zones" "available" {}

resource "aws_vpc" "xcloud-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "xcloud-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  count             = length(var.zones)
  vpc_id           = aws_vpc.xcloud-vpc.id
  availability_zone = var.zones[count.index]
  cidr_block       = "10.0.${10 + count.index}.0/24"

  tags = {
    Name = "xcloud-public-subnet-${count.index}"
  }
}

# AWS VPN Configuration
resource "aws_vpn_gateway" "xcloud_vpn" {
  vpc_id = aws_vpc.xcloud-vpc.id

  tags = {
    Name = "xcloud-vpn"
  }
}

resource "aws_vpn_connection" "aws_gcp_vpn" {
  vpn_gateway_id      = aws_vpn_gateway.xcloud_vpn.id
  customer_gateway_id = aws_customer_gateway.gcp_gateway.id
  type               = "ipsec.1"
  static_routes_only = true

  tags = {
    Name = "aws-gcp-vpn"
  }
}

resource "aws_customer_gateway" "gcp_gateway" {
  bgp_asn    = 65000
  ip_address = var.gcp_vpn_public_ip
  type       = "ipsec.1"
}
