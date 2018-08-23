resource "docker_image" "grafana" {
  name = "grafana/grafana:5.2.3"
  keep_locally = true
}

resource "docker_container" "grafana" {
  name = "${local.container_name}"
  image = "${docker_image.grafana.latest}"

  networks = [
    "${var.network}"
  ]

  ports = {
    internal = 3000
    external = 3000
  }

  env = [
    "GF_SECURITY_ADMIN_PASSWORD=${local.pw}"
  ]
}
