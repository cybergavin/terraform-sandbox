#
# Create multiple virtual networks
#
resource "azurerm_virtual_network" "vnets" {
  for_each = { for vnet in var.vnets : vnet.name => vnet }

  name                = each.key
  address_space       = each.value.cidr_prefixes
  location            = each.value.location
  resource_group_name = each.value.resource_group

  # Ignore changes to tags as they may be added by Azure Policies and/or other methods
  # and don't affect the functionality of the resource.

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
#
# Create multiple subnets
#
resource "azurerm_subnet" "snets" {
  for_each = { for snet in var.subnets : snet.name => snet }

  name                 = each.key
  address_prefixes     = each.value.cidr_prefix
  resource_group_name  = each.value.resource_group
  virtual_network_name = each.value.vnet
  service_endpoints    = each.value.service_endpoints

  # Ignore changes to delegation and network policies as they may be created
  # separately, as required (e.g. automatically by Azure services)

  lifecycle {
    ignore_changes = [
      delegation,
      enforce_private_link_endpoint_network_policies,
      enforce_private_link_service_network_policies
    ]
  }
}