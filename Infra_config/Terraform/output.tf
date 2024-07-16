output "aws_s3_bucket" {
  value = aws_s3_bucket.s3bucket.id
}

output "aws_dynamodb_table" {
  value = aws_dynamodb_table.terraform-state.name
}

# output "instance_id" {
#   value = aws_instance.ec2-provisioner-example[*].id
# }