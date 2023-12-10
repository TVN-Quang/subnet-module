
#### Create Subnets ####
resource "aws_subnet" "this" {
  cidr_block              = var.cidr_block
  availability_zone       = var.availability_zone
  vpc_id                  = var.vpc_id
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags                    = merge(var.global_tags, local.local_tags, { Name = local.name })

#   depends_on = [
#     var.has_secondary_cidrs
#   ]
}