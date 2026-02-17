resource "aws_ecs_task_definition" "strapi" {
  family                   = "jaspal-strapi-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"

  execution_role_arn = "arn:aws:iam::811738710312:role/ecsTaskExecutionRole"

  container_definitions = jsonencode([
    {
      name      = "strapi"
      image     = var.image_url
      essential = true
      portMappings = [
        {
          containerPort = 1337
          protocol      = "tcp"
        }
      ]
      environment = [
        { name = "DATABASE_CLIENT", value = "sqlite" }
      ]
    }
  ])
}
