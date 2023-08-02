output "storageaccountname" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.example.name
}

output "storageaccountaccesskey" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.example.primary_access_key
}