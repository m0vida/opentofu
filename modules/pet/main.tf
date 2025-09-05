terraform {
  required_providers {
    random = { source = "hashicorp/random", version = "~> 3.6" }
  }
}
provider "random" {}

locals { computed_prefix = var.prefix != "" ? "${var.prefix}-" : "" }

resource "random_pet" "demo" { length = var.length  separator = "-" }
resource "random_password" "token" { length = var.token_length  special = false }
