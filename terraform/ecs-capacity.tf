data "aws_ami" "ecs" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-ecs-hvm-*"]
  }
}

resource "aws_launch_template" "ecs" {
  name_prefix = "ecs-template"

  image_id = data.aws_ami.ecs.id
  instance_type = "t3.small"

  vpc_security_group_ids = [aws_security_group.ecs.id]

  user_data = base64encode(<<EOF
#!/bin/bash
echo ECS_CLUSTER=strapi-cluster >> /etc/ecs/ecs.config
EOF
)
}

resource "aws_autoscaling_group" "ecs" {
  desired_capacity = 1
  max_size = 2
  min_size = 1

  vpc_zone_identifier = var.subnets

  launch_template {
    id = aws_launch_template.ecs.id
    version = "$Latest"
  }
}

