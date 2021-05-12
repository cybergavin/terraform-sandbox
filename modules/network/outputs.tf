output "subnet_ids" {
  value = [
    for snet in values(azurerm_subnet.snets)[*] : snet.id
    if snet.name != "GatewaySubnet"
  ]
  description = "List of subnet IDs for all subnets other than the GatewaySubnet"
}