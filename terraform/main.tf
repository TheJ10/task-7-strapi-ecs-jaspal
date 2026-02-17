module "vpc" {
  source = "./modules/vpc"
}

module "rds" {
  source      = "./modules/rds"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.subnet_ids
  db_password = var.db_password
}

module "ecs" {
  source = "./modules/ecs"
}

module "ec2" {
  source              = "./modules/ec2"
  subnet_id            = module.vpc.subnet_ids[0]
  ecs_cluster_name     = module.ecs.cluster_name
  security_group_id    = var.ecs_security_group_id
}

module "ecs_service" {
  source       = "./modules/ecs-service"
  cluster_name = module.ecs.cluster_name
  image_url    = var.image_url
  db_host      = module.rds.db_host
}
