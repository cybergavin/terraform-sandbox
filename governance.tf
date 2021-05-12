#
# Create Resource groups with tags
#
module "resource_groups" {
  source          = "modules/governance"
  resource_groups = var.resource_groups
}
