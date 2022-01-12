# Ensuring Quality Releases

This is the last project from Udacity. In this project, you'll develop using a variety of industry leading tools, especially Microsoft Azure, to create disposable test environments and run a variety of automated tests with the click of a button. Additionally, you'll monitor and provide insight into your application's behavior, and determine root causes by querying the application’s custom log files.

## Project Overview

![image](https://github.com/juniorcfaj/third-project/blob/main/src/overview.png)

## Getting Started

## Dependencies
| Dependency | Link |
| ------ | ------ |
| Packer | https://www.packer.io/ |
| Terraform | https://www.terraform.io/downloads.html |
| JMeter |  https://jmeter.apache.org/download_jmeter.cgi|
| Postman | https://www.postman.com/downloads/ |
| Python | https://www.python.org/downloads/ |
| Selenium | https://sites.google.com/a/chromium.org/chromedriver/getting-started |

## Create an repo on GitHub

Clone this repo:

```sh
git clone https://github.com/juniorcfaj/third-project
```

## Create and configure a storage account to store Terraform state

Open a Terminal in VS Code and connect to your Azure Account and get the Subscription ID

```bash
az login 
az account list --output table
./azure-storage-account.sh
```

Take these informations and put into main.tf

```
backend "azurerm" {
storage_account_name = ""
container_name       = "tstate"
key                  = "terraform.tfstate"
access_key           = "<access key>"
```

We can now create the Service Principal which will have permissions to manage resources in the specified Subscription using the following command:

```
$ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"
```

This command will output 5 values:
```
{
  "appId": "00000000-0000-0000-0000-000000000000",
  "displayName": "azure-cli-2017-06-05-10-41-15",
  "name": "http://azure-cli-2017-06-05-10-41-15",
  "password": "0000-0000-0000-0000-000000000000",
  "tenant": "00000000-0000-0000-0000-000000000000"
}
```
These values map to the Terraform variables like so:

`appId` is the `client_id` defined above.

`password` is the `client_secret` defined above.

`tenant` is the `tenant_id` defined above.

## Installing extensions into Azure Devops

Install these Extensions :

* JMeter (https://marketplace.visualstudio.com/items?itemName=AlexandreGattiker.jmeter-tasks&targetId=625be685-7d04-4b91-8e92-0a3f91f6c3ac&utm_source=vstsproduct&utm_medium=ExtHubManageList)
  
* PublishHTMLReports (https://marketplace.visualstudio.com/items?itemName=LakshayKaushik.PublishHTMLReports&targetId=625be685-7d04-4b91-8e92-0a3f91f6c3ac&utm_source=vstsproduct&utm_medium=ExtHubManageList)

* Terraform (https://marketplace.visualstudio.com/items?itemName=ms-devlabs.custom-terraform-tasks&targetId=625be685-7d04-4b91-8e92-0a3f91f6c3ac&utm_source=vstsproduct&utm_medium=ExtHubManageList)

* Azure Pipelines Terraform Tasks (https://marketplace.visualstudio.com/items?itemName=charleszipp.azure-pipelines-tasks-terraform)

# Create a Resource Group for your VM image using Packer and build the Image ( Ubuntu 18.04)

```
az group create -n RG-myPackerImage -l eastus2
packer --version
cd packer
packer build ubuntu-image.json
cd..
pwd
```

Then you'll need to add these informations into vm.tf
```
==> azure-arm:  -> Image ResourceGroupName   : 'RG-myPackerImage'
==> azure-arm:  -> Image Name                : 'myPackerImage'
==> azure-arm:  -> Image ID                  : '/subscriptions/<subscription-id>/resourceGroups/RG-myPackerImage/providers/Microsoft.Compute/images/myPackerImage'
==> azure-arm:  -> Image Location            : 'eastus2'
```

# Creating a project in Azure Devops

Go to > https://dev.azure.com/
Create a project

### Create a service Connection

Project Settings > Pipelines > Service Connection
Use you Resouce Group that you've created. In my case is "tfstate"

Create a environment named "VM-TEST" as used in pipeline.yaml

### Add into Pipelines --> Library --> Secure files these 2 files: the private secure file : id_rsa key the terraform tfvars file : terraform.tfvars

![image](https://github.com/juniorcfaj/third-project/blob/main/src/pipelines.PNG)

### Go to Azure Cloud Shell

Go to Azure Cloud Shell and execute these commands:

```
terraform validate
```
