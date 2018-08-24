resource "docker_image" "prometheus" {
  name = "quay.io/prometheus/prometheus:v2.3.2"
  keep_locally = true
}

resource "docker_container" "prometheus" {
  name = "prometheus"
  image = "${docker_image.prometheus.latest}"

  networks = [
    "${var.network}"
  ]

  upload {
    file = "/etc/prometheus/prometheus.yml"
    content = "${data.template_file.prometheus_config.rendered}"
  }
}

data "template_file" "prometheus_config" {
  template = "${file("${path.module}/etc/prometheus/prometheus.yml.tpl")}"

  vars {
    metrics_provider = "${var.scrape_target}"
  }
}
