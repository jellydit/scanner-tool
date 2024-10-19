resource "aws_security_group" "controller_sg" {
  vars
  ingress for admin access, cidr ranges restricted
  ingress for crawler access, cidr ranges restricted
  maybe egress outbound to all?
}

resource "aws_security_group" "crawler_sg" {
  vars
  egress outbound to all?
}
