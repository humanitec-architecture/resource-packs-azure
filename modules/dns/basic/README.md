<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| azurerm | ~> 3.91 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 3.91 |

## Resources

| Name | Type |
|------|------|
| [azurerm_dns_a_record.record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record) | resource |
| [azurerm_dns_aaaa_record.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_aaaa_record) | resource |
| [azurerm_dns_cname_record.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_cname_record) | resource |
| [azurerm_dns_zone.zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/dns_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_id | n/a | `string` | n/a | yes |
| client\_id | The Client ID which should be used. | `string` | n/a | yes |
| client\_secret | The Client Secret which should be used. | `string` | n/a | yes |
| dns\_zone | The id of the hosted zone in which this record set will reside. | `string` | n/a | yes |
| env\_id | n/a | `string` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| resource\_group\_name | Specifies the Name of the Resource Group within which created resource will reside. | `string` | n/a | yes |
| subdomain | The subdomain of the DNS name that the DNS record is for. | `string` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| tenant\_id | The Tenant ID which should be used. | `string` | n/a | yes |
| ip\_address | The IPv4 address that the DNS name should resolve to. | `string` | `""` | no |
| ipv6\_address | The IPv6 address that the DNS name should resolve to. | `string` | `""` | no |
| name | A valid fully qualified domain name that the DNS name should resolve to. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| host | n/a |
<!-- END_TF_DOCS -->