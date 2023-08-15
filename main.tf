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
}

provider "yandex" {
  zone      = local.zone_id
}

module "yandex_vpc" {
  source = "./modules/yandex_vpc"
}
