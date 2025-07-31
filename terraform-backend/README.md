# Remote State Setup for Terraform on AWS

This Terraform configuration sets up remote state storage using **Amazon S3** and **DynamoDB**. This enables:

- Centralized and versioned storage of Terraform state files
- State locking and consistency using DynamoDB

## Resources Created

- **S3 Bucket**: Stores the `terraform.tfstate` file
- **DynamoDB Table**: Manages state locking to prevent concurrent operations

## Usage

1. Clone this repository or copy the `backend-setup.tf` file to your directory.

2. Update the bucket name and region in `backend-setup.tf` if needed:

```hcl
bucket = "terraform-remote-state-demo-bucket"
region = "eu-west-2"
```

3. Run the following commands:

```bash
terraform init
terraform apply
```

## Notes

- The S3 bucket has versioning enabled to preserve historical state versions.
- The DynamoDB table uses `LockID` as the hash key for locking support.
