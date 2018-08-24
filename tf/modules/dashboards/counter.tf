resource "grafana_dashboard" "counter" {
  config_json = "${file("${path.module}/counter-config.json")}"

  depends_on = [
    "grafana_data_source.metricsgen"
  ]
}
