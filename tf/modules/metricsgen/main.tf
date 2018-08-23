resource "docker_image" "metricsgen" {
  name = "godsboss/graprometrics:latest"
  keep_locally = true
}

resource "docker_container" "metricsgen" {
  name = "${local.container_name}"
  image = "${docker_image.metricsgen.latest}"

  networks = [
    "${var.network}"
  ]
}
