variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "instance_id" {
  description = "ID of the EC2 instance to monitor"
  type        = string
}

variable "notification_email" {
  description = "Email address to receive alarm notifications"
  type        = string
}