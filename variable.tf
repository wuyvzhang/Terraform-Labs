variable "location" {
    description = "Default Azure Region"
    default = "southeastasia"
}

variable "tags" {
    description = "tags"
    default = {
        env = "Dev"
        dept = "IT"
    }
}

variable "rg" {
    description = "Default Azure Resource Group Name"
    default = "TF-RG01"
}

variable "weblocations" {
    default = ["southeastasia", "eastus2", "centralindia"]
}