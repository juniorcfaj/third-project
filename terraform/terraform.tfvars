# Azure subscription vars
subscription_id = "dcc5595c-9bd1-4fe1-8d3e-02a8d8f48fc7"
client_id = "71909848-c301-4391-9978-9c0e7796d8cf"
client_secret = "XkV-1K4mxnT8HLLvPFBS2gUjy0qE_MyX0G"
tenant_id = "d76abf86-6307-4990-89d9-2a0523e65f52"

#  "appId": "acb0e83c-5606-4ee3-964f-e990cd1732f2",
#  "displayName": "third-project",
#  "name": "acb0e83c-5606-4ee3-964f-e990cd1732f2",
#  "password": "0MMs_rqCCLaEhVibl9.DYElAso_gzQP-Q9",
#  "tenant": "786001bc-23be-406d-ae83-ba6345fba6b0"

# Resource Group/Location
location = "East US"
resource_group = "Project-qa"
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