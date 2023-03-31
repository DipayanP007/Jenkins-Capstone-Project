terraform {
  required_version = "~>1.3.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.45.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "tfstatebackendd"
    container_name       = "state-backend"
    key                  = "resourcegroup/terraform.tfstate"
  }
}