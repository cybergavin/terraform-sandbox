#
# Create the common outbound routing table and associate it with the required subnets.
#
module "routing" {
  source              = "modules/routing"
  tenant              = var.tenant
  network_rg          = var.network_rg
  nva_pan_ip          = var.nva_pan_ip
  common_outbound_udr = var.common_outbound_udr
}

resource "azurerm_subnet_route_table_association" "rtb_common_outbound_bind" {
  for_each = toset(module.networks.subnet_ids)

  subnet_id      = each.value
  route_table_id = module.routing.rtb_common_outbound_id
}
