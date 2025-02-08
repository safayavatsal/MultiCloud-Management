resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = 60
  statistic          = "Average"
  threshold          = 80
  alarm_description  = "Trigger alarm when CPU usage exceeds 80%."
  alarm_actions      = [aws_sns_topic.alerts.arn]
  dimensions = {
    InstanceId = var.instance_id
  }
}

resource "aws_sns_topic" "alerts" {
  name = "cloudwatch-alerts-topic"
}

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}
