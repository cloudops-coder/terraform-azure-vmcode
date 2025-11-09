module "rg" {
    source = "../childmodule/rg"
    rg = var.rg
}

module "vnet" {
    source = "../childmodule/vnet"
    vnet = var.vnet
    depends_on = [ module.rg ]
}

module "subnet" {
    source = "../childmodule/subnet"
    subnet = var.subnet
    depends_on = [ module.rg , module.vnet ]
}

module "nic" {
    source = "../childmodule/nic"
    vm = var.vm
    depends_on = [ module.rg , module.subnet , module.vnet]
}

module "vm" {
    source = "../childmodule/vm"
    vm = var.vm
    depends_on = [ module.rg , module.nic , module.subnet , module.vnet ]
}