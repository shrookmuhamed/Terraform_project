output myvpc_id {
  value = module.network.myvpc_id
  sensitive = false
}
output "db_password" {
  value     = random_password.password.result
  sensitive = true
}
output "private_key" {
  value     = tls_private_key.key1.private_key_pem
  sensitive = true
}
