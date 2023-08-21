resource "yandex_mdb_postgresql_user" "user1" {
  cluster_id          = yandex_mdb_postgresql_cluster.postcreator-psql.id
  name                = "user1"
  password            = "password12345"
  conn_limit          = 80
  deletion_protection = "unspecified"
}