resource "azurerm_postgresql_flexible_server" "postgresql" {

    for_each = var.postgresql

  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location
  version                       = each.value.version
 # delegated_subnet_id           = azurerm_subnet.example.id
 # private_dns_zone_id           = azurerm_private_dns_zone.example.id
  public_network_access_enabled = "true"
  administrator_login           = each.value.administrator_login
  administrator_password        = each.value.administrator_password
  zone                          = "1"

  storage_mb   = 32768
  storage_tier = "P4"

  sku_name   = "B_Standard_B1ms"
 # depends_on = [azurerm_private_dns_zone_virtual_network_link.example]

}