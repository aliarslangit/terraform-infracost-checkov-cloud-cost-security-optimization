//--------------------------------General Properties----------------\\
variable "rgname" {
  type    = string
  default = ""
}
variable "sqlservername" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}
//-----------------------------------SQL CONFIGURATIONS-------------------\\
variable "username" {
  type    = string
  default = ""
}
variable "password" {
  type    = string
  default = ""
}
variable "dbname" {
  type    = string
  default = ""
}
variable "dbsize" {
  type    = string
  default = ""
}
variable "sku_name" {
  type    = string
  default = ""
}
variable "db_version" {
  type    = string
  default = ""
}

variable "firewallrules" {
  type = list(any)
  default = [
    {
      startip = "10.0.0.1"
      endip   = "10.0.0.1"
    },
    {
      startip = "10.0.0.2"
      endip   = "10.0.0.2"
    }
  ]
}
//------------------------------------TAGS-------------------------\\
variable "owner" {
  type        = string
  default     = "Ali Arslan"
  description = "description"
}

variable "Environment" {
  type        = string
  default     = "Dev"
  description = "Enter storage account name"
}

