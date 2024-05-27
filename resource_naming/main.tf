locals {
  truncated_base_name = substr(var.base_name, 0, 15)
}

resource "null_resource" "name_generator" {
  count = var.resource_type == "virtual_machine" || var.resource_type == "key_vault" || var.resource_type == "storage_account" ? 1 : 0

  triggers = {
    resource_name = var.resource_type == "virtual_machine" ? "vm-${local.truncated_base_name}-00" :
                    var.resource_type == "key_vault"      ? "kv-${lower(var.base_name)}" :
                    var.resource_type == "storage_account" ? "sa${replace(lower(var.base_name), "-", "")}" :
                    ""
  }
}

output "resource_name" {
  value = null_resource.name_generator[0].triggers.resource_name
}
