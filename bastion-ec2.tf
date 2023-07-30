resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.instance_type[0]
  subnet_id     = aws_subnet.public-bastion.id
  #key_name      = aws_key_pair.anael.key_name
  key_name                    = "anael1"
  associate_public_ip_address = "true"
  vpc_security_group_ids      = ["${aws_security_group.bastion.id}"]
  tags = {
    Name = "Batsion-ec2"

  }
}