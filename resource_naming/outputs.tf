output "resource_name" {
  description = "The generated resource name."
  value = null_resource.name_generator[0].triggers.resource_name
}
