global:
  scrape_interval:     10s
  evaluation_interval: 15s

scrape_configs:
  - job_name: "Random name"
    static_configs:
    - targets:
      - "${metrics_provider}"
