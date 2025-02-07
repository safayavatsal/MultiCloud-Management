provider "azurerm" {
  features {}
}

# Include modules

# Create a PostgreSQL database
module "database" {
  count               = var.no_of_db_instances
  source             = "./modules/database"
  no_of_db_instances = var.no_of_db_instances
  db_user            = var.db_user
  db_password        = var.db_password
}

# Create load balancer and auto-scaling
module "lb" {
  count             = var.enable_autoscaling ? 1 : 0
  source           = "./modules/lb"
  name             = var.name
  resource_group   = module.vpc.resource_group_name
  location         = var.region
  webserver_count  = var.webserver_count
  backend_pool_id  = module.instance-template.backend_pool_id
}

# Create an instance template (VM Scale Set) for webserver for auto scaling
module "instance-template" {
  source              = "./modules/instance-template"
  name                = var.project
  env                 = var.env
  resource_group      = module.vpc.resource_group_name
  location            = var.region
  vnet_name           = module.vpc.vnet_name
  subnet_id           = module.vpc.subnet_id
  image               = var.image
  instance_type       = var.instance_type
  enable_autoscaling  = var.enable_autoscaling
}

# Create microservices/apps in each zone
module "microservice-instance" {
  count               = var.appserver_count
  source             = "./modules/microservice-instance"
  appserver_count    = var.appserver_count
  image              = var.image
  instance_type      = var.instance_type
  zones              = var.zones
  vnet_name          = module.vpc.vnet_name
  subnet_id          = module.vpc.subnet_id
}

# Create VPC (VNet) and subnets
module "vpc" {
  source         = "./modules/vpc"
  region         = var.region
  name           = var.name
}
