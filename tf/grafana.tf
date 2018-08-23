resource "docker_image" "grafana" {
  name = "grafana/grafana:5.2.3"
  keep_locally = true
}

resource "docker_container" "grafana" {
  name = "grafana"
  image = "${docker_image.grafana.latest}"

  networks = [
    "${docker_network.graprometrics.id}"
  ]
}
