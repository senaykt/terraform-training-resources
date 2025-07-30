provider "aws" {
  region = var.aws_region
}

resource "aws_sns_topic" "alarm_topic" {
  name = "ec2-high-cpu-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alarm_topic.arn
  protocol  = "email"
  endpoint  = var.notification_email
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "high-cpu-${var.instance_id}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 10
  alarm_description   = "This alarm triggers if CPU > 10% for 4 minutes"
  dimensions = {
    InstanceId = var.instance_id
  }
  treat_missing_data = "missing"
  alarm_actions       = [aws_sns_topic.alarm_topic.arn]
}