resource "yandex_vpc_subnet" "default-ruc1-a" {
  name           = "default-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = [var.default_ru_central1_a_subnet_cidr_block]
}

resource "yandex_vpc_subnet" "default-ruc1-b" {
  name           = "default-ru-central1-b"
  zone           = "ru-central1-b"  
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = [var.default_ru_central1_b_subnet_cidr_block]
}
