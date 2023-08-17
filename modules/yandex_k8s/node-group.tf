resource "yandex_kubernetes_node_group" "yc-scale-node-group1" {
  cluster_id = yandex_kubernetes_cluster.yc-scale.id
  name       = "yc-scale-node-group-1"
  version    = yandex_kubernetes_cluster.yc-scale.master[0].version

  allocation_policy {
    location {
      zone = "ru-central1-a"
    }
  }

  instance_template {
    platform_id = "standard-v1"

    metadata = {
      ssh-keys = "admin:${file("~/.ssh/id_ed25519.pub")}"
    }

    boot_disk {
      size = 64
      type = "network-hdd"
    }

    container_runtime {
      type = "containerd"
    }

    network_interface {
      ipv4               = true
      nat                = true
      security_group_ids = []
      subnet_ids         = [var.yc_scale_k8s_node_group_ru_central1_a_subnet_id]
    }

    resources {
      core_fraction = 5
      cores         = 2
      gpus          = 0
      memory        = 1
    }

    scheduling_policy {
      preemptible = true
    }
  }

  maintenance_policy {
    auto_repair  = false
    auto_upgrade = true
  }

  scale_policy {
    auto_scale {
      initial = 1
      min = 1
      max = 3
    }
  }
}

resource "yandex_kubernetes_node_group" "yc-scale-node-group2" {
  cluster_id = yandex_kubernetes_cluster.yc-scale.id
  name       = "yc-scale-node-group-2"
  version    = yandex_kubernetes_cluster.yc-scale.master[0].version

  allocation_policy {
    location {
      zone = "ru-central1-b"
    }
  }

  instance_template {
    platform_id = "standard-v1"

    metadata = {
      ssh-keys = "admin:${file("~/.ssh/id_ed25519.pub")}"
    }

    boot_disk {
      size = 64
      type = "network-hdd"
    }

    container_runtime {
      type = "containerd"
    }

    network_interface {
      ipv4               = true
      nat                = true
      security_group_ids = []
      subnet_ids         = [var.yc_scale_k8s_node_group_ru_central1_b_subnet_id]
    }

    resources {
      core_fraction = 5
      cores         = 2
      gpus          = 0
      memory        = 1
    }

    scheduling_policy {
      preemptible = true
    }
  }

  maintenance_policy {
    auto_repair  = false
    auto_upgrade = true
  }

  scale_policy {
    auto_scale {
      initial = 1
      min = 1
      max = 3
    }
  }
}

