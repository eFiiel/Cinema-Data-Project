resource "aws_db_instance" "main" {
  identifier        = "${var.environment}-cinema-db"
  instance_class    = "db.t3.medium"
  allocated_storage = 20
  engine            = "postgres"
  username          = var.db_username
  password          = var.db_password
  db_name           = "cinema_db"
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  tags = {
    Name = "${var.environment}-cinema-db"
  }
}

resource "aws_security_group" "db_sg" {
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-db-sg"
  }
}
