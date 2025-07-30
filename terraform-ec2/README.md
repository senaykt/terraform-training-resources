# Terraform EC2 Full Setup – London Region

This project launches an EC2 instance in AWS London (eu-west-2) with:

- Security Group allowing SSH
- Key Pair for secure access
- User Data script (installs Nginx)
- Public IP output

## Requirements

- AWS account and access credentials
- A public SSH key (`id_rsa.pub`) in the project folder

## 1. Configure AWS CLI

```bash
aws configure
```

## 2. Run Terraform

```bash
terraform init
terraform plan
terraform apply
```

Confirm with `yes` when prompted.

## 3. SSH Access

After apply completes, use the output IP:

```bash
ssh -i ~/.ssh/id_rsa ubuntu@<public_ip>
```

## 4. Verify Nginx

Visit `http://<public_ip>` to see the Nginx welcome page.

## 5. Destroy Resources

```bash
terraform destroy
```