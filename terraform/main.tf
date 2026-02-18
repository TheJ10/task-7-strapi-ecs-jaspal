module "ecs_jaspal_task7" {
  source = "./modules/ecs"

  image_tag           = var.image_tag
  dockerhub_repo      = var.dockerhub_repo
  execution_role_arn = var.execution_role_arn
  subnet_ids          = var.subnet_ids

  db_host     = var.db_host
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

}
