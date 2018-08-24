output "auth" {
  value = "root:${local.pw}"
}

output "url" {
  value = "http://${local.container_name}:3000/"
}
