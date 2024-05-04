resource "azurerm_resource_group" "rg" {
  name     = "${local.naming_convention}-rg"
  location = var.az_region
  tags     = merge(local.default_tags, var.env_tags)
}
