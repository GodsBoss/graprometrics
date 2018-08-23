output "auth" {
  value = "root:${local.pw}"
}

output "host" {
  value = "${local.container_name}"
}
