variable "name" {
  description = "Subnet set name, used to construct default subnet names."
  default     = null
  type        = string
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
