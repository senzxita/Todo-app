variable "instance_type" {
  type        = string
  description = "The type of instance to create"
  
}

variable "tags" {
    type = map(string)
    default = {}
}

variable "key_name" {
    type        = string
    description = "The name of the key pair to use for the instance"
  
}

variable "name" {
    type        = string
    description = "The name tag for the EC2 instance"
  
}

variable "subnet_id" {
    type        = string
    description = "The ID of the subnet to launch the instance in"
}

variable "security_group_ids" {
    type = list(string)
    description = "A list of VPC security group IDs to associate with the instance"
  
}

variable "create_spot_instance" {
  description = "Whether to create a spot instance"
  type        = bool
  default     = false
}

variable "spot_price" {
  description = "Max price for spot instance"
  type        = string
  
}

variable "spot_instance_type" {
  description = "Spot instance type (one-time or persistent)"
  type        = string
  
}

variable "availability_zone" {
  description = "The availability zone to launch the instance in"
  type        = string
}



