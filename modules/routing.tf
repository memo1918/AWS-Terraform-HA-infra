
resource "aws_route_table" "pTable" {
  vpc_id = aws_vpc.prod_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
    }

    tags = {Name = "publicRouteTable"}
}

resource "aws_route_table_association" "public_subnet1_association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.pTable.id
}
resource "aws_route_table_association" "public_subnet2_association" {
  subnet_id = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.pTable.id
}


# Private route table for private subnet 1
resource "aws_route_table" "subnet1_rt" {
  vpc_id = aws_vpc.prod_vpc.id
  tags = {
    Name = "subnet1_rt"
  }
}
#Private route table for private subnet 2
resource "aws_route_table" "subnet2_rt" {
  vpc_id = aws_vpc.prod_vpc.id
  tags = {
    Name = "subnet2_rt"
  }
}

# Private route table association with private subnet 1
resource "aws_route_table_association" "assoc-rt-private1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.subnet1_rt.id
}

# Private route table association with private subnet 2
resource "aws_route_table_association" "assoc-rt-private2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.subnet2_rt.id
}

resource "aws_route" "outbound-nat-route1" {
  route_table_id         = aws_route_table.subnet1_rt.id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id   = aws_instance.gluon-nat-instance1.primary_network_interface_id
}

resource "aws_route" "outbound-nat-route2" {
  route_table_id         = aws_route_table.subnet2_rt.id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id   = aws_instance.gluon-nat-instance2.primary_network_interface_id
}