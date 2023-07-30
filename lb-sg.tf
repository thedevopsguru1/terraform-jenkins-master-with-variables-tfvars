resource "aws_security_group" "lb" {
  name        = "SG-loadbalancer"
  vpc_id      = aws_vpc.jenkins.id
  description = "Security group for the load-balancer"
  ingress {
    from_port   = var.http[0]
    to_port     = var.http[0]
    protocol    = "TCP"
    cidr_blocks = [var.internet]
    description = "Allow incoming HTTP traffic from anywhere"
  }
  ingress {
    from_port   = var.http[1]
    to_port     = var.http[1]
    protocol    = "TCP"
    cidr_blocks = [var.internet]
    description = "Allow incoming HTTPS traffic from anywhere"
  }

  egress {
    from_port   = var.jenkins_port
    to_port     = var.jenkins_port
    protocol    = "TCP"
    cidr_blocks = [var.internet]

  }

  tags = {
    Name = "lb-sg"
  }
}