# Azure subscription vars
subscription_id = "38ab3a8f-5bc4-423b-a32d-07a5df36088a"
client_id = "1e5c2df3-3301-4c60-8200-10e9690357f3"
client_secret = "uRiN.qHAJx9hWWRzsA9CTgR49.gNgqrOvf"
tenant_id = "786001bc-23be-406d-ae83-ba6345fba6b0"

# Resource Group/Location
location = "eastus2"
resource_group = "RG-Project-qa"
application_type = "myApplication4" # This name has to be globally unique.

# Network
virtual_network_name = "udacity-network"
address_space = ["10.5.0.0/16"]
address_prefix_test = "10.5.1.0/24"

# VM

packer_image = "RG-myPackerImage"
admin_username = "udacity"

# public key
# public_key_path = "/home/vsts/work/_temp/myKey.pub"

# public key on Windows local machine
public_key_path = "~/.ssh/id_rsa.pub"