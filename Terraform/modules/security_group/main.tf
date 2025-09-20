resource "aws_security_group" "this" {
  description = var.description
  vpc_id      = var.vpc_id
  name = var.name
    tags = {
        Name        = var.name
        
    }
}

# Ingress Rule 
resource "aws_vpc_security_group_ingress_rule" "ingress" {
  security_group_id = aws_security_group.this.id
  description       = var.ingress_description
  cidr_ipv4         = var.ingress_cidr
  from_port         = var.ingress_from_port
  to_port           = var.ingress_to_port
  ip_protocol       = var.ingress_protocol
}

# Allow all egress
resource "aws_vpc_security_group_egress_rule" "allow_all" {
  security_group_id = aws_security_group.this.id
  description = "Allow all outbound traffic"
  cidr_ipv4   = "0.0.0.0/0" # all IPv4 addresses
  ip_protocol = "-1"       # -1 means all protocols
}



