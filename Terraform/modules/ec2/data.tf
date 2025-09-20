data "aws_ami" "rhel10" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9.0.0_HVM-20240227-x86_64-39-Hourly2-GP3"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["309956199498"] 
}
