# Create a resource group
resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.location
}

# Create a storage account
resource "azurerm_storage_account" "sg" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = "staging"
  }
}

# Create app service plan
resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.os4_type
  sku_name            = var.image_sku
}

# Create new web app
resource "azurerm_windows_web_app" "app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {}
}

# Create data factory
resource "azurerm_data_factory" "azuredf" {
  name                = var.a_data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Create sql server
resource "azurerm_mysql_server" "ASql" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.image_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  sku_name = var.sku0_name 

  ssl_enforcement_enabled = true 

  tags = {
    owner = "mark"
  }
}

# Create cognitive service
resource "azurerm_cognitive_account" "cognitive_account_name" {
  name                = var.cognitive_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Face"

  sku_name = "S0"

  tags = {
    Acceptance = "Test"
  }
}

# Create funtion app
resource "azurerm_windows_function_app" "function_app" {
  name                      = var.function_app_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  storage_account_name      = var.storage_account_name
  storage_account_access_key = "/k+jnVmLfscHDji+yB0KJhglK+af9la8hg/+i1nrH3uopsfaYCV2btVT/lVW3uaETdgVvfVWVY7Q+AStkZhrNw=="
  service_plan_id           = azurerm_service_plan.app_service_plan.id
  site_config {}
}

# Create logic app
resource "azurerm_logic_app_workflow" "logic_app" {
  name                = var.logic_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_logic_app_trigger_recurrence" "logic_app_trigger" {
  name         = var.logic_app_trigger_name
  logic_app_id = azurerm_logic_app_workflow.logic_app.id
  frequency    = "Day"
  interval     = 1
}

# Create vm with vnet and subnet
resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual1_network_name
  address_space       = var.address1_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "snet" {
  name                 = var.subnet1_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes    = var.address1_prefixes
}

resource "azurerm_network_interface" "nico" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.ip_configuration1_name
    subnet_id                     = azurerm_subnet.snet.id
    private_ip_address_allocation = var.private_ip_address1_allocation
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                  = var.virtual_machine_name
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = var.size1
  admin_username        = var.admin1_username
  admin_password        = var.admin1_password
  network_interface_ids = [azurerm_network_interface.nico.id]

  os_disk {
    caching              = var.os_disk1_caching
    storage_account_type = var.os_disk1_storage_type
  }

  source_image_reference {
     publisher = var.image1_publisher
     offer     = var.image1_offer
     sku       = var.image2_sku
     version   = var.image2_version
  }
}

# Create vmss with vnet ad subnet
resource "azurerm_virtual_network" "vnet2" {
  name                = var.virtual2_network_name
  address_space       = var.address2_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "snet2" {
  name                 = var.subnet2_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes    = var.address2_prefixes
}

resource "azurerm_network_interface" "nic2" {
  name                = var.network_interface2_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration2_name
    subnet_id                     = azurerm_subnet.snet2.id
    private_ip_address_allocation = var.private_ip_address2_allocation
  }
}

resource "azurerm_windows_virtual_machine_scale_set" "vmsss" {
  name                = var.vmss_machine_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.image3_sku
  instances           = 1
  admin_username      = var.admin2_username
  admin_password      = var.admin2_password

  network_interface {
    name    = "nic2"  
    primary = true
    ip_configuration {
      name                          = var.ip_configuration2_name
    subnet_id                     = azurerm_subnet.snet.id
    }
  }

  os_disk {
    caching              = var.os_disk2_caching
    storage_account_type = var.os_disk2_storage_type
  }

  source_image_reference  {
    publisher = var.image3_publisher
    offer     = var.image3_offer
    sku       = var.image4_sku
    version   = var.image3_version
  }

  computer_name_prefix = "vmss"
  
}
