module "resource_naming" {
  source = "../resource_naming"  # the URL of the GitHub repo containing the child module

  for_each = var.resource_map

  base_name = each.key
  resource_type = each.values
}

# Flatten the outputs from all instances of the child module
locals {
  resource_names = { for k, v in module.resource_naming : k => v.resource_name }
}
