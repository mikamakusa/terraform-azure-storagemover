## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.109.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.42.0 |

## Modules

No modules.

## Examples
```hcl
module "storage_move" {
  source              = "."
  resource_group_name = "example"
  arc_machine_name    = "hybridComputeName"
  storage_mover = [{
    id          = "1"
    name        = "example-ssm"
    description = "Example Storage Mover Description"
  }]
  agent = [{
    id               = "2"
    storage_mover_id = "1"
    name             = "example-sa"
    description      = "Example Agent Description"
  }]
  source_endpoint = [{
    id               = "4"
    name             = "example-source"
    storage_mover_id = "1"
    export           = "/"
    host             = "192.168.0.1"
    nfs_version      = "NFSv3"
    }, {
    id               = "8"
    name             = "example-target"
    storage_mover_id = "1"
    export           = "/"
    host             = "192.168.0.5"
    nfs_version      = "NFSv3"
  }]
  job_definition = [{
    id                       = "10"
    name                     = "example-sjd"
    storage_mover_project_id = "1"
    agent_id                 = "2"
    copy_mode                = "Additive"
    source_id                = "4"
    source_sub_path          = "/"
    target_id                = "8"
    target_sub_path          = "/"
    description              = "Example Job Definition Description"
  }]
  project = [{
    id               = "3"
    name             = "example-sp"
    storage_mover_id = "1"
    description      = "Example Project Description"
  }]
}
```

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_storage_mover.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_mover) | resource |
| [azurerm_storage_mover_agent.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_mover_agent) | resource |
| [azurerm_storage_mover_job_definition.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_mover_job_definition) | resource |
| [azurerm_storage_mover_project.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_mover_project) | resource |
| [azurerm_storage_mover_source_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_mover_source_endpoint) | resource |
| [azurerm_storage_mover_target_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_mover_target_endpoint) | resource |
| [azurerm_arc_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/arc_machine) | data source |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_container) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent"></a> [agent](#input\_agent) | n/a | <pre>list(object({<br/>    id                     = string<br/>    arc_virtual_machine_id = optional(string)<br/>    name                   = string<br/>    storage_mover_id       = string<br/>    description            = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_arc_machine_name"></a> [arc\_machine\_name](#input\_arc\_machine\_name) | n/a | `string` | `null` | no |
| <a name="input_job_definition"></a> [job\_definition](#input\_job\_definition) | n/a | <pre>list(object({<br/>    id                       = string<br/>    copy_mode                = string<br/>    name                     = string<br/>    source_id                = string<br/>    storage_mover_project_id = string<br/>    target_id                = string<br/>    source_sub_path          = optional(string)<br/>    target_sub_path          = optional(string)<br/>    agent_id                 = optional(string)<br/>    description              = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | <pre>list(object({<br/>    id               = string<br/>    name             = string<br/>    storage_mover_id = string<br/>    description      = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | n/a | <pre>list(object({<br/>    id       = string<br/>    location = string<br/>    name     = string<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `null` | no |
| <a name="input_source_endpoint"></a> [source\_endpoint](#input\_source\_endpoint) | n/a | <pre>list(object({<br/>    id               = string<br/>    host             = string<br/>    name             = string<br/>    storage_mover_id = string<br/>    export           = optional(string)<br/>    nfs_version      = optional(string)<br/>    description      = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_storage_account"></a> [storage\_account](#input\_storage\_account) | n/a | <pre>list(object({<br/>    id                       = string<br/>    account_replication_type = string<br/>    account_tier             = string<br/>    name                     = string<br/>    resource_group_id        = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | `null` | no |
| <a name="input_storage_container"></a> [storage\_container](#input\_storage\_container) | n/a | <pre>list(object({<br/>    id                   = string<br/>    name                 = string<br/>    storage_account_id   = optional(string)<br/>    storage_container_id = optional(string)<br/>    storage_mover_id     = string<br/>    description          = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name) | n/a | `string` | `null` | no |
| <a name="input_storage_mover"></a> [storage\_mover](#input\_storage\_mover) | n/a | <pre>list(object({<br/>    id                = string<br/>    name              = string<br/>    resource_group_id = optional(string)<br/>    description       = optional(string)<br/>    tags              = optional(map(string))<br/>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_target_endpoint"></a> [target\_endpoint](#input\_target\_endpoint) | n/a | <pre>list(object({<br/>    id                   = string<br/>    name                 = string<br/>    storage_account_id   = optional(string)<br/>    storage_container_id = optional(string)<br/>    storage_mover_id     = string<br/>    description          = optional(string)<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_mover_agent_id"></a> [storage\_mover\_agent\_id](#output\_storage\_mover\_agent\_id) | n/a |
| <a name="output_storage_mover_id"></a> [storage\_mover\_id](#output\_storage\_mover\_id) | n/a |
| <a name="output_storage_mover_job_definition_id"></a> [storage\_mover\_job\_definition\_id](#output\_storage\_mover\_job\_definition\_id) | n/a |
| <a name="output_storage_mover_project_id"></a> [storage\_mover\_project\_id](#output\_storage\_mover\_project\_id) | n/a |
| <a name="output_storage_mover_source_endpoint_id"></a> [storage\_mover\_source\_endpoint\_id](#output\_storage\_mover\_source\_endpoint\_id) | n/a |
| <a name="output_storage_mover_target_endpoint_id"></a> [storage\_mover\_target\_endpoint\_id](#output\_storage\_mover\_target\_endpoint\_id) | n/a |
