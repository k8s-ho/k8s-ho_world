# vpc
resource "aws_vpc" "my_vpc" {
	cidr_block = var.vpc_cidr_block
	tags = {
		Name = "kingho-world"
	}	
}


# subnet
resource "aws_subnet" "pub_subnet_1" {
	vpc_id = aws_vpc.my_vpc.id
	cidr_block = var.pub_subnet_cidr_block
	availability_zone = var.availability_zone
	tags = {
		Name = "pub-subnet-1"
	}
}

resource "aws_subnet" "prv_subnet_1" {
	vpc_id = aws_vpc.my_vpc.id
	cidr_block = var.prv_subnet_cidr_block
	availability_zone = var.availability_zone
	tags = {
		Name = "prv-subnet-1"
	}
}


# internet gateway
resource "aws_internet_gateway" "igw" {
	vpc_id = aws_vpc.my_vpc.id
	tags = {
		Name = "Internet gateway"
	}
}


# route table
resource "aws_route_table" "pub_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "prv_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}


# route table association
resource "aws_route_table_association" "pub_route_table_asso" {
  subnet_id      = aws_subnet.pub_subnet_1.id
  route_table_id = aws_route_table.pub_route_table.id
}

resource "aws_route_table_association" "prv_route_table_asso" {
  subnet_id      = aws_subnet.prv_subnet_1.id
  route_table_id = aws_route_table.prv_route_table.id
}


# private subnet-nat gateway connection
resource "aws_route" "prv_subnet_natgateway" {
  route_table_id              = aws_route_table.prv_route_table.id
  destination_cidr_block      = "0.0.0.0/0"
  nat_gateway_id              = aws_nat_gateway.nat_gateway.id
}


# eip
resource "aws_eip" "nat_ip_1"{
	domain = "vpc"
	lifecycle {
    	create_before_destroy = true
 	}
}


# nat gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_ip_1.id

  subnet_id = aws_subnet.pub_subnet_1.id

  tags = {
    Name = "nat-gateway"
  }
}
