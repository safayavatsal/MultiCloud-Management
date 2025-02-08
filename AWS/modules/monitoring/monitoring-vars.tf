variable "instance_id" {
  description = "EC2 Instance ID to monitor"
  type        = string
}

variable "alert_email" {
  description = "Email address for receiving alerts"
  type        = string
}
