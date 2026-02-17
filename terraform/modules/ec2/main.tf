data "aws_ami" "ecs_ubuntu" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["*ecs-ubuntu-jammy-*"]
  }
}

resource "aws_iam_role" "ecs_ec2_role" {
  name = "jaspal-ecs-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_policy" {
  role       = aws_iam_role.ecs_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs_profile" {
  name = "jaspal-ecs-ec2-profile"
  role = aws_iam_role.ecs_ec2_role.name
}

resource "aws_instance" "ecs" {
  ami                    = data.aws_ami.ecs_ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  iam_instance_profile   = aws_iam_instance_profile.ecs_profile.name
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "jaspal-ecs-container-instance"
  }

  user_data = <<EOF
#!/bin/bash
echo ECS_CLUSTER=${var.ecs_cluster_name} >> /etc/ecs/ecs.config
EOF
}
