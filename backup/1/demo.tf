resource "azurerm_resource_group" "rg" {
  name	   = "rg-expertslive-terraform"
  location = "westeurope"
}   

resource "azurerm_storage_account" "storage" {
  name					           = "saterraform564"
  resource_group_name	     = azurerm_resource_group.rg.name
  location				         = azurerm_resource_group.rg.location
  account_tier			       = "Standard"
  account_replication_type = "LRS"
  tags                     = {}
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-terraform-expertslive"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

provider "azurerm" {
  features {	
  }
}