resource "yandex_mdb_postgresql_database" "db1" {
  cluster_id          = yandex_mdb_postgresql_cluster.postcreator-psql.id
  deletion_protection = "unspecified"
  lc_collate          = "C"
  lc_type             = "C"
  name                = "db1"
  owner               = "user1"
}
