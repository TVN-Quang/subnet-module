output "id" {
    value = aws_subnet.this[0].id
}

output "name" {
    value = aws_subnet.this[0].tags.Name
}

output "cidr_block" {
    description = "The IPv4 CIDR block of the VPC."
    value = aws_subnet.this[0].cidr_block
}

output "tags" {
    value = aws_subnet.this[0].tags
}

output "read_route_table" {
  value = local.read_route_table
}

output "route_table" {
  value = local.route_table
}

output "route_table_shared" {
  value = aws_route_table.shared
}
output "unique_route_table_id" {
  value = var.create_shared_route_table ? { "shared" = aws_route_table.shared[0].id } : aws_route_table.this[0].id
}