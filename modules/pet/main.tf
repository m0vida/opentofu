terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

# REMOVE empty provider "random" {} here (it’s deprecated)
# provider "random" {}  <-- delete this line

locals {
  computed_prefix = var.prefix != "" ? "${var.prefix}-" : ""
}

resource "random_pet" "demo" {
  length    = var.length
  separator = "-"
}

resource "random_password" "token" {
  length  = var.token_length
  special = false
}
