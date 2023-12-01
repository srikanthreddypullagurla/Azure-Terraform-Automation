#terraform {
 # backend "local" {
  #  path = "TFstates/terraform3.tfstate"
  #}
#}

terraform {
  backend "azurerm" {
    resource_group_name = "SRIKANTHREDDY-TERRAAUTO"
    storage_account_name = "stored024data"
    container_name = "tfstates"
    key = "terraform.tfstate"
    access_key = "/k+jnVmLfscHDji+yB0KJhglK+af9la8hg/+i1nrH3uopsfaYCV2btVT/lVW3uaETdgVvfVWVY7Q+AStkZhrNw=="
  }
}