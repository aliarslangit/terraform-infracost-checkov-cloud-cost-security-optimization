resource "azurerm_storage_account" "example" {
  name                     = var.storagename
  resource_group_name      = var.rgname
  location                 = var.location
  account_tier             = var.accounttype
  account_replication_type = var.replicationtype
}