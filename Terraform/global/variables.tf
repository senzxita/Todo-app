variable "key_name" {
  type        = string
  description = "The name of the key pair to use for the instance"
}
variable "public_key_path" {
  type        = string
  description = "The path to the public key file"
}
variable "environment" {
  type        = string
  description = "The path to the private key file"
}                           
variable "owner" {
  type        = string
  description = "The type of instance to create"
}
variable "managedBy" {
  type        = string
  description = "The tool managing the resources"
}