resource "aws_security_group" "jenkins" {
  name        = "SG-web"
  vpc_id      = aws_vpc.jenkins.id
  description = "Security group for jenkins"
  ingress {
    from_port       = var.ssh
    to_port         = var.ssh
    protocol        = "TCP"
    security_groups = ["${aws_security_group.bastion.id}"]
    description     = "Allow incoming SSH traffic from bastion hosts"
  }
  ingress {
    from_port = var.jenkins_port
    to_port   = var.jenkins_port
    protocol  = "TCP"
    # cidr_blocks = ["0.0.0.0/0"]
    security_groups = ["${aws_security_group.lb.id}"]
    description     = "Allow incoming tcp from LB"
  }
  egress {
    from_port   = var.all
    to_port     = var.all
    cidr_blocks = [var.internet]
    protocol    = "-1"
    description = "Allow all outgoing traffic"
  }
  tags = {
    Name = "jenkins-sg"
  }

}