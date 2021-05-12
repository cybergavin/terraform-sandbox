#
# Create Virtual Networks and Subnets
#
module "networks" {
  source  = "modules/network"
  vnets   = var.vnets
  subnets = var.subnets
}
