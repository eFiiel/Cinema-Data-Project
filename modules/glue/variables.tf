variable "environment" {
  description = "O ambiente em que o Terraform será executado (dev, staging, prod)"
  type        = string
}

variable "data_bucket" {
  description = "Nome do bucket S3 onde os dados são armazenados"
  type        = string
  default = "teste223141"
}
