data "azurerm_resource_group" "this" {
  count = var.resource_group_name ? 1 : 0
  name  = var.resource_group_name
}

data "azurerm_storage_account" "this" {
  count               = var.storage_account_name ? 1 : 0
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_storage_container" "this" {
  count                = var.storage_container_name ? 1 : 0
  name                 = var.storage_container_name
  storage_account_name = data.azurerm_resource_group.this.name
}

data "azurerm_arc_machine" "this" {
  count               = var.arc_machine_name ? 1 : 0
  name                = var.arc_machine_name
  resource_group_name = data.azurerm_resource_group.this.name
}