output "pet_name" {
  value = "${local.computed_prefix}${random_pet.demo.id}"
}

output "access_token" {
  value     = random_password.token.result
  sensitive = true
}
