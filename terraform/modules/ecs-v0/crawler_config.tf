# could use "local_sensitive file" resource instead, to prevent output of config in tf apply, etc
# but since no secrets here, would be nice to see it for debug purposes during the automation run

resource "local_file" "crawler_config" {
  filename = "${path.cwd}/docker/crawler/config.json"

  content = templatefile("${path.module}/crawler_config.tftpl", {
    secret_paths          = [for i in range(var.controller_desired_count) : aws_secretsmanager_secret.controller_secrets[i].name]
    chromium_download_url = "https://url.to.chromium.zip"
    chromium_extract_path = "/opt/chromium_custom"
    debug_port            = var.debug_port
  })
}

resource "aws_secretsmanager_secret" "controller_secrets" {
  count = var.controller_tasks
  name = "controller_secret_${count.index}"
}

resource "aws_secretsmanager_secret_version" "controller_secret_version" {
  secret_id     = aws_secretsmanager_secret.controller_secrets.id
  secret_string = jsonencode({
    hostname = aws_ecs_service.controller_service.name
    port     = var.controller_port
  })
}

resource "aws_secretsmanager_secret_version" "controller_secret_version" {
  count       = var.controller_tasks
  secret_id   = aws_secretsmanager_secret.controller_secrets[count.index].id

  secret_string = jsonencode({
    hostname = random_string.hostname[count.index].result
    port     = var.controller_port
  })
}