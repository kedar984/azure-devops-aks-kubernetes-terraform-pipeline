variable "resource-group-name" {
  default = "terraform-aks"
  type = string
  description = "This is resource group creation variable"
}
variable "location" {
  default = "centralIndia"
  type = string
  description = "this variable denotes location of resources"
}
variable "linux_admin" {
  default = "azureuser"
  type = string
  description = "Linux username"
}
 variable "linux_admin_password" {
  # default = "/Users/mac/.ssh/aks-prod-sshkeys/aksprodsshkey.pub"
  type = string
   description = "Linux admin password"
 }
variable "window_admin_user" {
  default = "azureuser"
  type = string
  description = "this is windows username"
}
variable "windows_admin_password" {
  default = "sqlhelps@datahub@123"
  type = string
  description = "this is windows admin password"
  
}
variable "environment" {
  type = string
  description = "THis variable the environnment"
  # default = "dev"
}
