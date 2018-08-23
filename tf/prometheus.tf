resource "docker_image" "prometheus" {
  name = "quay.io/prometheus/prometheus:v2.3.2"
}

resource "docker_container" "prometheus" {
  name = "prometheus"
  image = "${docker_image.prometheus.latest}"

  networks = [
    "${docker_network.graprometrics.id}"
  ]
}
