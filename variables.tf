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

variable "assign_ipv6_address_on_creation" {
  type        = bool
  default     = false
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false"
}

variable "customer_owned_ipv4_pool" {
  type        = string
  nullable = true
  default     = null
  description = "The customer owned IPv4 address pool. Typically used with the map_customer_owned_ip_on_launch argument. The outpost_arn argument must be specified when configured."
}


variable "enable_dns64" {
  type        = bool
  default     = false
  description = "Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false."
}

variable "ipv6_cidr_block" {
  type = string
  default = null
  description = "The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length."
}

variable "ipv6_native" {
  type = bool
  default = false
  description = "Indicates whether to create an IPv6-only subnet. Default: false."
}

variable "map_customer_owned_ip_on_launch" {
  type = bool
  default = false
  description = "Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and outpost_arn arguments must be specified when set to true. Default is false."
}

variable "outpost_arn" {
  type = string
  default = null
  description = "The Amazon Resource Name (ARN) of the Outpost."
}

variable "private_dns_hostname_type_on_launch" {
  type = string
  default = null
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name."
}