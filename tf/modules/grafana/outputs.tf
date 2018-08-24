output "auth" {
  value = "root:${local.pw}"
}

output "port" {
  value = "${var.port}"
}
