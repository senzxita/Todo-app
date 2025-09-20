resource "aws_key_pair" "shared" {
  key_name   = var.key_name
  public_key = var.public_key_path

  tags = {
    environment = var.environment
    owner       = var.owner
    ManagedBy   = var.managedBy
  }
}
