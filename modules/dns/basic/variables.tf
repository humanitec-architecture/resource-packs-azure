variable "subscription_id" {
  description = "The Subscription ID which should be used."
  type        = string
}

variable "res_id" {
  type = string
}

variable "app_id" {
  type = string
}

variable "env_id" {
  type = string
}

variable "dns_zone" {
  description = "The id of the hosted zone in which this record set will reside."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the Name of the Resource Group within which created resource will reside."
  type        = string
}

variable "subdomain" {
  description = "The subdomain of the DNS name that the DNS record is for."
  type        = string
}

variable "ip_address" {
  description = "The IPv4 address that the DNS name should resolve to."
  type        = string
  default     = ""
}

variable "ipv6_address" {
  description = "The IPv6 address that the DNS name should resolve to."
  type        = string
  default     = ""
}

variable "name" {
  description = "A valid fully qualified domain name that the DNS name should resolve to."
  type        = string
  default     = ""
}
