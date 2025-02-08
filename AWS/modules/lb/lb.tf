resource "aws_launch_template" "webserver-lt" {
  name_prefix   = "webserver-"
  image_id      = var.image
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.allow_http.id]
  }

  user_data = base64encode(<<USER_DATA
#!/bin/bash
apt update
apt -y install apache2
cat <<EOF > /var/www/html/index.html
<html><body><h1>Hello World</h1>
<p>This page was created from a startup script.</p>
</body></html>
EOF
USER_DATA
  )
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP traffic"
  vpc_id      = var.vpc-id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "webserver_lb" {
  name               = "webserver-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets           = var.subnet_ids
}

resource "aws_lb_target_group" "webserver_tg" {
  name     = "webserver-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.webserver_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webserver_tg.arn
  }
}

resource "aws_autoscaling_group" "webserver_asg" {
  name                = "webserver-asg"
  min_size            = 1
  desired_capacity    = 2
  max_size            = 3
  vpc_zone_identifier = var.subnet_ids
  target_group_arns   = [aws_lb_target_group.webserver_tg.arn]

  launch_template {
    id      = aws_launch_template.webserver-lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "webserver-asg"
    propagate_at_launch = true
  }
}
