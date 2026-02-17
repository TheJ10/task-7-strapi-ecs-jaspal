resource "aws_instance" "ecs" {
  ami                    = "ami-0e4d9c8f7a6b5d2c3"
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  iam_instance_profile   = "ecsInstanceRole"
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "jaspal-ecs-container-instance"
  }

  user_data = <<EOF
#!/bin/bash
echo ECS_CLUSTER=${var.ecs_cluster_name} >> /etc/ecs/ecs.config
EOF
}
