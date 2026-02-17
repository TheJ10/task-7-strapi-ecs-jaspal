resource "aws_ecs_service" "strapi" {
  name            = "jaspal-strapi-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.strapi.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = [aws_security_group.fargate.id]
    assign_public_ip = true
  }
}
