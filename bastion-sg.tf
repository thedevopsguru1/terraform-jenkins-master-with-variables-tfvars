resource "aws_security_group" "bastion" {
  name        = "Bastion-sg"
  vpc_id      = aws_vpc.jenkins.id
  description = "Security group for bastion hosts"
  ingress {
    from_port   = var.ssh
    to_port     = var.ssh
    protocol    = "TCP"
    cidr_blocks = [var.internet]
    description = "Allow incoming SSH from management IPs"
  }


  egress {
    from_port   = var.ssh
    to_port     = var.ssh
    cidr_blocks = [var.internet]
    protocol    = "TCP"
    description = "Allow ssh outgoing traffic to jenkins"
  }
  tags = {
    Name = "Bastion-sg"
  }
}