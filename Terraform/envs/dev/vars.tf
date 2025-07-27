variable "region" {
    type = string
    description = "The AWS region to deploy resources in"
}

variable "profile" {
    type = string
    description = "The AWS profile to use for authentication"
}

variable "vpc_id" {
    type = string
    description = "The ID of the shared VPC to deploy resources in"
}