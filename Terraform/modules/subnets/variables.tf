variable "vpc_id" {
    type = string
    description = "The ID of the shared VPC to deploy resources in"
    
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block for the subnet"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone for the subnet"
}

variable "environment" {
  type        = string
  description = "The environment tag for the subnet (e.g., dev, qa, prod)"
}

variable "name" {
  type        = string
  description = "The name tag for the subnet"
}

variable "tags" {
  type = map(string)
  default = {}
}









# variable "dev_subnet" {
#   description = "Map of subnets to create"
#   type = map(object({
#     cidr_block = string
#     az         = string
#   }))
# }

# variable "qa_subnet" {
#   description = "Map of subnets to create"
#   type = map(object({
#     cidr_block = string
#     az         = string
#   }))
# }

# variable "prod_subnet" {
#   description = "Map of subnets to create"
#   type = map(object({
#     cidr_block = string
#     az         = string
#   }))
# }

