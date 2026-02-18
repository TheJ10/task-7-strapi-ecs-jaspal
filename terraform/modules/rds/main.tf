data "aws_db_subnet_group" "jaspal_task7_db_subnet_group" {
  name = "jaspal-task7-db-subnet-group"
}
data "aws_db_instance" "jaspal_task7_db" {
  db_instance_identifier = "jaspal-task7-strapi-db"
}
