resource "local_file" "automation_script" {
  filename = "${path.cwd}/automation_script.sh"
  
  content  = templatefile("${path.module}/automation_script.tftpl", {
    aws_region      = var.aws_region
    account_id      = data.aws_account_id
    controller_repo = aws_ecr_repository.repo1.name
    crawler_repo    = aws_ecr_repository.repo2.name
  })

  file_permission = "0755" # Make the script executable
}
