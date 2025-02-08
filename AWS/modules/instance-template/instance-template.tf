resource "aws_launch_template" "ws_instance_template" {
  count         = var.enable_autoscaling ? 1 : 0
  name_prefix   = "${var.name}-template"
  image_id      = var.image
  instance_type = var.instance_type
  key_name      = var.ssh_key_name

  vpc_security_group_ids = [var.security_group_id]

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = var.subnet_id
  }

  user_data = filebase64("${path.module}/scripts/startup.sh")

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.name}-instance"
      Environment = var.env
    }
  }
}
