terraform {
  required_version = ">= 1.5.0"
  # backend "s3" {
  #   bucket = "cinema-booth-terraform-state996test"
  #   key    = "global/s3/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

module "vpc" {
  source      = "./modules/vpc"
  environment = var.environment
}

module "s3" {
  source      = "./modules/s3"
  environment = var.environment
}

module "rds" {
  source      = "./modules/rds"
  environment = var.environment
}

module "kinesis" {
  source      = "./modules/kinesis"
  environment = var.environment
}

module "glue" {
  source      = "./modules/glue"
  environment = var.environment
}

module "lambda" {
  source      = "./modules/lambda"
  environment = var.environment
}
