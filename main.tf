terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "random" {}

variable "prefix" {
  type        = string
  description = "Προαιρετικό prefix για το pet name"
  default     = ""
}

variable "token_length" {
  type        = number
  description = "Μήκος demo token (θα εμφανιστεί ως sensitive)"
  default     = 16
  sensitive   = true
}

locals {
  computed_prefix = var.prefix != "" ? "${var.prefix}-" : ""
}

resource "random_pet" "demo" {
  length    = 2
  separator = "-"
}

resource "random_password" "token" {
  length  = var.token_length
  special = false
}

output "pet_name" {
  value = "${local.computed_prefix}${random_pet.demo.id}"
}

output "access_token" {
  value     = random_password.token.result
  sensitive = true   # << Κρυφό σε plan/apply logs & outputs
}
