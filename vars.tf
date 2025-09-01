variable "storage_mover" {
  type = list(object({
    id                = string
    name              = string
    resource_group_id = optional(string)
    description       = optional(string)
    tags              = optional(map(string))
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "agent" {
  type = list(object({
    id                     = string
    arc_virtual_machine_id = optional(string)
    name                   = string
    storage_mover_id       = string
    description            = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "job_definition" {
  type = list(object({
    id                       = string
    copy_mode                = string
    name                     = string
    source_id                = string
    storage_mover_project_id = string
    target_id                = string
    source_sub_path          = optional(string)
    target_sub_path          = optional(string)
    agent_id                 = optional(string)
    description              = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF

  validation {
    condition     = alltrue([for job in var.job_definition : true if contains(["Additive", "Mirror"], job.copy_mode)])
    error_message = "Specifies the strategy to use for copy. Possible values are Additive and Mirror."
  }
}

variable "project" {
  type = list(object({
    id               = string
    name             = string
    storage_mover_id = string
    description      = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "source_endpoint" {
  type = list(object({
    id               = string
    host             = string
    name             = string
    storage_mover_id = string
    export           = optional(string)
    nfs_version      = optional(string)
    description      = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF

  validation {
    condition     = alltrue([for source in var.source_endpoint : true if contains(["NFSAuto", "NFSv3", "NFSv4"], source.nfs_version)])
    error_message = "Specifies the NFS protocol version. Possible values are NFSauto, NFSv3 and NFSv4. Defaults to NFSauto. Changing this forces a new resource to be created."
  }
}

variable "target_endpoint" {
  type = list(object({
    id                   = string
    name                 = string
    storage_account_id   = optional(string)
    storage_container_id = optional(string)
    storage_mover_id     = string
    description          = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "storage_account" {
  type = list(object({
    id                       = string
    account_replication_type = string
    account_tier             = string
    name                     = string
    resource_group_id        = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "storage_container" {
  type = list(object({
    id                   = string
    name                 = string
    storage_account_id   = optional(string)
    storage_container_id = optional(string)
    storage_mover_id     = string
    description          = optional(string)
  }))
  default     = []
  description = <<EOF
    EOF
}

variable "resource_group" {
  type = list(object({
    id       = string
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
  type    = map(string)
  default = {}
}