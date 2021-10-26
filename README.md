# aws_s3
Project AWS - Create S3 Bucket with Terraforms, Test with Terratest and Run pipeline CI with Github actions.

## Usage
To use this code you need to either set up AWS CLI (Option A) or Configure Environment variables (Option B).
This is needed so Terraform can create your infrastructure in AWS.

Option A:
To configure your AWS CLI follow the steps outlined in the oficial AWS docs:
https://docs.aws.amazon.com/rekognition/latest/dg/setup-awscli-sdk.html

Option B:
Before executing you must configure the environment variables:

Linux:
```bash
$ export AWS_ACCESS_KEY_ID="XXXXXXXXXXXX"
$ export AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```

Windows:
```
set AWS_ACCESS_KEY_ID="XXXXXXXXXXXX"
set AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```



To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply 
```


Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

## Examples



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.17.1 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Inputs

| Name              | Description | Default |
|-------------------|-------------|---------|
| bucket\_name      | Name of the aws s3 bucket in which the files will be stored as objects | "testbucket-flugel-isv"
| region            | Aws Region. | "us-west-2" 
| acl_value         | ACL value.  | "private"

## Outputs

| Name              | Description |
|-------------------|-------------|
| bucket\_name      | Name of the aws s3 bucket in which the files will be stored as objects |
| file1\_contents   | Contents of file 1. |
| file2\_contents   | Contents of file 2. |
| file1\_name       | Name of file 1. |
| file2\_name       | Name of file 2. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module created and managed by [Ivan Sanchez](https://github.com/ivansanchezvera).

## License

GNU General Public Licensed. See LICENSE for full details.
