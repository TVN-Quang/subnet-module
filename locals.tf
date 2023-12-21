locals {
  local_tags       = var.tags
  name             = var.name
  read_route_table = var.create_shared_route_table == false && try(var.create_route_table, var.create_subnet, true) == false
  # read_route_table = true
  route_table     = local.read_route_table == false ? aws_route_table.this : data.aws_route_table.this
  existing_route_table_id = try(var.existing_route_table_id, null)
  associate_route_table   = try(var.associate_route_table, true)
  route_table_name        = try(var.route_table_name, null)
}
