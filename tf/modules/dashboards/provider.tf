provider "grafana" {
  url = "${var.grafana_url}"
  auth = "admin:secret"
}
