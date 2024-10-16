locals {
  naming_convention_info = {
    name         = "001"
    env          = "dev"
    agency_code  = "boj"
    project_code = "mer"
    zone         = "1"
    tier         = "app"
  }
  tags = {
    "Environment" = "Dev"
    "Owner"       = "DevOps"
    "Project"     = "MyProject"
  }
}


module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags                   = local.tags
    }
  }
}

module "azurerm_public_ip" {
  source                  = "git::https://github.com/BrettOJ/tf-az-module-network-public-ip"
  location                = var.location
  resource_group_name     = module.resource_groups.rg_output[1].name
  naming_convention_info  = local.naming_convention_info
  sku                     = var.pip_sku
  allocation_method       = var.allocation_method
  domain_name_label       = var.domain_name_label
  ddos_protection_mode    = var.ddos_protection_mode
  ddos_protection_plan_id = var.ddos_protection_plan_id
  edge_zone               = var.edge_zone
  ip_tags                 = var.ip_tags
  ip_version              = var.ip_version
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  zones                   = var.zones
  tags                    = local.tags
}

module "azurerm_lb" {
  source              = "../"
  location            = var.location
  resource_group_name = module.resource_groups.rg_output[1].name
  edge_zone           = var.edge_zone
  sku                 = var.sku
  sku_tier            = var.sku_tier
  tags                = local.tags
  naming_convention_info = local.naming_convention_info

  frontend_ip_configuration = {
    name                                               = var.frontend_ip_configuration_name
    public_ip_address_id                               = module.azurerm_public_ip.pip_output.id
    zones                                              = var.frontend_ip_configuration_zones
    subnet_id                                          = var.frontend_ip_configuration_subnet_id
    gateway_load_balancer_frontend_ip_configuration_id = var.frontend_ip_configuration_gateway_load_balancer_frontend_ip_configuration_id
    private_ip_address                                 = var.frontend_ip_configuration_private_ip_address
    private_ip_address_allocation                      = var.frontend_ip_configuration_private_ip_address_allocation
    private_ip_address_version                         = var.frontend_ip_configuration_private_ip_address_version
    public_ip_prefix_id                                = var.frontend_ip_configuration_public_ip_prefix_id
  }
}