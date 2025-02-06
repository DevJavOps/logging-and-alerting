provider "aws" {
  region = "us-west-2"
}

resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/example"
  retention_in_days = 14
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  alarm_name          = "cpu_utilization_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors EC2 CPU utilization"
  actions_enabled     = true

  alarm_actions = [
    "arn:aws:sns:us-west-2:123456789012:my-sns-topic"
  ]

  dimensions = {
    InstanceId = "i-1234567890abcdef0"
  }
}
