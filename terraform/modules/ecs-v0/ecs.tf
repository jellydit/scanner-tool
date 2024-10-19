resource "aws_ecs_cluster" "main" {
  name
}

resource "aws_ecs_task_definition" "controller_task" {
  vars
  controller image
  port mappings
  attach ecs_task_role
}

resource "aws_ecs_task_definition" "crawler_task" {
  vars
  crawler image
  port mappings
  attach ecs_task_role
}

resource "aws_ecs_service" "controller_service" {
  vars
  link to ecs cluster
  attach controller_sg
}

resource "aws_ecs_service" "crawler_service" {
  vars
  link to ecs cluster
  attach crawler_sg
}
