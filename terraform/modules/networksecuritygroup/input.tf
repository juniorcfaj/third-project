# Resource Group/Location
variable "location" {
    default = "eastus2"
}
variable "resource_group" {
    default = "tstate"
}
variable "application_type" {
    default = "udacity"
}
variable "resource_type" {}
variable "subnet_id" {}
variable "address_prefix_test" {
    default = "10.5.1.0/24"
}
