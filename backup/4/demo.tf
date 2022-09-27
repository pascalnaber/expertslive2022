resource "azurerm_resource_group" "rg" {
  name	   = "rg-expertslive-terraform"
  location = "westeurope"

  tags = {
    Environment = "nonprod"
    Team        = "Freelancers"
    Project     = "ExpertsLive"
  }
}   

# resource "azurerm_storage_account" "storage" {
#   name					           = "saterraform564"
#   resource_group_name	     = azurerm_resource_group.rg.name
#   location				         = azurerm_resource_group.rg.location
#   account_tier			       = "Standard"
#   account_replication_type = "LRS"
#   tags                     = {}
# }

module "storage" {
  source = "./modules/storage_account"

  name				        = "saterraform564"
  resource_group_name = azurerm_resource_group.rg.name
  location			      = azurerm_resource_group.rg.location
}

module "storage" {
  source = "github.com/pascalnaber/terraformdemomodules/storage_account"

  name				        = "saterraform564"
  resource_group_name = azurerm_resource_group.rg.name
  location			      = azurerm_resource_group.rg.location
}

data "azurerm_container_registry" "acr" {
  name                = "aksupdates"
  resource_group_name = "aksupdates-common"
} 

resource "azurerm_role_assignment" "acrroleassignment" {
  principal_id					= "d9141928-c9bb-47c1-abd0-8ec791934181"
  role_definition_name	= "AcrPull"
  scope							    = data.azurerm_container_registry.acr.id
}

provider "azuread" {
}

provider "azurerm" {
  features {	
  }
}