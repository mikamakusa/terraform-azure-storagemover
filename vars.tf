variable "storage_mover" {
  type = list(object({
    id                = number
    name              = string
    resource_group_id = optional(number)
    description       = optional(string)
    tags              = optional(map(string))
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "agent" {
  type = list(object({
    id                     = number
    arc_virtual_machine_id = optional(number)
    name                   = string
    storage_mover_id       = number
    description            = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "job_definition" {
  type = list(object({
    id                       = number
    copy_mode                = string
    name                     = string
    source_id                = number
    storage_mover_project_id = number
    target_id                = number
    source_sub_path          = optional(string)
    target_sub_path          = optional(string)
    agent_name               = optional(number)
    description              = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "project" {
  type = list(object({
    id               = number
    name             = string
    storage_mover_id = number
    description      = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "source_endpoint" {
  type = list(object({
    id               = number
    host             = string
    name             = string
    storage_mover_id = number
    export           = optional(string)
    nfs_version      = optional(string)
    description      = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "target_endpoint" {
  type = list(object({
    id                   = number
    name                 = string
    storage_account_id   = optional(number)
    storage_container_id = optional(number)
    storage_mover_id     = number
    description          = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "storage_account" {
  type = list(object({
    id                       = number
    account_replication_type = string
    account_tier             = string
    name                     = string
    resource_group_id        = optional(number)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "storage_container" {
  type = list(object({
    id                   = number
    name                 = string
    storage_account_id   = optional(number)
    storage_container_id = optional(number)
    storage_mover_id     = number
    description          = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "resource_group" {
  type = list(object({
    id       = number
    location = string
    name     = string
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "resource_group_name" {
  type    = string
  default = null
}

variable "storage_account_name" {
  type    = string
  default = null
}

variable "storage_container_name" {
  type    = string
  default = null
}

variable "arc_machine_name" {
  type    = string
  default = null
}

variable "tags" {
  type = map(string)
  default = {}
}