resource "azurerm_storage_account" "this" {
  count                    = length(var.resource_group) == "0" ? "0" : length(var.storage_account)
  account_replication_type = lookup(var.storage_account[count.index], "account_replication_type")
  account_tier             = lookup(var.storage_account[count.index], "account_tier")
  location                 = data.azurerm_resource_group.this.location
  name                     = lookup(var.storage_account[count.index], "name")
  resource_group_name      = data.azurerm_resource_group.this.name
}

resource "azurerm_storage_container" "this" {
  count = length(var.storage_account) == "0" ? "0" : length(var.storage_container)
  name  = lookup(var.storage_container[count.index], "name")
  storage_account_id = element(azurerm_storage_account.this.*.id, lookup(var.storage_container[count.index], "storage_account_id"))
}