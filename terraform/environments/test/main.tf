provider "azurerm" {
  subscription_id = "38ab3a8f-5bc4-423b-a32d-07a5df36088a"
  client_id = "1e5c2df3-3301-4c60-8200-10e9690357f3"
  client_secret = "uRiN.qHAJx9hWWRzsA9CTgR49.gNgqrOvf"
  tenant_id = "786001bc-23be-406d-ae83-ba6345fba6b0"
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "tstate18893"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    access_key           = "UGUYGaB3TQ5HdoqtfirEA9NK6flOaki5g0OOdCp+1DFlNxc5h0QDchvJooCTfXcVGgegNbEMhdvouKfX2QidAw=="
  }
}
module "resource_group" {
  source               = "../../modules/resource_group"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
}
module "network" {
  source               = "../../modules/network"
  address_space        = "${var.address_space}"
  location             = "${var.location}"
  virtual_network_name = "${var.virtual_network_name}"
  application_type     = "${var.application_type}"
  resource_type        = "NET"
  resource_group       = "${module.resource_group.resource_group_name}"
  address_prefix_test  = "${var.address_prefix_test}"
}

module "nsg-test" {
  source           = "../../modules/networksecuritygroup"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "NSG"
  resource_group   = "${module.resource_group.resource_group_name}"
  subnet_id        = "${module.network.subnet_id_test}"
  address_prefix_test = "${var.address_prefix_test}"
}
module "appservice" {
  source           = "../../modules/appservice"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "AppService"
  resource_group   = "${module.resource_group.resource_group_name}"
}
module "publicip" {
  source           = "../../modules/publicip"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "publicip"
  resource_group   = "${module.resource_group.resource_group_name}"
}