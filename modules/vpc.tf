resource "aws_vpc" "prod_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = { Name = "prod_vpc"
  }
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.prod_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "eu-central-1a"
    tags = { Name = "subnet1"
  }
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.prod_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "eu-central-1b"
    tags = { Name = "subnet2"
  }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.prod_vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "eu-central-1a"

    tags = { Name = "public_subnet1"
    }
}

resource "aws_subnet" "public_subnet2" {
    vpc_id = aws_vpc.prod_vpc.id
    cidr_block = "10.0.5.0/24"
    availability_zone = "eu-central-1b"

    tags = { Name = "public_subnet2"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.prod_vpc.id
    tags = { Name = "gw"
    }
}