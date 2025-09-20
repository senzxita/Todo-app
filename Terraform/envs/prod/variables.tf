variable "region" {
  type = string
  description = "The AWS region to deploy resources in"
}
variable "profile" {
  type = string
  description = "The AWS profile to use for authentication"
}
variable "owner_id" {
  type        = string
  description = "The owner ID for the resources"
}
variable "managedBy" {
    type = string
    description = "The tool managing the resources"
}
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
variable "name_subnet" {
  type        = string
  description = "The name tag for the subnet"
}

# variables for security group
variable "name_sg" {
  type        = string
  description = "The name tag for the security group"
}
variable "description_sg" {
  type        = string
  description = "The description of the security group"
}

# Ingress — allow SSH rules
variable "ingress_cidr" {
  type        = string
  description = "The CIDR block for the ingress rule"
}
variable "ingress_description" {
    type        = string
    description = "The description for the ingress rule"
}
variable "ingress_from_port" {
  type        = number
  description = "The starting port for the ingress rule"
}
variable "ingress_to_port" {
  type        = number
  description = "The ending port for the ingress rule"
}
variable "ingress_protocol" {
  type        = string
  description = "The protocol for the ingress rule (e.g., tcp, udp, icmp)"      
}

# Egress — allow all rules
variable "egress_cidr" {
    type        = string
    description = "The CIDR block for the egress rule"
}
variable "egress_description" {
  type        = string
  description = "The description for the egress rule"
}

variable "egress_ip_protocol" {
    type        = string
    description = "The protocol for the egress rule (e.g., tcp, udp, icmp)"      
}

