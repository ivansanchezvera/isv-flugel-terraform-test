resource "aws_s3_bucket" "demo-flugel" {
    bucket = "${var.bucket_name}" 
    acl = "${var.acl_value}"   
}

output "bucket_final_name" {
  value = aws_s3_bucket.demo-flugel.bucket
}
