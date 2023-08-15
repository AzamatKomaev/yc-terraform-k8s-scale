resource "yandex_kubernetes_cluster" "yc-scale" {
  name                     = "yc-scale"
  release_channel          = "STABLE"
  network_id               = var.yc_scale_k8s_cluster_network_id
  node_service_account_id  = var.yc_scale_k8s_cluster_node_service_account_id
  service_account_id       = var.yc_scale_k8s_cluster_resource_service_account_id
  cluster_ipv4_range       = var.yc_scale_k8s_cluster_ipv4_range
  service_ipv4_range       = var.yc_scale_k8s_cluster_service_ipv4_range
  node_ipv4_cidr_mask_size = 24

  master {
    public_ip = true
    version   = "1.26"
    zonal {
      subnet_id = var.yc_scale_k8s_cluster_master_zonal_subnet_id
      zone      = "ru-central1-b"
    }
  }
}
