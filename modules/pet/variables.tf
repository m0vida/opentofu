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
