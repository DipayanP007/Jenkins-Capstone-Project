resource "azurerm_resource_group" "terraform_resource_rg" {
  name     = var.rg_name
  location = var.rg_location
  tags = local.tags
}