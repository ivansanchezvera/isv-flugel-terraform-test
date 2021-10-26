output "file1_contents" {
  value    = aws_s3_bucket_object.object["1"].content
}

output "file2_contents" {
  value    = aws_s3_bucket_object.object["2"].content
}

output "file1_name" {
  value    = aws_s3_bucket_object.object["1"].key
}

output "file2_name" {
  value    = aws_s3_bucket_object.object["2"].key
}

output "bucket_name" {
  value    = module.s3.bucket_final_name
} 