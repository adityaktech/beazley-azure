provider "azurerm" {
  features {}
}

module "network" {
  source   = "./modules/network"
  rg_name  = var.rg_name
  location = var.location
}

resource "azurerm_network_interface" "frontend_nic" {
  name                = "frontend-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.network.frontend_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

module "frontend_vm" {
  source         = "./modules/compute"
  name           = "frontend-vm"
  rg_name        = var.rg_name
  location       = var.location
  ssh_public_key = file(var.ssh_public_key)
  nic_id         = azurerm_network_interface.frontend_nic.id
}