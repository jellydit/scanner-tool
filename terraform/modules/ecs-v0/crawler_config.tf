# could use "local_sensitive file" resource instead, to prevent output of config in tf apply, etc
# but since no secrets here, would be nice to see it for debug purposes during the automation run

resource "local_file" "crawler_config" {
  filename = "${path.cwd}/docker/crawler/config.json"

  content = templatefile("${path.module}/crawler_config.tftpl", {
    controller_hostname   = aws_ecs_service.controller_service.name
    controller_port       = var.controller_port
    chromium_download_url = "http://path.to.chromium"
    chromium_extract_path = "/path/to/chromium"
    debug_port            = var.debug_port
  })
}