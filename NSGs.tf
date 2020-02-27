resource "azurerm_resource_group" "rg" {
    name = var.rg
    location = var.location
    tags = var.tags
}

resource "azurerm_network_security_group" "nsg" {
    name = nsg01
    resource_group_name = azurerm_network_security_group.rg.name
    location = var.location
    tags = var.tags
}

resource "azurerm_network_security_rule" "AllowSSH" {
    name = "AllowSSH"
    priority = 1000
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = var.rg
    network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "AllowHTTP" {
    name = "AllowHTTP"
    resource_group_name = var.rg
    network_security_group_name = azurerm_network_security_group.nsg.name

    priority = 1010
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "AllowHTTS" {
    name = "AllowHTTPS"
    resource_group_name = var.rg
    network_security_group_name = azurerm_network_security_group.nsg.name

    priority = 1020
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "443"
    source_address_prefix = "*"
    destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "AllowSQLServer" {
    name = "AllowSQLServer"
    resource_group_name = var.rg
    network_security_group_name = azurerm_network_security_group.nsg.name

    priority = 1030
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "1433"
    source_address_prefix = "*"
    destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "AllowRDG" {
    name = "AllowRDP"
    resource_group_name = var.rg
    network_security_group_name = azurerm_network_security_group.nsg.name
    priority = 1040
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "3389"
    source_address_prefix = "*"
    destination_address_prefix = "*"
}