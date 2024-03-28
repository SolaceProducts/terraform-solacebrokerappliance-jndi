provider "solacebroker" {
  username       = "admin"
  password       = "admin"
  url            = "http://localhost:8080"
  skip_api_check = true
}

module "testcf" {
  source = "../.."
  # version = ""

  msg_vpn_name                = "default"
  connection_factory_name     = "/JNDI/CF/GettingStarted"
  transport_compression_level = 3
}

module "testcflocal" {
  source = "../.."
  # version = ""

  msg_vpn_name                = "default"
  connection_factory_name     = "/JNDI/CF/GettingStartedLocal"
  local_transactions_enabled  = true
  transport_compression_level = 3
}

module "testcfxa" {
  source = "../.."
  # version = ""

  msg_vpn_name                = "default"
  connection_factory_name     = "/JNDI/CF/GettingStartedXA"
  xa_enabled                  = true
  transport_compression_level = 3
}

output "connection_factory" {
  value = module.testcf.connection_factory
}

output "connection_factory_null" {
  value = module.testcf.xa_connection_factory
}

output "connection_factory_local" {
  value = module.testcflocal.connection_factory
}

output "xaconnection_factory" {
  value = module.testcfxa.xa_connection_factory
}
