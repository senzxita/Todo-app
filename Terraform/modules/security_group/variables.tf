variable "name" {
  type        = string
  description = "The name tag for the security group"
}

variable "description" {
    type        = string
    description = "The description of the security group"
}

variable "vpc_id" {
    type        = string
    description = "The ID of the VPC where the security group will be created"
}

variable "environment" {
    type        = string
    description = "The environment tag for the security group (e.g., dev, qa, prod)"
}
variable "tags" {
    type = map(string)
    default = {}
}

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

#Egress Rules
variable "egress_description" {
    type        = string
    description = "The description for the egress rule"
}
variable "egress_cidr" {
  type        = string
  description = "The CIDR block for the egress rule"
}
variable "egress_ip_protocol" {
    type        = string
    description = "The protocol for the egress rule (e.g., tcp, udp, icmp)"      
}


