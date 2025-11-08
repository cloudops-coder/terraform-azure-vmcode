rg = {
  rg1 = {
    name     = "testrg1"
    location = "centralindia"
  }

}

vnet = {
  vnet1 = {
    name     = "testvnet1"
    range    = ["10.0.0.0/16"]
    location = "centralindia"
    rg_name  = "testrg1"
  }
}

subnet = {
  subnet1 = {
    name           = "testsubnet1"
    rg_name        = "testrg1"
    vnet_name      = "testvnet1"
    subnet_address = ["10.0.1.0/24"]
  }
}

vm = {
  nic1 = {
    vm_name = "fevm1"
    nic_name       = "testnic1"
    location       = "centralindia"
    rg_name        = "testrg1"
    subnet_name    = "testsubnet1"
    vnet_name      = "testvnet1"
    subnet_address = ["10.0.0.1/24"]

  }
}