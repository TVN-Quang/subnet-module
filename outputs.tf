output "id" {
    value = aws_subnet.this.id
}

output "cidr_block" {
    description = "The IPv4 CIDR block of the VPC."
    value = aws_subnet.this.cidr_block
}

output "tags" {
    value = aws_subnet.this.tags
}