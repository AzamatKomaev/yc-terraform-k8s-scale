resource "yandex_iam_service_account" "k8s-nodes" {
  description = "Service account used to manage container registry"
  name        = "k8s-nodes"
}

resource "yandex_iam_service_account" "k8s-resource" {
  description = "Service account used to manage k8s node groups / resources "
  name        = "k8s-resource"
}

