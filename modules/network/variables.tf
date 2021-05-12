variable "vnets" {
  type        = list(any)
  description = "(Required) A list of Azure VNets with names and CIDR block lists"
  default     = []
}

variable "subnets" {
  type        = list(any)
  description = "(Required) A list of Azure Subnets with names and prefixes"
  default     = []
}
