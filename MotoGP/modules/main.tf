# here we create only resources and providers are defined into the 
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.project}-vpc"
    enviorment = var.enviorment  
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.16.0/20"

  tags = {
    Name = "${var.project}-private-subnet"
    enviorment = var.enviorment
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/20"

  tags = {
    Name = "${var.project}-private-subnet"
    enviorment = var.enviorment
  }
}