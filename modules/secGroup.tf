resource "aws_security_group" "prod_secGroup" {
    name = "prod_secGroup"
    vpc_id = aws_vpc.prod_vpc.id
    description = "allow HTTP"
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["10.0.4.0/24","10.0.5.0/24"]
    }
   
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_security_group" "load_balancer_secGroup" {
    name = "load_balancer_secGroup"
    vpc_id = aws_vpc.prod_vpc.id
    description = "allow HTTP"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "gluon-sg-nat-instance" {
    name        = "nat-instance"
    description = "Security Group for NAT instance"
    vpc_id      = aws_vpc.prod_vpc.id
    tags = {
    Name = "sg-nat-instance"
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
        }
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["10.0.0.0/16"]
        }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }
}

resource "aws_security_group" "efs_secGroup" {
    name = "efs_secGroup"
    vpc_id = aws_vpc.prod_vpc.id
    description = "allow NFS"
    ingress {
        from_port = 2049
        to_port = 2049
        protocol = "tcp"
        cidr_blocks = ["10.0.2.0/24","10.0.3.0/24"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["10.0.2.0/24","10.0.3.0/24"]
    }
}