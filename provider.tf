terraform {
  required_version = ">= 0.15"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.58.0"
    }
  }
  backend "pg" {} # PostgreSQL backend - pass connection string with credentials during init
}
provider "azurerm" {
  features {}
}