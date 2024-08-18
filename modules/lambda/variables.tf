variable "environment" {
  description = "Ambiente para o qual a função Lambda está sendo configurada"
  type        = string
}

variable "s3_bucket_name" {
  description = "Nome do bucket do Amazon S3"
  type        = string
  default     = "dev-cinema-data996test"
}

variable "kinesis_stream_name" {
  description = "Nome do stream do Kinesis"
  type        = string
  default = "kinesis-test"
}

variable "dynamodb_table_name" {
  description = "Nome da tabela do DynamoDB"
  type        = string
  default = "dynamo-test"
}

variable "region" {
  description = "Região AWS"
  type        = string
  default = "us-east-1"
}

variable "account_id" {
  description = "ID da conta AWS"
  type        = string
  default = "test"
}
