module "app" {
  source        = "../../modules/root"  # This points to the root folder
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

module "dev_subnet" {
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

module "dev_sg" {
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

module "dev_ec2" {
  source = "../../modules/ec2"

  name = var.name_ec2

  create_spot_instance = var.create_spot_instance
  spot_price           = var.max_price
  spot_instance_type            = var.spot_type

  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = module.dev_subnet.subnet_id
  security_group_ids = [module.dev_sg.security_group_id]
  availability_zone = var.availability_zone

  tags = {
    name        = var.name_ec2
    environment = var.environment
  }
}




#   instance_type          = var.instance_type
#   key_name               = var.key_name
#   subnet_id              = module.dev_subnet.id
#   vpc_security_group_ids = [module.dev_sg.id]
#   market_type = var.market_type
#   max_price   = var.max_price

#   tags = {
#     name        = var.name_ec2
    
#   }
# }


