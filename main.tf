
#### Existing Subnets ####
data "aws_subnet" "this" {
  count  = var.create_subnet ? 0 : 1
  tags   = { Name = local.name }
  vpc_id = var.vpc_id
}

#### Create Subnets ####
resource "aws_subnet" "this" {
  count                   = var.create_subnet ? 1 : 0
  cidr_block              = var.cidr_block
  availability_zone       = var.availability_zone
  vpc_id                  = var.vpc_id
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags                    = merge(var.global_tags, local.local_tags, { Name = local.name })

  #   depends_on = [
  #     var.has_secondary_cidrs
  #   ]
}

#### NACL association
# resource "aws_network_acl_association" "main" {
#   for_each       = var.nacl_associations
#   network_acl_id = local
#   subnet_id      = local.subnets[each.key].id
# }

#### One route table per each subnet by default #### 

data "aws_route_table" "this" {
  count          = local.read_route_table ? 1 : 0
  vpc_id         = var.vpc_id
  route_table_id = local.existing_route_table_id
  tags           = { Name = coalesce(var.route_table_name, local.name) }
}

resource "aws_route_table" "this" {
  count = !local.read_route_table && !var.create_shared_route_table ? 1 : 0

  vpc_id           = var.vpc_id
  tags             = merge(var.global_tags, local.local_tags, { Name = coalesce(local.route_table_name, local.name) })
  propagating_vgws = var.propagating_vgws
}

resource "aws_route_table" "shared" {
  count = !local.read_route_table && var.create_shared_route_table ? 1 : 0

  vpc_id           = var.vpc_id
  tags             = merge(var.global_tags, local.local_tags, { Name = local.route_table_name })
  propagating_vgws = var.propagating_vgws
}

resource "aws_route_table_association" "this" {
  count =  var.associate_route_table ? 1 : 0

  subnet_id      = aws_subnet.this[0].id
  route_table_id = !var.create_shared_route_table ? local.route_table.id : aws_route_table.shared[0].id
}
