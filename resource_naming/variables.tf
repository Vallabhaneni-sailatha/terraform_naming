variable "base_name" {
  description = "The base name for the resource."
  type = string
}

variable "resource_type" {
  description = "The type of the resource."
  type = string
  validation {
    condition = var.resource_type == "virtual_machine" || var.resource_type == "key_vault" || var.resource_type == "storage_account"
    error_message = "resource_type must be one of 'virtual_machine', 'key_vault', or 'storage_account'."
  }
}
