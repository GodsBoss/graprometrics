resource "docker_network" "graprometrics" {
  name = "graprometrics"
}

module "metricsgen" {
  source = "./modules/metricsgen"

  network = "${docker_network.graprometrics.id}"
}

module "prometheus" {
  source = "./modules/prometheus"

  network = "${docker_network.graprometrics.id}"
  scrape_target = "${module.metricsgen.scrape_host}"
}

module "grafana" {
  source = "./modules/grafana"

  network = "${docker_network.graprometrics.id}"
}