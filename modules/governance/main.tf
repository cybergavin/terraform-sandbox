#
# Create multiple resource groups with tags
#
resource "azurerm_resource_group" "rg" {
  for_each = { for rg in var.resource_groups : rg.name => rg }

  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}