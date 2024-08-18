variable "vpc_id" {
  description = "ID da VPC onde o RDS será provisionado"
  type        = string
  default = "1"
}

variable "db_username" {
  description = "Nome de usuário para o banco de dados"
  type        = string
  default = "admin"
}

variable "db_password" {
  description = "Senha para o banco de dados"
  type        = string
  default = "admin"
}

variable "environment" {
  description = "O ambiente em que o Terraform será executado (dev, staging, prod)"
  type        = string
}