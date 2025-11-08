resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.vm
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = "Standard_F2"
  admin_username                  = "azureuser"
  admin_password                  = "Azureuser@123456"
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.datanic[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

data "azurerm_network_interface" "datanic" {
  for_each = var.vm
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}