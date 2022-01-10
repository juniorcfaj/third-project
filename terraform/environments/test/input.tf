# Azure GUIDS
variable "subscription_id" {
    default = "38ab3a8f-5bc4-423b-a32d-07a5df36088a"
}
variable "client_id" {
    default = "1e5c2df3-3301-4c60-8200-10e9690357f3"
}
variable "client_secret" {
    default = "uRiN.qHAJx9hWWRzsA9CTgR49.gNgqrOvf"
}
variable "tenant_id" {
    default = "786001bc-23be-406d-ae83-ba6345fba6b0"
}

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

