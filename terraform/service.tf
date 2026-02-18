resource "aws_ecs_service" "strapi" {
  name = "strapi-service-v2"
  cluster = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.strapi.arn
  desired_count = 1
}

