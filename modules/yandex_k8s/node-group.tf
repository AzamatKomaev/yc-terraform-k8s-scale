resource "yandex_kubernetes_node_group" "autovill-group-node" {
  cluster_id = yandex_kubernetes_cluster.yc-scale.id
  name       = "yc-scale-node-group-1"
  version    = yandex_kubernetes_cluster.k8s-autovill.master[0].version

  allocation_policy {
    location {
      zone = var.autovill_group_node_location_zone_id
    }
  }

  instance_template {
    platform_id = "standard-v3"

    metadata = {
      ssh-keys = "${var.autovill_group_node_instance_user_name}:${file("${var.autovill_group_node_instance_ssh_key}")}"
    }

    boot_disk {
      size = 64
      type = "network-hdd"
    }

    container_runtime {
      type = var.autovill_group_node_container_runtime_type
    }

    network_interface {
      ipv4               = true
      nat                = true
      security_group_ids = []
      subnet_ids         = var.autovill_group_node_instance_subnet_ids
    }

    resources {
      core_fraction = 20
      cores         = 4
      gpus          = 0
      memory        = 12
    }
  }

  maintenance_policy {
    auto_repair  = false
    auto_upgrade = true
  }

  scale_policy {
    fixed_scale {
      size = 1
    }
  }
}
