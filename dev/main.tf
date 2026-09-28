module "rg" {
  source         = "./../Module/Resource_group"
  resource_group = var.resource_group
}

module "st" {
    depends_on = [module.rg]
  source          = "./../Module/storageaccount"
  storage_account = var.storage_account
}

module "vnet" {
  depends_on      = [module.rg]
  source          = "./../Module/vnet"
  virtual_network = var.virtual_network
}

module "subnet" {
  depends_on = [module.rg, module.vnet]
  source     = "./../Module/vnet_subnet"
  subnet     = var.subnet
}

module "nsg" {
  depends_on = [module.subnet]
  source     = "./../Module/vnet_subnet_nsg"
  nsg        = var.nsg
}

module "security" {
  depends_on    = [module.rg, module.nsg]
  source        = "./../Module/nsg_securityrule"
  security_rule = var.security_rule
}

module "pip" {
  depends_on = [module.rg, module.subnet]
  source     = "./../Module/Publicip"
  publicip   = var.publicip
}

module "vm" {
    depends_on = [module.rg, module.subnet, module.nsg, module.pip,  module.security]
  source          = "./../Module/virtualmachine"
  virtual_machine = var.virtual_machine
}

module "pstgre" {
    depends_on = [module.rg, module.nsg, module.vm]
    source = "./../Module/postgresqlserver"
    postgresql  = var.postgresql
}