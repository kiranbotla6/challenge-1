terraform {
  backend "azurerm" {
    storage_account_name = "azurestrifiernnjervsdv"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    access_key = "M1OEsJW7KDKaQCTWjtREnE7IDc+1BbTHKSmM0TElpEqQuQgn3zOuhTGluWGCRIeYCW4h4Wbiyl+4+AStUOhNQQ=="
  }
}