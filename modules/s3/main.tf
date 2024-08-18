resource "aws_s3_bucket" "data_bucket" {
  bucket = "${var.environment}-cinema-data996test"

  tags = {
    Name = "${var.environment}-data-bucket"
  }
}
