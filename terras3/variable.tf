# variable "aws_access_key" {
# }

# variable "aws_secret_key" {
# }

variable "region" {
    default = "us-west-2"
}

variable "bucket_name" {
    default = "testbucket-flugel-isv"
}

variable "acl_value" {
    default = "private"
}