resource "aws_ecs_task_definition" "strapi" {
  family = "strapi-task"

  network_mode = "bridge"
  requires_compatibilities = ["EC2"]

  container_definitions = jsonencode([
    {
      name = "strapi"
      image = var.image_url

      cpu = 256
      memory = 512

      portMappings = [
        {
          containerPort = 1337
          hostPort = 1337
        }
      ]
    }
  ])
}

