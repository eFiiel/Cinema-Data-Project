resource "aws_glue_catalog_database" "main" {
  name = "${var.environment}_cinema_db"

  tags = {
    Name = "${var.environment}-glue-db"
  }
}

resource "aws_glue_catalog_table" "main" {
  name          = "${var.environment}_cinema_table"
  database_name = aws_glue_catalog_database.main.name
  table_type    = "EXTERNAL_TABLE"

  storage_descriptor {
    columns {
      name = "CamCode"
      type = "string"
    }

    columns {
      name = "Timestamp"
      type = "timestamp"
    }

    columns {
      name = "ClientCode"
      type = "string"
    }

    columns {
      name = "QrContent"
      type = "string"
    }

    columns {
      name = "Lat"
      type = "decimal"
    }

    columns {
      name = "Long"
      type = "decimal"
    }

    location = "s3://${var.data_bucket}/zona-prata/data"
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"
  }
}
