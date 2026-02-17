variable "db_password" {
  type      = string
  sensitive = true
}

variable "ecs_security_group_id" {
  type = string
}
variable "image_url" {
  type = string
}
