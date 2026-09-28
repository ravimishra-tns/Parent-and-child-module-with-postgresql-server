subscription_id = "4132b1ef-769f-44fa-b105-10c35caa9266"
resource_group = {
  rg1 = {
    name     = "ravi1002-rg"
    location = "centralindia"
  }
}

storage_account = {
  st1 = {
    name                     = "23ravi100"
    resource_group_name      = "ravi1001-rg"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"

  }
}

virtual_network = {
  vnet1 = {
    vnet_name           = "axion_vnet"
    resource_group_name = "ravi1001-rg"
    location            = "centralindia"
    address_space       = ["10.0.0.0/20"]
  }
}

subnet = {
  sub1 = {
    sub_name             = "frontend"
    resource_group_name  = "ravi1001-rg"
    virtual_network_name = "axion_vnet"
    address_prefixes     = ["10.0.10.0/24"]

  }

  sub2 = {
    sub_name             = "backend"
    resource_group_name  = "ravi1001-rg"
    virtual_network_name = "axion_vnet"
    address_prefixes     = ["10.0.11.0/24"]

  }
}

nsg = {
  nsg1 = {
    nsg_name            = "nsg1001"
    location            = "centralindia"
    resource_group_name = "ravi1001-rg"
  }
}

security_rule = {

  strule1 = {
    nsgrule_name                = "forntend1001"
    priority                    = 100
    direction                   = "Outbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = "ravi1001-rg"
    network_security_group_name = "nsg1001"

  }
}


publicip = {
  pip = {
    pip_name            = "pip1001"
    resource_group_name = "ravi1001-rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}


virtual_machine = {

  vm1 = {
    vm_name               = "vm1001"
    pip_name              = "pip1001"
    location              = "centralindia"
    resource_group_name   = "ravi1001-rg"
    sub_name              = "frontend"
    virtual_network_name  = "axion_vnet"
    admin_username        = "adminuser"
    admin_password        = "aconyx@123"
    size                  = "Standard_D2s_v5"
  }

}


postgresql = {

    postgre1 ={
          name                          = "dbpregresql"
  resource_group_name           = "ravi1001-rg"
  location                      = "centralindia"
  version                       = "12"
  administrator_login           = "adminuser"
  administrator_password        = "aconyx@123"
  zone                          = "1"
    }
}