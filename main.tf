resource "azurerm_storage_mover" "this" {
  count = (length(var.resource_group) || var.resource_group_name != null) == 0 ? 0 : length(var.storage_mover)
  location = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.location : element(
      data.azurerm_resource_group.this.*.location, lookup(var.storage_mover[count.index], "resource_group_id")
    )
  )
  name = lookup(var.storage_mover[count.index], "name")
  resource_group_name = try(
    var.resource_group_name != null ? data.azurerm_resource_group.this.name : element(
      data.azurerm_resource_group.this.*.name, lookup(var.storage_mover[count.index], "resource_group_id")
    )
  )
  description = lookup(var.storage_mover[count.index], "description")
  tags = merge(
    var.tags,
    lookup(var.storage_mover[count.index], "tags")
  )
}

resource "azurerm_storage_mover_agent" "this" {
  count = (length(var.storage_mover) && var.arc_machine_name != null) == 0 ? 0 : length(var.agent)
  arc_virtual_machine_id = try(
    data.azurerm_arc_machine.this.id
  )
  arc_virtual_machine_uuid = try(
    data.azurerm_arc_machine.this.vm_uuid
  )
  name = lookup(var.agent[count.index], "name")
  storage_mover_id = try(
    element(azurerm_storage_mover.this.*.id, lookup(var.agent[count.index], "storage_mover_id"))
  )
  description = lookup(var.agent[count.index], "description")
}

resource "azurerm_storage_mover_job_definition" "this" {
  count = (length(var.storage_mover) &&
    length(var.agent) &&
    length(var.source_endpoint) &&
  length(var.target_endpoint)) == 0 ? 0 : length(var.job_definition)
  copy_mode = lookup(var.job_definition[count.index], "copy_mode")
  name      = lookup(var.job_definition[count.index], "name")
  source_name = try(
    element(azurerm_storage_mover_source_endpoint.this.*.name, lookup(var.job_definition[count.index], "source_id"))
  )
  storage_mover_project_id = try(
    element(azurerm_storage_mover_project.this.*.id, lookup(var.job_definition[count.index], "storage_mover_project_id"))
  )
  target_name = try(
    element(azurerm_storage_mover_target_endpoint.this.*.name, lookup(var.job_definition[count.index], "target_id"))
  )
  source_sub_path = lookup(var.job_definition[count.index], "source_sub_path")
  target_sub_path = lookup(var.job_definition[count.index], "target_sub_path")
  agent_name = try(
    element(azurerm_storage_mover_agent.this.*.name, lookup(var.job_definition[count.index], "agent_id"))
  )
  description = lookup(var.job_definition[count.index], "description")
}

resource "azurerm_storage_mover_project" "this" {
  count = length(var.storage_mover) == 0 ? 0 : length(var.project)
  name  = lookup(var.project[count.index], "name")
  storage_mover_id = try(
    element(azurerm_storage_mover.this.*.id, lookup(var.project[count.index], "storage_mover_id"))
  )
  description = lookup(var.project[count.index], "description")
}

resource "azurerm_storage_mover_source_endpoint" "this" {
  count = length(var.storage_mover) == 0 ? 0 : length(var.source_endpoint)
  host  = lookup(var.storage_mover[count.index], "host")
  name  = lookup(var.storage_mover[count.index], "name")
  storage_mover_id = try(
    element(azurerm_storage_mover.this.*.id, lookup(var.source_endpoint[count.index], "storage_mover_id"))
  )
  export      = lookup(var.storage_mover[count.index], "export")
  nfs_version = lookup(var.storage_mover[count.index], "nfs_version")
  description = lookup(var.storage_mover[count.index], "description")
}

resource "azurerm_storage_mover_target_endpoint" "this" {
  count = ((length(var.storage_account) || var.storage_account_name != null) &&
    (length(var.storage_container) || var.storage_container_name != null) &&
  length(var.storage_mover)) == 0 ? 0 : length(var.target_endpoint)
  name = lookup(var.target_endpoint[count.index], "name")
  storage_account_id = try(
    var.storage_account_name != null ? data.azurerm_storage_account.this.id : element(
      azurerm_storage_account.this.*.id, lookup(var.target_endpoint[count.index], "storage_account_id")
    )
  )
  storage_container_name = try(
    var.storage_container_name != null ? data.azurerm_storage_container.this.name : element(
      azurerm_storage_container.this.*.name, lookup(var.target_endpoint[count.index], "storage_container_id")
    )
  )
  storage_mover_id = try(
    element(azurerm_storage_mover.this.*.id, lookup(var.target_endpoint[count.index], "storage_mover_id"))
  )
  description = lookup(var.target_endpoint[count.index], "description")
}