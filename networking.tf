module "aws_vpn" {
  source                = "./AWS/modules/aws-vpn"
  transit_gateway_id    = module.aws_transit_gateway.id
  aws_vpc_id            = module.aws_vpc.id
  gcp_vpn_gateway_ip    = module.gcp_vpn.external_ip
  azure_vpn_gateway_ip  = module.azure_vpn.external_ip
}

module "gcp_vpn" {
  source               = "./GCP/modules/gcp-vpn"
  gcp_network          = module.gcp_vpc.network_id
  aws_vpn_gateway_ip   = module.aws_vpn.external_ip
  azure_vpn_gateway_ip = module.azure_vpn.external_ip
}

module "azure_vpn" {
  source              = "./Azure/modules/azure-vpn"
  azure_vnet          = module.azure_vpc.vnet_id
  aws_vpn_gateway_ip  = module.aws_vpn.external_ip
  gcp_vpn_gateway_ip  = module.gcp_vpn.external_ip
}

module "aws_transit_gateway" {
  source         = "./modules/aws-transit-gateway"
  aws_vpc_id     = module.aws_vpc.id
  gcp_vpn_id     = module.gcp_vpn.id
  azure_vpn_id   = module.azure_vpn.id
}
