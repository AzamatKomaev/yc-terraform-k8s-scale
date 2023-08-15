resource "yandex_resourcemanager_folder_iam_binding" "k8s-resource" {
  folder_id = var.folder_id
  members = [
    "serviceAccount:${yandex_iam_service_account.k8s-resource.id}"
  ]
  role = "editor"
}

resource "yandex_resourcemanager_folder_iam_binding" "k8s-nodes" {
  folder_id = var.folder_id
  members = [
    "serviceAccount:${yandex_iam_service_account.k8s-nodes.id}"
  ]
  role = "container-registry.images.puller"
}
