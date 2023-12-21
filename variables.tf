variable "name" {
  description = "Subnet set name, used to construct default subnet names."
  default     = null
  type        = string
}

variable "create_subnet" {
  description = "Boolean flag whether to create a shared route tables."
  default     = false
  type        = bool
}

variable "availability_zone" {
  type        = string
  default     = ""
  description = "AZ for the subnet."
}

variable "cidr_block" {
  type        = string
  default     = ""
  description = "The IPv4 CIDR block for the subnet."
}

variable "create_shared_route_table" {
  description = "Boolean flag whether to create a shared route tables."
  default     = false
  type        = bool
}

variable "create_route_table" {
  description = "Boolean flag whether to create a shared route tables."
  default     = false
  type        = bool
}

variable "associate_route_table" {
  description = "Boolean flag whether to create a shared route tables."
  default     = false
  type        = bool
}

variable "existing_route_table_id" {
  type        = string
  default     = ""
  description = "Id of an existing route table to associate with the subnet."
}

variable "route_table_name" {
  type        = string
  default     = ""
  description = "Name (tag) of a subnet and, optionally a route table, to create or use.  Defaults to `name` value."
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "(Required) The VPC ID."
}

variable "map_public_ip_on_launch" {
  type        = bool
  default     = false
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional|map) Map of tags to assign to created resources"
}

variable "global_tags" {
  description = "Optional map of arbitrary tags to apply to all the created resources."
  default     = {}
  type        = map(string)
}

variable "propagating_vgws" {
  description = "See the [provider's documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)."
  default     = []
  type        = list(string)
}
