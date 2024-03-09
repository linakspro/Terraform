//Associate Subnet with Route Table
resource "aws_route_table_association" "demo-rt-association" {
  subnet_id = aws_subnet.demo-subnet.id
  route_table_id = aws_route_table.demo-rt.id
}