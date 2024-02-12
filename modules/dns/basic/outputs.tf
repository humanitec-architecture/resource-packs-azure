output "host" {
  description = "The DNS name."
  value       = "${var.subdomain}.${var.dns_zone}"
}
