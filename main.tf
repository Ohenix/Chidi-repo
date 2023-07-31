# Networking for project Lezuha

resource "aws_vpc" "Chidi-VPC" {
  cidr_block            = var.vpc-cidr
  instance_tenancy      = var.tenancy-state
  enable_dns_hostnames   = var.domain-change
 


  tags = {
    Name = "Chidi-VPC"
  }
}

# Public subnet

resource "aws_subnet" "Chidi-pub-subnet" {
  vpc_id            = aws_vpc.Chidi-VPC.id
  cidr_block        = var.pub-cidr
  availability_zone = var.az1

  tags = {
    Name = "Chidi-pub-subnet"
  }
}

resource "aws_subnet" "Chidi-pub-subnet2" {
  vpc_id            = aws_vpc.Chidi-VPC.id
  cidr_block        = var.pub-cidr1
  availability_zone = var.az1

  tags = {
    Name = "Chidi-pub-subnet2"
  }
}

# private subnet

resource "aws_subnet" "Chidi-private-subnet" {
  vpc_id            = aws_vpc.Chidi-VPC.id
  cidr_block        = "10.0.150.0/24"
  availability_zone = "eu-west-2b"


  tags = {
    Name = "Chidi-private-subnet"

  }
}

resource "aws_subnet" "Chidi-private-subnet2" {
  vpc_id            = aws_vpc.Chidi-VPC.id
  cidr_block        = "10.0.155.0/24"
  availability_zone = "eu-west-2b"


  tags = {
    Name = "Chidi-private-subnet2"

  }
}


# public route table

resource "aws_route_table" "Chidi-pub-RT" {
  vpc_id = aws_vpc.Chidi-VPC.id

  tags = {
    Name = "Chidi-pub-RT"
  }
}


# associate public subnet to public route

resource "aws_route_table_association" "Chidi-RT-assoc-to-Pub-Subnet" {
  subnet_id      = aws_subnet.Chidi-pub-subnet.id
  route_table_id = aws_route_table.Chidi-pub-RT.id
}


# private route table

resource "aws_route_table" "Chidi-private-RT" {
  vpc_id = aws_vpc.Chidi-VPC.id

  tags = {
    Name = "Chidi-private-RT"
  }
}

# associate private subnet to private route table

resource "aws_route_table_association" "Chidi-RT-assoc-to-Private-Subnet" {
  subnet_id      = aws_subnet.Chidi-private-subnet.id
  route_table_id = aws_route_table.Chidi-private-RT.id
}







