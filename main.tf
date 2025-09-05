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

locals {
  computed_prefix = var.prefix != "" ? "${var.prefix}-" : ""
}

resource "random_pet" "demo" {
  length    = 2
  separator = "-"
}

output "pet_name" {
  value = "${local.computed_prefix}${random_pet.demo.id}"
}
