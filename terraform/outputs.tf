output "ecs_cluster" {
  value = module.ecs.cluster_name
}
output "rds_endpoint" {
  value = module.rds.db_host
}
output "ecs_service" {
  value = module.ecs_service.service_name
}
