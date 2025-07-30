# terraform-cloudwatch-sns

This Terraform module creates a CloudWatch alarm for an existing EC2 instance and sends an email notification via Amazon SNS when CPU utilization exceeds a defined threshold.

## Resources Created

- CloudWatch Metric Alarm  
  Triggers when EC2 instance CPU usage exceeds 70% for 4 minutes.
- SNS Topic  
  Notification channel to publish alerts.
- SNS Email Subscription  
  Sends an alert email to the provided address.

## Usage

1. Download or clone this repository.

2. Update `terraform.tfvars` with your values:

   ```hcl
   aws_region         = "eu-west-2"
   instance_id        = "i-0123456789abcdef0"
   notification_email = "your-email@example.com"
   ```

3. Initialize and apply:

   ```bash
   terraform init
   terraform apply -var-file="terraform.tfvars"
   ```

4. Confirm the email subscription.  
   AWS will send an email to your address. You must confirm it before receiving alerts.

## Requirements

- Terraform CLI (v1.0 or higher recommended)
- AWS credentials configured (e.g., using `aws configure`)
- A valid EC2 instance ID

## Outputs

- `alarm_name` – Name of the CloudWatch alarm
- `sns_topic_arn` – ARN of the SNS topic

## Notes

- You can change the threshold or duration in `main.tf`.
- SNS supports other protocols such as Lambda, HTTPS, or SMS for alerting.