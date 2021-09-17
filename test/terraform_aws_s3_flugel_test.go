package test

import (

	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"

)

// An example of how to test the Terraform module in examples/terraform-aws-s3-example using Terratest.
func TestTerraformAwsS3ExampleFlugel(t *testing.T) {
	t.Parallel()

	// Give this S3 Bucket an environment to operate as a part of for the purposes of resource tagging
	//expectedEnvironment := "Automated Testing"

	// Pick a random AWS region to test in. This helps ensure your code works in all regions.
	//awsRegion := aws.GetRandomStableRegion(t, nil, nil)

	// Construct the terraform options with default retryable errors to handle the most common retryable errors in
	// terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../terras3",

		// Variables to pass to our Terraform code using -var options
		// Vars: map[string]interface{}{
		// 	"tag_bucket_name":        expectedName,
		// 	"tag_bucket_environment": expectedEnvironment,
		// 	"with_policy":            "true",
		// 	"region":                 awsRegion,
		// },
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	contentsFile1 := terraform.Output(t, terraformOptions, "file1_contents")
	contentsFile2 := terraform.Output(t, terraformOptions, "file2_contents")

	// Mi codigo: Assertions to validate bucket existance and file contents.
	aws.AssertS3BucketExists(t, "us-east-1", "testbucket-flugel-isv")
	contentFile1 := aws.GetS3ObjectContents(t, "us-east-1", "testbucket-flugel-isv", "test1.txt")
	assert.Equal(t, contentsFile1, contentFile1)

	contentFile2 := aws.GetS3ObjectContents(t, "us-east-1", "testbucket-flugel-isv", "test2.txt")
	assert.Equal(t, contentsFile2, contentFile2)
}


