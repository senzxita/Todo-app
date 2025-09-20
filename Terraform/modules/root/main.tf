# module "dev_subnet" {
#   source            = "./modules/subnet"
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"
#   tags = {
#     env = "dev"
#   }
# }

# module "qa_subnet" {
#   source            = "./modules/subnet"
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-1b"
#   tags = {
#     env = "qa"
#   }
# }

# module "prod_subnet" {
#   source            = "./modules/subnet"
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.3.0/24"
#   availability_zone = "us-east-1c"
#   tags = {
#     env = "prod"
#   }
# }
