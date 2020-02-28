provider "azurerm" {
    version = "2.0.0"
    features {}
}

resource "random_string" "webapprnd" {
    length = 8
    lower = true
    number = true
    upper = false
    special = false
}

resource "azurerm_resource_group" "webapprg" {
    name = "WebAPP-RG"
    location = var.location
    tags = var.tags
}

resource "azurerm_app_service_plan" "free" {
    name = "plan-free-${var.location}"
    location = var.location
    resource_group_name = azurerm_resource_group.webapprg.name
    tags = var.tags

    kind = "Linux"
    reserved = true
    sku {
        tier = "Free"
        size = "F1"
    }
}

resource "azurerm_app_service" "citadel" {
    name = "webapp-${random_string.webapprnd.result}-${var.location}"
    location = var.location
    resource_group_name = azurerm_resource_group.webapprg.name
    tags = var.tags
    app_service_plan_id = azurerm_app_service_plan.free.id 
}