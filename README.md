Manages a Load Balancer Resource.

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#example-usage)

```hcl
resource "azurerm_resource_group" "example" { name = "LoadBalancerRG" location = "West Europe" } resource "azurerm_public_ip" "example" { name = "PublicIPForLB" location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name allocation_method = "Static" } resource "azurerm_lb" "example" { name = "TestLoadBalancer" location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name frontend_ip_configuration { name = "PublicIPAddress" public_ip_address_id = azurerm_public_ip.example.id } }
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#argument-reference)

The following arguments are supported:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#name) - (Required) Specifies the name of the Load Balancer. Changing this forces a new resource to be created.
    
-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#resource_group_name) - (Required) The name of the Resource Group in which to create the Load Balancer. Changing this forces a new resource to be created.
    
-   [`location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#location) - (Required) Specifies the supported Azure Region where the Load Balancer should be created. Changing this forces a new resource to be created.
    

___

-   [`edge_zone`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#edge_zone) - (Optional) Specifies the Edge Zone within the Azure Region where this Load Balancer should exist. Changing this forces a new Load Balancer to be created.
    
-   [`frontend_ip_configuration`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#frontend_ip_configuration) - (Optional) One or more `frontend_ip_configuration` blocks as documented below.
    
-   [`sku`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#sku) - (Optional) The SKU of the Azure Load Balancer. Accepted values are `Basic`, `Standard` and `Gateway`. Defaults to `Standard`. Changing this forces a new resource to be created.
    

-   [`sku_tier`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#sku_tier) - (Optional) `sku_tier` - (Optional) The SKU tier of this Load Balancer. Possible values are `Global` and `Regional`. Defaults to `Regional`. Changing this forces a new resource to be created.
    
-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#tags) - (Optional) A mapping of tags to assign to the resource.
    

___

The `frontend_ip_configuration` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#name) - (Required) Specifies the name of the frontend IP configuration.
    
-   [`zones`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#zones) - (Optional) Specifies a list of Availability Zones in which the IP Address for this Load Balancer should be located.
    

-   [`subnet_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#subnet_id) - (Optional) The ID of the Subnet which should be associated with the IP Configuration.
-   [`gateway_load_balancer_frontend_ip_configuration_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#gateway_load_balancer_frontend_ip_configuration_id) - (Optional) The Frontend IP Configuration ID of a Gateway SKU Load Balancer.
-   [`private_ip_address`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#private_ip_address) - (Optional) Private IP Address to assign to the Load Balancer. The last one and first four IPs in any range are reserved and cannot be manually assigned.
-   [`private_ip_address_allocation`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#private_ip_address_allocation) - (Optional) The allocation method for the Private IP Address used by this Load Balancer. Possible values as `Dynamic` and `Static`.
-   [`private_ip_address_version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#private_ip_address_version) - (Optional) The version of IP that the Private IP Address is. Possible values are `IPv4` or `IPv6`.
-   [`public_ip_address_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#public_ip_address_id) - (Optional) The ID of a Public IP Address which should be associated with the Load Balancer.
-   [`public_ip_prefix_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#public_ip_prefix_id) - (Optional) The ID of a Public IP Prefix which should be associated with the Load Balancer. Public IP Prefix can only be used with outbound rules.

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#id) - The Load Balancer ID.
-   [`frontend_ip_configuration`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#frontend_ip_configuration) - A `frontend_ip_configuration` block as documented below.
-   [`private_ip_address`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#private_ip_address) - The first private IP address assigned to the load balancer in `frontend_ip_configuration` blocks, if any.
-   [`private_ip_addresses`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#private_ip_addresses) - The list of private IP address assigned to the load balancer in `frontend_ip_configuration` blocks, if any.

___

A `frontend_ip_configuration` block exports the following:

-   [`gateway_load_balancer_frontend_ip_configuration_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#gateway_load_balancer_frontend_ip_configuration_id) - The id of the Frontend IP Configuration of a Gateway Load Balancer that this Load Balancer points to.
-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#id) - The id of the Frontend IP Configuration.
-   [`inbound_nat_rules`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#inbound_nat_rules) - The list of IDs of inbound rules that use this frontend IP.
-   [`load_balancer_rules`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#load_balancer_rules) - The list of IDs of load balancing rules that use this frontend IP.
-   [`outbound_rules`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#outbound_rules) - The list of IDs outbound rules that use this frontend IP.
-   [`private_ip_address`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#private_ip_address) - Private IP Address to assign to the Load Balancer.
-   [`private_ip_address_allocation`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#private_ip_address_allocation) - The allocation method for the Private IP Address used by this Load Balancer. Possible values are `Dynamic` and `Static`.
-   [`public_ip_address_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#public_ip_address_id) - The ID of a Public IP Address which is associated with this Load Balancer.
-   [`public_ip_prefix_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#public_ip_prefix_id) - The ID of a Public IP Prefix which is associated with the Load Balancer.
-   [`subnet_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#subnet_id) - The ID of the Subnet which is associated with the IP Configuration.

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#create) - (Defaults to 30 minutes) Used when creating the Load Balancer.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#update) - (Defaults to 30 minutes) Used when updating the Load Balancer.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#read) - (Defaults to 5 minutes) Used when retrieving the Load Balancer.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#delete) - (Defaults to 30 minutes) Used when deleting the Load Balancer.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#import)

Load Balancers can be imported using the `resource id`, e.g.

```shell
terraform import azurerm_lb.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/group1/providers/Microsoft.Network/loadBalancers/lb1
```