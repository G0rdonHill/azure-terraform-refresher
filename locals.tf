locals {
  naming_convention = join("-", [var.resource_prefix, terraform.workspace])
  rg_name           = azurerm_resource_group.rg.name
  az_region         = azurerm_resource_group.rg.location
  default_tags = {
    Project     = "Azure Refresher"
    Owner       = "Gordon Hill"
    Provisioner = "Terraform v1.8.2"
    Environment = terraform.workspace
  }
}