resource "random_id" "app_name_suffix" {
  byte_length = 4
}

resource "aws_instance" "apps" {
  for_each          = toset(var.zones)
  availability_zone = each.key
  ami              = var.image
  instance_type    = var.instance_type

  vpc_security_group_ids = [var.security_group_id] # Ensure the instance is attached to a security group
  subnet_id             = var.subnet_id           # Attach to the correct subnet

  tags = {
    Name = "apps-${random_id.app_name_suffix.hex}-${each.key}"
  }
}
