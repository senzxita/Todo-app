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





# # Egress Rule 
# resource "aws_vpc_security_group_egress_rule" "ssh" {
#   security_group_id = aws_security_group.this.id
#   description       = var.ssh_egress_description
#   cidr_ipv4         = var.ssh_egress_cidr
#   from_port         = var.ssh_egress_from_port
#   to_port           = var.ssh_egress_to_port
#   ip_protocol       = var.ssh_egress_protocol
# }

# resource "aws_vpc_security_group_egress_rule" "http" {
#   security_group_id = aws_security_group.this.id
#   description       = var.http_egress_description
#   cidr_ipv4         = var.http_egress_cidr
#   from_port         = var.http_egress_from_port
#   to_port           = var.http_egress_to_port
#   ip_protocol       = var.http_egress_protocol
# }
# resource "aws_vpc_security_group_egress_rule" "https" {
#   security_group_id = aws_security_group.this.id
#   description       = var.https_egress_description
#   cidr_ipv4         = var.https_egress_cidr
#   from_port         = var.https_egress_from_port
#   to_port           = var.https_egress_to_port
#   ip_protocol       = var.https_egress_protocol
# }
