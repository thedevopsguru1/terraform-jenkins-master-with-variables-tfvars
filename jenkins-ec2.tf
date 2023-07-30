resource "aws_instance" "jenkins" {
  ami           = var.ami
  instance_type = var.instance_type[1]
  subnet_id     = aws_subnet.jenkins.id
  #key_name      = aws_key_pair.anael.key_name
  key_name               = "anael1"
  vpc_security_group_ids = ["${aws_security_group.jenkins.id}"]
  user_data              = file("install.sh")
  #this will attach the role to ec2 using profile
  iam_instance_profile = aws_iam_instance_profile.jenkins5.name
  tags = {
    Name = "jenkins-ec2"

  }

  depends_on = [aws_iam_instance_profile.jenkins5]





}