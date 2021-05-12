variable "resource_groups" {
  type        = list(any)
  description = "A list of Azure Resource Groups with locations and tags"
  default     = []
}
variable "tenant" {
  type        = string
  description = "(Required) The name of the Azure Tenant"
  default     = "noname"
}
variable "network_rg" {
  type        = string
  description = "(Required) The name of the resource group containing the Virtual Network Gateway's VNet"
  default     = "noname"
}
variable "nva_pan_ip" {
  type        = string
  description = "(Required) The IP address of the Loadbalancer for the PAN firewalls"
  default     = ""
}
variable "common_outbound_udr" {
  type        = list(any)
  description = "(Required) A list of external destination prefixes for routes that use the PAN-LB as the next hop address"
  default     = []
}
variable "vnets" {
  type        = list(any)
  description = "(Required) A list of Azure VNets with names and CIDR block lists"
  default     = []
}
variable "subnets" {
  type        = list(any)
  description = "(Required) A map of Azure Subnets with names and prefixes"
  default     = []
}
variable "enable_gatewaysubnet_udr" {
  type        = bool
  description = "(Required) Enable the deployment of the gatewaysubnet_udr route table"
  default     = false
}
variable "enable_common_outbound_udr" {
  type        = bool
  description = "(Required) Enable the deployment of the common_outbound_udr route table"
  default     = true
}