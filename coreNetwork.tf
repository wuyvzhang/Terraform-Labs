provider "azurerm" {
    version = "2.0.0"
    features {}
}

resource "azurerm_resource_group" "networkRG" {
    name = "core"
    location = var.location
    tags = var.tags
}

resource "azurerm_virtual_network" "core" {
    name = "core"
    resource_group_name = azurerm_resource_group.networkRG.name
    location = var.location
    address_space = ["10.0.0.0/16"]
    dns_server = ["8.8.8.8"]

    subnet {
        name = "GatewaySubnet"
        address_prefix = "10.0.0.0/24"
    }

    subnet {
        name = "Training"
        address_prefix = "10.0.1.0/24"
    }

    subnet {
        name = "Dev"
        address_prefix = "10.0.2.0/24"
    }
}

resource "azurerm_public_ip" "vpnGatewayPublicIP" {
    name = "vpnGatewayPublicIP"
    location = var.location
    resource_group_name = azurerm_resource_group.networkRG.name
    allocation_method = "Dynamic"

    tags = var.tags
}

