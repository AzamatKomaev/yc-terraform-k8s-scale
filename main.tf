terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

locals {
  zone_id   = "ru-central1-b"
  folder_id = "b1g61a9am7f9hp4hcqjp"
}

provider "yandex" {
  zone = local.zone_id
}

module "yandex_vpc" {
  source = "./modules/yandex_vpc"
}

module "yandex_iam" {
  source = "./modules/yandex_iam"

  folder_id = local.folder_id
}

module "yandex_k8s" {
  source = "./modules/yandex_k8s"

  yc_scale_k8s_cluster_ipv4_range                  = "10.112.0.0/16"
  yc_scale_k8s_cluster_service_ipv4_range          = "10.96.0.0/16"
  yc_scale_k8s_cluster_network_id                  = module.yandex_vpc.default_network_id
  yc_scale_k8s_cluster_resource_service_account_id = module.yandex_iam.k8s_resource_service_account_id
  yc_scale_k8s_cluster_node_service_account_id     = module.yandex_iam.k8s_nodes_service_account_id
  yc_scale_k8s_cluster_master_zonal_subnet_id      = module.yandex_vpc.default_ruc1_b_subnet_id

  yc_scale_k8s_node_group_ru_central1_a_subnet_id = module.yandex_vpc.default_ruc1_a_subnet_id
  yc_scale_k8s_node_group_ru_central1_b_subnet_id = module.yandex_vpc.default_ruc1_b_subnet_id

}
