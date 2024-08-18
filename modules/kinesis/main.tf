resource "aws_kinesis_stream" "data_stream" {
  name        = "${var.environment}-cinema-stream"
  shard_count = 1

  tags = {
    Name = "${var.environment}-data-stream"
  }
}
