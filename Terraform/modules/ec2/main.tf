resource "aws_instance" "todo_ec2" {
  ami           = data.aws_ami.rhel10.id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  availability_zone = var.availability_zone

  dynamic "instance_market_options" {
    for_each = var.create_spot_instance ? [1] : []
    content {
      market_type = "spot"

      spot_options {
        max_price                    = var.spot_price
        spot_instance_type           = "persistent"
        instance_interruption_behavior = "terminate"
      }
    }
  }

  tags = {
    name = var.name
  }
}
