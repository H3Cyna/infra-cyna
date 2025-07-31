resource "azurerm_public_ip" "ci" {
  name                = "public-ip-ci"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "ci" {
  name                = "nic-ci"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "192.168.30.12"
    public_ip_address_id          = azurerm_public_ip.ci.id
  }
}

resource "azurerm_linux_virtual_machine" "ci" {
  name                = "vm-cyna-ci"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  disable_password_authentication = true
  network_interface_ids = [azurerm_network_interface.ci.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  tags = {
    env  = "dev"
    role = "ci"
  }
}
