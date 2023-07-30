resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.jenkins.id # This attach igw to vpc
  tags = {
    Name = "jenkins-igw"
  }
}