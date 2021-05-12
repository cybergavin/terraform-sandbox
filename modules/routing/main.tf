#
# Create a Route Table with routes for the GatewaySubnet to direct
# Azure-inbound traffic from on-premises to the network virtual appliance.
#
resource "azurerm_route_table" "rtb_gs" {
  count                         = var.enable_gatewaysubnet_udr ? 1 : 0

  name                          = "${var.tenant}-rtb-GatewaySubnet-cc"
  location                      = "canadacentral"
  resource_group_name           = var.network_rg
  disable_bgp_route_propagation = false

  dynamic "route" {

    for_each = toset(var.gatewaysubnet_udr)

    content {
      name                   = format("${var.tenant}-rt-GatewaySubnet-%02d", "${index(var.gatewaysubnet_udr, route.value) + 1}")
      address_prefix         = route.value
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = var.nva_pan_ip
    }
  }
  # Ignore changes to tags as they may be added by Azure Policies and/or other methods
  # and don't affect the functionality of the resource.

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
#
# Create a Route Table with routes for association with most subnets
# to direct Azure-outbound traffic to the network virtual appliance.
#
resource "azurerm_route_table" "rtb_common_outbound" {
  count                         = var.enable_common_outbound_udr ? 1 : 0
  
  name                          = "${var.tenant}-rtb-common-outbound-cc"
  location                      = "canadacentral"
  resource_group_name           = var.network_rg
  disable_bgp_route_propagation = false

  dynamic "route" {

    for_each = toset(var.common_outbound_udr)

    content {
      name                   = format("${var.tenant}-rt-common-outbound-%02d", "${index(var.common_outbound_udr, route.value) + 1}")
      address_prefix         = route.value
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = var.nva_pan_ip
    }
  }
  # Ignore changes to tags as they may be added by Azure Policies and/or other methods
  # and don't affect the functionality of the resource.

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}