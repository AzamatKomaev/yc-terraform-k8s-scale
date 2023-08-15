output "default_network_id" {
  value = yandex_vpc_network.default.id
}

output "default_ruc1_a_subnet_id" {
  value = yandex_vpc_subnet.default-ruc1-a.id
}

output "default_ruc1_b_subnet_id" {
  value = yandex_vpc_subnet.default-ruc1-b.id
}
