# NAT ROUTE 
resource "aws_route_table" "nat" {
  vpc_id = aws_vpc.jenkins.id
  route {
    cidr_block     = var.internet
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = " route table private"
  }
}