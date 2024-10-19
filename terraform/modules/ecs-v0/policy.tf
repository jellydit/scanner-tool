resource "aws_iam_policy" "ecs_task_policy" {
  vars
  policy to allow ECS tasks to access ECR and Cloudwatch
}

resource "aws_iam_role" "ecs_task_role" {
  vars
  establish trust relationship/allow assume role ecs-tasks.amazonaws.com
}

resource "aws_iam_role_policy_attachment" "ecs_task_policy_attachment" {
  vars to attach ecs_task_policy to ecs_task_role
}
