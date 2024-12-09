resource "aws_secretsmanager_secret" "this" {
  name                    = "${var.prefix}-ephemeral-example"
  recovery_window_in_days = 0

  provisioner "local-exec" {
    command = "aws secretsmanager create-secret --name ${aws_secretsmanager_secret.this.name} --secret-string ${var.secret}"
  }
}

#resource "aws_secretsmanager_secret_version" "this" {
#  secret_id     = aws_secretsmanager_secret.this.id
#  secret_string = var.secret
#}

ephemeral "aws_secretsmanager_secret_version" "this" {
  secret_id = aws_secretsmanager_secret.this.id
  #  secret_string = "secure-secret"
}

#output "secret_id" {
#  value       = ephemeral.aws_secretsmanager_secret_version.this.secret_string
#  description = "Temporary secret ID for accessing database in AWS."
#  ephemeral   = true
#}

#resource "null_resource" "test" {
#  provisioner "local-exec" {
#    command = "echo ${ephemeral.aws_secretsmanager_secret_version.this.secret_string}"
#  }
#}

#resource "aws_ssm_parameter" "this" {
#  name  = "${var.prefix}-secret-ssm"
#  type  = "String"
#  value = ephemeral.aws_secretsmanager_secret_version.this.secret_string
#}

#locals {
#  credentials = jsondecode(ephemeral.aws_secretsmanager_secret.db_master.secret_string)
#}

#resource "aws_db_instance" "default" {
#  allocated_storage    = 10
#  db_name              = "mydb"
#  engine               = "mysql"
#  engine_version       = "8.0"
#  instance_class       = "db.t3.micro"
#  username             = "foo"
#  password             = ephemeral.aws_secretsmanager_secret_version.this.secret_string // ephemeral
#  parameter_group_name = "default.mysql8.0"
#  skip_final_snapshot  = true
#}
