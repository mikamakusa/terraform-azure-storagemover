run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "" {
  command = [init,plan,apply]

  variables {
    resource_group = [
      {
        id       = 0
        name     = "example-resources"
        location = "West Europe"
      }
    ]
    storage_mover = [
      {
        id                  = 0
        name                = "example-ssm"
        resource_group_id   = 0
      }
    ]
    arc_machine_name = "examples-hybridComputeName"
    agent = [
      {
        id                       = 0
        name                     = "example-agent"
        storage_mover_id         = 0
      }
    ]
    storage_account = [
      {
        id                              = 0
        name                            = "examplesa"
        resource_group_id               = 0
        account_tier                    = "Standard"
        account_replication_type        = "LRS"
      }
    ]
    storage_container = [
      {
        id                    = 0
        name                  = "acccontainer"
        storage_account_id    = 0
        container_access_type = "blob"
      }
    ]
    target_endpoint = [
      {
        id                     = 0
        name                   = "example-smte"
        storage_mover_id       = 0
        storage_account_id     = 0
        storage_container_name = 0
      }
    ]
    source_endpoint = [
      {
        id               = 0
        name             = "example-smse"
        storage_mover_id = 0
        host             = "192.168.0.1"
      }
    ]
    mover_project = [
      {
        id               = 0
        name             = "example-sp"
        storage_mover_id = 0
      }
    ]
    job_definition = [
      {
        id                       = 0
        name                     = "example-sjd"
        storage_mover_project_id = 0
        agent_id                 = 0
        copy_mode                = "Additive"
        source_id                = 0
        source_sub_path          = "/"
        target_id                = 0
        target_sub_path          = "/"
        description              = "Example Job Definition Description"
      }
    ]
  }
}