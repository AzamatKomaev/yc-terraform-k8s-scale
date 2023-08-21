resource "yandex_mdb_postgresql_cluster" "postcreator-psql" {
  deletion_protection = true
  environment         = "PRODUCTION"
  name                = "postcreator-psql"
  network_id          = var.postgres_network_id

  config {
    version                   = "14"
    autofailover              = true
    backup_retain_period_days = 7
    postgresql_config = {
      max_connections          = "100"
      shared_preload_libraries = ""
    }
    access {
      data_lens     = false
      data_transfer = false
      serverless    = false
      web_sql       = false
    }
    backup_window_start {
      hours   = 2
      minutes = 30
    }
    performance_diagnostics {
      enabled                      = false
      sessions_sampling_interval   = 10
      statements_sampling_interval = 600
    }
    resources {
      disk_size          = 20
      disk_type_id       = "network-ssd"
      resource_preset_id = "b1.medium"
    }
  }

  host {
    assign_public_ip = false
    subnet_id        = var.postgres_subnet_id
    zone             = var.postgres_zone_id
  }
}
