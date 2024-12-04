
# Build the NAT Instance
resource "aws_instance" "gluon-nat-instance1" {
  ami                         = var.nat_ami
  instance_type               = var.nat_type
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.gluon-sg-nat-instance.id]
  source_dest_check           = false
  associate_public_ip_address = true

  tags = {
    Name = "gluon-nat-instance1"
  }
}

resource "aws_instance" "gluon-nat-instance2" {
  ami                         = var.nat_ami
  instance_type               = var.nat_type
  subnet_id                   = aws_subnet.public_subnet2.id
  vpc_security_group_ids      = [aws_security_group.gluon-sg-nat-instance.id]
  source_dest_check           = false
  associate_public_ip_address = true

  tags = {
    Name = "gluon-nat-instance2"
  }
}