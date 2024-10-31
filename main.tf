terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.21.0"
    }
  }
  cloud {
    organization = "katerynabakhmattest1"
    workspaces {
      name = "github-mymodule2"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-1ec09ce9-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "mymodule2" {
  source              = "app.terraform.io/katerynabakhmattest1/mymodule2/azurerm"
  version             = "1.0.0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = "mymodulestorage32"
}
