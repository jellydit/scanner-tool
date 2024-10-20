# Generate a random string for the hostname
resource "random_string" "controller_hostname" {
  count   = var.controller_tasks
  length  = 12
  special = false #no special characters
}

resource "aws_ecs_cluster" "main" {
  name = var.name
}

resource "aws_ecs_task_definition" "controller_task" {
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  container_definition = jsonencode([{
    vars =  (name,controller image,port mappings)
    environment = [{
      name = "HOSTNAME"
      value = random_string.controller_hostname[count.index].result
    }]
  }])
  
  attach ecs_task_role
}

resource "aws_ecs_task_definition" "crawler_task" {
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  container_definition = jsonencode([{
    vars (name,crawler image,port mappings)
  }])
  
  attach ecs_task_role
}

resource "aws_ecs_service" "controller_service" {
  desired_count = var.controller_tasks

  vars
  link to ecs cluster
  attach controller_sg
  assign_public_ip = "DISABLED"
}

resource "aws_ecs_service" "crawler_service" {
  desired_count = var.crawler_tasks

  vars
  link to ecs cluster
  attach crawler_sg
  assign_public_ip = "DISABLED"
}

output "crawler_desired_count" {
  description = "The desired count of crawler tasks"
  value       = var.crawler_tasks
}
