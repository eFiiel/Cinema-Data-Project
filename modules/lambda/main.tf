# Função Lambda
resource "aws_lambda_function" "qr_code_processor" {
  filename         = "lambda/qr_code_processor.zip"
  function_name    = "${var.environment}_qr_code_processor"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "index.handler"
  runtime          = "python3.8"
  timeout          = 30

  environment {
    variables = {
      S3_BUCKET         = var.s3_bucket_name
      KINESIS_STREAM    = var.kinesis_stream_name
      DYNAMODB_TABLE    = var.dynamodb_table_name
    }
  }

  tags = {
    Name = "${var.environment}-qr-code-processor"
  }
}

# IAM Role para Lambda
resource "aws_iam_role" "lambda_exec" {
  name = "${var.environment}_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Política IAM associada à Lambda Role
resource "aws_iam_role_policy" "lambda_policy" {
  name = "${var.environment}_lambda_policy"
  role = aws_iam_role.lambda_exec.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ],
        Resource = "arn:aws:s3:::${var.s3_bucket_name}/*"
      },
      {
        Effect = "Allow",
        Action = [
          "glue:CreateTable",
          "glue:UpdateTable",
          "glue:BatchCreatePartition",
          "glue:BatchDeletePartition",
          "glue:GetTable",
          "glue:GetTableVersion"
        ],
        Resource = "arn:aws:glue:${var.region}:${var.account_id}:catalog"
      },
      {
        Effect = "Allow",
        Action = [
          "kinesis:PutRecord",
          "kinesis:PutRecords"
        ],
        Resource = "arn:aws:kinesis:${var.region}:${var.account_id}:stream/${var.kinesis_stream_name}"
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:Query",
          "dynamodb:Scan"
        ],
        Resource = "arn:aws:dynamodb:${var.region}:${var.account_id}:table/${var.dynamodb_table_name}"
      }
    ]
  })
}

# Anexar a política básica de execução Lambda
resource "aws_iam_role_policy_attachment" "basic_execution" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role     = aws_iam_role.lambda_exec.name
}
