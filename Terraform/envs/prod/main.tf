module "app" {
  source = "../../modules/root"  # This points to the root folder

  region        = var.region
  profile       = var.profile
  vpc_id        = var.vpc_id
}

provider "aws" {
  region  = var.region
  profile = var.profile

  default_tags {
    tags = {
      owner       = var.owner_id
      environment = var.environment
      managedBy   = var.managedBy
    }
  }
}


module "prod_subnet" {
  source            = "../../modules/subnets"
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone
  environment       = var.environment
  name              = var.name_subnet
  tags = {
    name = var.name_subnet
  }
}

module "prod_sg" {
  source       = "../../modules/security_group"
  name         = var.name_sg
  description  = var.description_sg
  vpc_id       = var.vpc_id
  environment  = var.environment
  
  # Ingress — allow SSH
  ingress_cidr       = var.ingress_cidr
  ingress_description = var.ingress_description
  ingress_from_port  = var.ingress_from_port
  ingress_to_port    = var.ingress_to_port
  ingress_protocol   = var.ingress_protocol

  # Egress — allow all
  egress_cidr        = var.egress_cidr
  egress_description = var.egress_description
  egress_ip_protocol    = var.egress_ip_protocol
}



