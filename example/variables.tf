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

variable "frontend_ip_configuration_name" {
  description = "A frontend_ip_configuration name."
    type        = string
}

variable "frontend_ip_configuration_zones" {
  description = "value of zones."
    type        = list(string)
}

variable "frontend_ip_configuration_subnet_id" {
  description = "value of subnet_id."
    type        = string
}

variable "frontend_ip_configuration_gateway_load_balancer_frontend_ip_configuration_id" {
    description = "value of gateway_load_balancer_frontend_ip_configuration_id."
        type        = string
}

variable "frontend_ip_configuration_private_ip_address" {
    description = "value of private_ip_address."
        type        = string
}

variable "frontend_ip_configuration_private_ip_address_allocation" {
    description = "value of private_ip_address_allocation."
        type        = string
}

variable "frontend_ip_configuration_private_ip_address_version" {
    description = "value of private_ip_address_version."
        type        = string
}

variable "frontend_ip_configuration_public_ip_prefix_id" {
    description = "value of public_ip_prefix_id."
        type        = string
}

#PIP variables

variable "allocation_method" {
  type        = string
  default     = "Dynamic"
  description = "Allocation method of IP."
}

variable "domain_name_label" {
  type        = string
  default     = null
  description = "Domain name lable"
}

variable "zones" {
  type        = list(string)
  default     = null
  description = "Domain name lable"
}

variable "pip_sku" {
  description = "The SKU of public ip - Basic/Standard"
  type        = string
  default     = "Standard"
}

variable "ddos_protection_mode" {
  description = "The DDoS protection mode of the public IP. Possible values are Disabled, Enabled, and VirtualNetworkInherited. Defaults to VirtualNetworkInherited."
  type        = string
  default     = "VirtualNetworkInherited"
}

variable "ddos_protection_plan_id" {
  description = "The ID of DDoS protection plan associated with the public IP."
  type        = string
  default     = null
}


variable "idle_timeout_in_minutes" {
  description = "Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes."
  type        = number
  default     = 4
}

variable "ip_tags" {
  description = "A mapping of IP tags to assign to the public IP. Changing this forces a new resource to be created."
  type        = map(string)
  default     = {}
}

variable "ip_version" {
  description = "The IP Version to use, IPv6 or IPv4. Changing this forces a new resource to be created."
  type        = string
  default     = "IPv4"
}
