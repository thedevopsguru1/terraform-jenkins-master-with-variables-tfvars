resource "aws_vpc" "jenkins" {
  cidr_block = var.vpc

  tags = {
    Name = "Jenkins-vpc"
  }
}