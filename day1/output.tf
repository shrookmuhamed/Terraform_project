output myvpc_id {
  value = module.network.myvpc_id
  sensitive = false
}
output "db_password" {
  value     = random_password.password.result
  sensitive = true
}
