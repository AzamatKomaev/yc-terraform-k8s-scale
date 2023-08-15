output "k8s_nodes_service_account_id" {
  value = yandex_iam_service_account.k8s-nodes.id
}

output "k8s_resource_service_account_id" {
  value = yandex_iam_service_account.k8s-resource.id
}
