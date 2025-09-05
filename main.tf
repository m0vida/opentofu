variable "prefix"       { type = string  default = "" }
variable "length"       { type = number  default = 2 }
variable "token_length" { type = number  default = 16  sensitive = true }

module "pet" {
  source       = "./modules/pet"
  prefix       = var.prefix
  length       = var.length
  token_length = var.token_length
}

output "pet_name"   { value = module.pet.pet_name }
output "access_token" { value = module.pet.access_token  sensitive = true }
output "workspace"  { value = terraform.workspace }
