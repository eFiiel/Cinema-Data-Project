variable "region" {
  description = "A região da AWS para o provisionamento dos recursos"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "O ambiente em que o Terraform será executado (dev, staging, prod)"
  type        = string
  default     = "dev"
}
