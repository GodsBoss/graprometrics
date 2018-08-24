resource "grafana_data_source" "metricsgen" {
  type = "prometheus"
  name = "metricsgen"
  url = "${var.prometheus_url}"
}
