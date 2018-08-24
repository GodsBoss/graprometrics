provider "grafana" {
  url = "${var.grafana_url}"
  auth = "${var.auth}"
}
