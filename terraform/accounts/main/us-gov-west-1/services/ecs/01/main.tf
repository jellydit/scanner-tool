locals {
  cluster_name_prefix = "ecs"
  cluster_number = basename(path.cwd)
}

module "ecs_question_3" {
  source = "../../../../../../modules/ecs-v0"

  name = "${local.cluster_name_prefix}-${local.cluster_number}-${local.aws_region_abbr}"
  other_module_required_vars_here
}