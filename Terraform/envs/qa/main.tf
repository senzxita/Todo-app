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


module "qa_subnet" {
  source            = "../../modules/subnets"
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone
  environment       = var.environment
  name = var.name_subnet
  tags = {
    name = var.name_subnet
  }
}

module "qa_sg" {
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
  egress_ip_protocol = var.egress_ip_protocol
}

  # # Egress — allow SSH
  # ssh_egress_cidr        = var.ssh_egress_cidr
  # ssh_egress_description = var.ssh_egress_description
  # ssh_egress_from_port   = var.ssh_egress_from_port
  # ssh_egress_to_port     = var.ssh_egress_to_port
  # ssh_egress_protocol    = var.ssh_egress_protocol

  # # Egress — allow HTTP
  # http_egress_cidr        = var.http_egress_cidr
  # http_egress_description = var.http_egress_description
  # http_egress_from_port   = var.http_egress_from_port
  # http_egress_to_port     = var.http_egress_to_port
  # http_egress_protocol    = var.http_egress_protocol

  # # Egress — allow HTTPS
  # https_egress_cidr        = var.https_egress_cidr
  # https_egress_description = var.https_egress_description
  # https_egress_from_port   = var.https_egress_from_port
  # https_egress_to_port     = var.https_egress_to_port
  # https_egress_protocol    = var.https_egress_protocol

