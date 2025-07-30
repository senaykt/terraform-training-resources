# Terraform Demo – Setup and Usage Guide

This project demonstrates how to use Terraform to provision a basic AWS S3 bucket. Follow the instructions below to prepare your environment and execute the Terraform scripts.

---

## Requirements

- Ubuntu-based Linux server
- AWS account with IAM user and access keys
- Billing enabled in AWS

---

## 1. Install Terraform

```bash
sudo apt update
sudo apt install -y unzip curl
curl -fsSL https://releases.hashicorp.com/terraform/1.12.2/terraform_1.12.2_linux_amd64.zip -o terraform.zip
unzip terraform.zip
sudo mv terraform /usr/local/bin/
terraform -version
```

---

## 2. Install AWS CLI v2

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

---

## 3. Configure AWS Credentials

```bash
aws configure
```

Provide the following:
- AWS Access Key ID
- AWS Secret Access Key
- Default region name (e.g., eu-central-1)
- Default output format (e.g., json)

---

## 4. Run the Terraform Project

Unzip the project files and change into the directory:

```bash
unzip terraform-demo.zip
cd terraform-demo
```

Then execute the following Terraform commands:

```bash
terraform init
terraform plan
terraform apply
```

Confirm the apply step with `yes` when prompted.

---

## Notes

- The S3 bucket name must be globally unique. If you see a `bucket already exists` error, try changing the bucket name in `terraform.tfvars`.
- To remove all created resources:

```bash
terraform destroy
```

---

This project is intended for educational use. For real-world deployments, consider using backend configuration, remote state, modules, and workspaces.
