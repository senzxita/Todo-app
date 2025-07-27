module "app" {
  source = "../../modules/root"  # This points to the root folder

  region        = var.region
  profile       = var.profile
  vpc_id        = var.vpc_id
#   instance_type = var.instance_type
#   ami_id        = var.ami_id
  # pass all required variables
}

provider "aws" {
  region  = var.region
  profile = var.profile
}





data "aws_vpc" "shared" {
    id = var.vpc_id
}

