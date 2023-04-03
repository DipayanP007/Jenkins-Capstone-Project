terraform {
  required_version = "~>1.3.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.45.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "adostoragetest"
    container_name       = "tfbackend"
    key                  = "resourcegroup/terraform.tfstate"
    # resource_group_name  = "ado-rg"
    # use_msi              = true
    # subscription_id      = "b00e9e00-4924-464f-929d-7c28ccf1a449"
    # tenant_id            = "19808729-db27-4d6e-8315-1ba7d75db983"
  }
}