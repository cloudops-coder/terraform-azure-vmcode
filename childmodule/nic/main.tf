resource "azurerm_network_interface" "nic" {
    for_each = var.vm
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_id[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_subnet" "subnet_id" {
  for_each = var.vm
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

