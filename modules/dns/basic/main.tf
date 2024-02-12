locals {
  provided_records = [var.ip_address, var.ipv6_address, var.name]
  records          = [for r in local.provided_records : r if r != ""]
}

data "azurerm_dns_zone" "zone" {
  name                = var.dns_zone
  resource_group_name = var.resource_group_name

  lifecycle {
    precondition {
      condition     = length(local.records) > 0
      error_message = "Only one of ip_address, ipv6_address, name is supported."
    }
  }
}

resource "azurerm_dns_a_record" "record" {
  count               = var.ip_address != "" ? 1 : 0
  name                = var.subdomain
  zone_name           = data.azurerm_dns_zone.zone.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [var.ip_address]

  tags = {
    "managed-by" = "terraform"
    "humanitec"  = "true"
    "hum-app"    = var.app_id
    "hum-env"    = var.env_id
    "hum-res"    = var.res_id
  }
}

resource "azurerm_dns_aaaa_record" "example" {
  count               = var.ipv6_address != "" ? 1 : 0
  name                = var.subdomain
  zone_name           = data.azurerm_dns_zone.zone.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [var.ipv6_address]

  tags = {
    "managed-by" = "terraform"
    "humanitec"  = "true"
    "hum-app"    = var.app_id
    "hum-env"    = var.env_id
    "hum-res"    = var.res_id
  }
}

resource "azurerm_dns_cname_record" "example" {
  count               = var.name != "" ? 1 : 0
  name                = var.subdomain
  zone_name           = data.azurerm_dns_zone.zone.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  record              = var.name

  tags = {
    "managed-by" = "terraform"
    "humanitec"  = "true"
    "hum-app"    = var.app_id
    "hum-env"    = var.env_id
    "hum-res"    = var.res_id
  }
}

