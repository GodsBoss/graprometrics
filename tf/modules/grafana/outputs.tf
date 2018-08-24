output "auth" {
  value = "admin:${local.pw}"
}

output "port" {
  value = "${var.port}"
}
