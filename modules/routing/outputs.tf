output "rtb_gs_id" {
  value       = var.enable_gatewaysubnet_udr ? azurerm_route_table.rtb_gs[0].id : null
  description = "ID of the route table associated with the GatewaySubnet, if required"
}
output "rtb_common_outbound_id" {
  value       = var.enable_common_outbound_udr ? azurerm_route_table.rtb_common_outbound[0].id : null
  description = "ID of the common route table associated with subnets, if required"
}