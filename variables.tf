variable "resource_group_name" {
  description = "The name of the Resource Group in which to create the Load Balancer."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure Region where the Load Balancer should be created."
  type        = string
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Load Balancer should exist."
  type        = string
}

variable "sku" {
  description = "The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Standard."
  type        = string
}

variable "sku_tier" {
  description = "The SKU tier of this Load Balancer. Possible values are Global and Regional. Defaults to Regional."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "frontend_ip_configuration" {
  description = "A frontend_ip_configuration block."
  type = object({
    name                                               = string
    zones                                              = list(string)
    subnet_id                                          = string
    gateway_load_balancer_frontend_ip_configuration_id = string
    private_ip_address                                 = string
    private_ip_address_allocation                      = string
    private_ip_address_version                         = string
    public_ip_address_id                               = string
    public_ip_prefix_id                                = string
  })
}

variable "naming_convention_info" {
  description = "A naming convention block."
  type = object({
    name = string
    env          = string
    agency_code  = string
    project_code = string
    zone         = string
    tier         = string
  })
}