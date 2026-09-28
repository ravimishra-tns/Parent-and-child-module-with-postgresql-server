data "azurerm_subnet" "sub" {
  for_each             = var.virtual_machine
  name                 = each.value.sub_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {

    for_each = var.virtual_machine
    name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name

}