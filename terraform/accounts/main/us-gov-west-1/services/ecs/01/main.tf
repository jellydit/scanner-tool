locals {
  cluster_name_prefix = "some_app"
  cluster_number = basename(path.cwd)
}

module "ecs_question_3" {
  source = "../../../../../../modules/ecs-v0"

  name = "${local.cluster_name_prefix}-${local.cluster_number}-${local.aws_region_abbr}"
  other_module_required_vars_here
  
  # number crawler_tasks not set here, would come in from automation script that sets an ENVVAR
}

module "ecs_question_3" {
  source = "../../../../../../modules/ecr-two-repos-v0"

  repo_name_1 = "controller"
  repo_name_2 = "crawler"
  other_module_required_vars_here
}