terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.56.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # region = "${var.region}" #Commented in favor of environment variables to use as github secrets in repo
    region = "us-west-2"
  # region = "${var.region}"
}

# TEST #1


#     Create Terraform code to create an AWS S3 bucket with two files: test1.txt and test2.txt. The content of these files must be the timestamp when the code was executed. (DONE)
#     Using Terratest, create the test automation for the Terraform code, validating that both files and the bucket are created successfully. 
#     Setup Github Actions to run a pipeline to validate this code.
#     Publish your code in a public GitHub repository, and share a Pull Request with your code. Do not merge into master until the PR is approved.
#     Include documentation describing the steps to run and test the automation.

module "s3" {
  source = "./s3"
  bucket_name = "testbucket-flugel-isv"
}


resource "aws_s3_bucket_object" "object" {
  
  bucket = module.s3.bucket_final_name

  # key    = "test1.txt"
  content = "${timestamp()}"
  content_type = "text/plain"

  for_each = toset( ["1", "2"] )
  key    = "test${each.key}.txt"

 

  # # The filemd5() function is available in Terraform 0.11.12 and later
  # # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # # etag = "${md5(file("path/to/file"))}"
  # etag = filemd5("path/to/file")

}

output "file1_contents" {
  # for_each = toset( ["1", "2"] )
  value    = aws_s3_bucket_object.object["1"].content
}

output "file2_contents" {
  # for_each = toset( ["1", "2"] )
  value    = aws_s3_bucket_object.object["2"].content
}
