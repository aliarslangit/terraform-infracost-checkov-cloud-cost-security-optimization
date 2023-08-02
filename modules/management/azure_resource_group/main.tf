#Create Azure Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.rgname
  location = var.location
}
