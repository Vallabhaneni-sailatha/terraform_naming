module "resource_management" {
  source = "../resource_management"

  resource_map = {
    "sample-vm-name"  = "virtual_machine",
    "sample-keyvault" = "key_vault",
    "sample-storage"  = "storage_account"
  }
}

output "resource_names" {
  value = module.resource_management.resource_names
}
