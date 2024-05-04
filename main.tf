resource "azurerm_resource_group" "rg" {
  name     = "${local.naming_convention}-rg"
  location = var.az_region
  tags     = merge(local.default_tags, var.env_tags)
}

module "az_vm" {
  source = "git@github.com:G0rdonHill/terraform-modules.git//azure/az_vm?ref=master"

  naming_convention   = local.naming_convention
  rg_name             = azurerm_resource_group.rg.name
  vm_size             = "Standard_B1s"
  vm_hostname         = "ubuntuvm1"
  vm_admin_username   = var.vm_admin_username
  vm_admin_public_key = var.vm_admin_public_key
  default_tags        = local.default_tags
  public_access       = true

 depends_on = [ azurerm_resource_group.rg ]
}