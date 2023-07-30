resource "aws_subnet" "public-bastion" {
  availability_zone       = var.az[0]
  cidr_block              = var.subnet_cidr[0]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.jenkins.id
  tags = {
    Name = "bastion-subnet"
  }
}
resource "aws_subnet" "public-lb" {
  availability_zone       = var.az[1]
  cidr_block              = var.subnet_cidr[1]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.jenkins.id
  tags = {
    Name = "lb-subnet"
  }
}

resource "aws_subnet" "nat" {
  availability_zone       = var.az[2]
  cidr_block              = var.subnet_cidr[2]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.jenkins.id
  tags = {
    Name = "nat-subnet"
  }
}
resource "aws_subnet" "jenkins" {
  availability_zone       = var.az[1]
  cidr_block              = var.subnet_cidr[3]
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.jenkins.id
  tags = {
    Name = "jenkins-subnet"
  }
}