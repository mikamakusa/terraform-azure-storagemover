data "azurerm_resource_group" "this" {
  name  = var.resource_group_name
}

data "azurerm_storage_account" "this" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_storage_container" "this" {
  name                 = var.storage_container_name
  storage_account_name = data.azurerm_resource_group.this.name
}

data "azurerm_arc_machine" "this" {
  name                = var.arc_machine_name
  resource_group_name = data.azurerm_resource_group.this.name
}