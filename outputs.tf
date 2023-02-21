output "azuredevops_project_name" {
  value       = azuredevops_project.main.name
  description = "The Azure DevOps Project Name."
}

output "azuredevops_project_id" {
  value       = azuredevops_project.main.id
  description = "The Azure DevOps Project ID."
}

output "variable_group_name" {
  value       = join("", azuredevops_variable_group.main.*.name)
  description = "The name of the Variable Group."
}

output "variabe_group_id" {
  value       = join("", azuredevops_variable_group.main.*.id)
  description = "The ID of the Variable Group."
}


# length(random_pet.this) > 0 ? random_pet.this[0].id : null
