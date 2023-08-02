

#provision a resource group 
module "rg" {
  source   = "./modules/management/azure_resource_group"
  rgname   = "rg-eus-dr"
  location = "eastus"
}

#provision ASP 
module "asp-plan" {
  source   = "./modules/webapps/azure_app_service_plan"
  rgname   = module.rg.resource_group_name
  location = "eastus"
  aspname  = "eus-asp-dr"
  skusize  = "S1"
  os_type  = "Linux"
}

#provision webapp for the frontend service 
module "app-frontend" {
  source   = "./modules/webapps/azure_app_service"
  rgname   = module.rg.resource_group_name
  location = "eastus"
  appname  = "eus-frontend-app-dr"
  aspid    = module.asp-plan.asp_id
}

#provision webapp for the backend service 
module "app-backend" {
  source   = "./modules/webapps/azure_app_service"
  rgname   = module.rg.resource_group_name
  location = "eastus"
  appname  = "eus-backend-app-dr"
  aspid    = module.asp-plan.asp_id
}

#provision SQL Database for the data storage 
module "sql" {
  source        = "./modules/storage/azure_sql"
  rgname        = module.rg.resource_group_name
  location      = "eastus"
  sqlservername = "primarysqlserverdr"
  dbname        = "primarydb"
  dbsize        = "1024"
  username      = "dbuser1"
  password      = "P@ssw0rd!"
  sku_name      = "BC_Gen5_2"
  db_version    = "12.0"
}

#provision a storage account
module "storage" {
  source          = "./modules/storage/azure_storage"
  storagename     = "storageforoptimization"
  rgname          = module.rg.resource_group_name
  location        = "eastus"
  accounttype     = "Standard"
  replicationtype = "LRS"
}