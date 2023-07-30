resource "aws_eip" "eip" {
  #instance = aws_instance.web.id
  # vpc = true #  This is deprecated , use domain = "vpc" instead
  domain = "vpc"
  tags = {
    Name = "Jenkins-eip"
  }
}