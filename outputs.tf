output "storage_mover_id" {
  value = try(
    azurerm_storage_mover.this.*.id
  )
}

output "storage_mover_agent_id" {
  value = try(
    azurerm_storage_mover_agent.this.*.id
  )
}

output "storage_mover_project_id" {
  value = try(
    azurerm_storage_mover_project.this.*.id
  )
}

output "storage_mover_job_definition_id" {
  value = try(
    azurerm_storage_mover_job_definition.this.*.id
  )
}

output "storage_mover_source_endpoint_id" {
  value = try(
    azurerm_storage_mover_source_endpoint.this.*.id
  )
}

output "storage_mover_target_endpoint_id" {
  value = try(
    azurerm_storage_mover_target_endpoint.this.*.id
  )
}