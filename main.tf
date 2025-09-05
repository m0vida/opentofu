variable "prefix" {
  type        = string
  default     = ""
  description = "Prefix for the pet name"
}

variable "length" {
  type        = number
  default     = 2
  description = "Word count for random_pet"
}

variable "token_length" {
  type        = number
  default     = 16
  sensitive   = true
  description = "Length of demo access token"
}

module "pet" {
  source       = "./modules/pet"
  prefix       = var.prefix
  length       = var.length
  token_length = var.token_length
}

output "pet_name" {
  value = module.pet.pet_name
}

output "access_token" {
  value     = module.pet.access_token
  sensitive = true
}

output "workspace" {
  value = terraform.workspace
}
