# Resource Group
variable location {
    default = "eastus2"
}
variable "resource_group" {
    default = "tstate"
}
# Network
variable virtual_network_name {
    default = "udacity-network"
}
variable address_prefix_test {
    default = "10.5.1.0/24"
}
variable address_space {
    default = ["10.5.0.0/16"]
}
variable "application_type" {
    default = "udacity"
}
variable "resource_type" {}