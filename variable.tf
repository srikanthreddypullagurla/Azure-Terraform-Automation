# Create a resource group
variable "resource_group_name" {
  description = "The name of resource group"
  default = "SRIKANTHREDDY-TERRAAUTO"
}

variable "location" {
  description = "location of th resource group"
  default = "east us"
}

# Create a storage account
variable "storage_account_name" {
  description = "Storage account name"
  default = "srikanthreddypersonalsto"
}

variable "account_tier" {
  description = "sg sccount tier"
  default = "Standard"
}

variable "account_replication_type" {
  description = "sg account rep type"
  default = "LRS"
}

# Create app service plan
variable "app_service_plan_name" {
  description = "Name of Azure app service plan"
  default = "asp0"
}

variable "app_service_name" {
  description = "Name of web app service"
  default = "newapptrial"
}

variable "os4_type" {
  description = "windows os disk"
  default = "Windows"
}

variable "image_sku" {
  description = "image of sku tier"
  default = "S1"
}

# Create data factory
variable "a_data_factory_name" {
  description = "Name of the azure data factory"
  default     = "mydatafactory19808"
}

# Create sql server
variable "sql_server_name" {
  description = "Name of the sql server"
  default     = "mysqlserver19805"
}

variable "image_version" {
    description = "version of the server"
    default = "5.7"
}
variable "sku0_name" {
  description = "sku of mysql"
  default     = "GP_Gen5_2"
}

variable "administrator_login" {
  description = "login ID"
  default     = "sqladmin"
}

variable "administrator_login_password" {
  description = "password of ID"
  default     = "P@ssw0rd123"
}

# Cognitive service
variable "cognitive_account_name" {
  description = "Name of Cognitive service"
  default =  "mycognitiveservices19808"
}

# function app
variable "function_app_name" {
  description = "Name of the function app"
  default = "myfunctionappnewo"
}

# Logic app
variable "logic_app_name" {
  description = "Name of logic app"
  default = "logicapp1990889"
}

variable "logic_app_trigger_name" {
  description = "Name of the Logic App Trigger"
  default     = "mytrigger19809"
}

# Variables for VnetandSubnet module
variable "virtual1_network_name" {
  description = "Virtual network name for VnetandSubnet module"
  default     = "vnet01"
}

variable "address1_space" {
  description = "Address space for vnet01 in VnetandSubnet module"
  default     = ["10.0.0.0/16"]
}

variable "subnet1_name" {
  description = "Subnet name for subnet01 in VnetandSubnet module"
  default     = "subnet01"
}

variable "address1_prefixes" {
  description = "Address prefixes for subnet01 in VnetandSubnet module"
  default     = ["10.0.0.0/24"]
}

# Variables for VirtualMachine module
variable "virtual_machine_name" {
  description = "Name of the virtual machine"
  default     = "myvm"
  }

variable "network_interface_name" {
  description = "Name of the network interface"
  default     = "mynic"
}


variable "size1" {
  description = "Size of the virtual machine"
  default     = "Standard_DS1_v2"
}

variable "admin1_username" {
  description = "Admin username for the virtual machine"
  default     = "adminuser"
}

variable "admin1_password" {
  description = "Admin password for the virtual machine"
  default     = "P@ssw0rd123"
}

variable "ip_configuration1_name" {
  description = "Name of the IP configuration"
  default     = "ipconfig1"
}

variable "private_ip_address1_allocation" {
  description = "Private IP address allocation method"
  default     = "Dynamic"
}

variable "os_disk1_caching" {
  description = "OS disk caching type"
  default     = "ReadWrite"
}

variable "os_disk1_storage_type" {
  description = "OS disk storage type"
  default     = "Standard_LRS"
}

variable "image1_publisher" {
  description = "Publisher of the VM image"
  default     = "MicrosoftWindowsServer"
}

variable "image1_offer" {
  description = "Offer of the VM image"
  default     = "WindowsServer"
}

variable "image2_sku" {
  description = "SKU of the VM image"
  default     = "2019-Datacenter"
}

variable "image2_version" {
  description = "Version of the VM image"
  default     = "latest"
}

# Variables for VMSS module
variable "vmss_machine_name" {
  description = "Machine name for VMSS module"
  default     = "vmssmachine112"
}

variable "network_interface2_name" {
  description = "Name of the network interface for VMSS module"
  default     = "vmss-nic"
}

variable "virtual2_network_name" {
  description = "Name of the virtual network for VMSS module"
  default     = "vmss-vnet"
}

variable "subnet2_name" {
  description = "Name of the subnet for VMSS module"
  default     = "vmss-subnet"
}

variable "address2_space" {
  description = "Address space for VMSS module"
  default     = ["10.0.0.0/16"]
}

variable "address2_prefixes" {
  description = "Address prefixes for VMSS module"
  default     = ["10.0.0.0/24"]
}

variable "admin2_username" {
  description = "Admin username for VMSS module"
  default     = "vmssadmin"
}

variable "admin2_password" {
  description = "Admin password for VMSS module"
  default     = "P@ssw0rd1234"
}

variable "ip_configuration2_name" {
  description = "IP configuration name for VMSS module"
  default     = "ipconfig1"
}

variable "private_ip_address2_allocation" {
  description = "Private IP address allocation method for VMSS module"
  default     = "Dynamic"
}

variable "os_disk2_caching" {
  description = "OS disk caching type for VMSS module"
  default     = "ReadWrite"
}

variable "os_disk2_storage_type" {
  description = "OS disk storage type for VMSS module"
  default     = "Standard_LRS"
}

variable "image3_publisher" {
  description = "Publisher of the VM image for VMSS module"
  default     = "MicrosoftWindowsServer"
}

variable "image3_offer" {
  description = "Offer of the VM image for VMSS module"
  default     = "WindowsServer"
}

variable "image3_sku" {
  description = "SKU of the VM image for VMSS module"
  default     = "Standard_B2s"
}

variable "image3_version" {
  description = "Version of the VM image for VMSS module"
  default     = "latest"
}

variable "image4_sku" {
  description = "vmss sku"
  default = "2019-Datacenter"
}