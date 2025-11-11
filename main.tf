terraform {
  required_version = ">= 1.0"
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory/hosts.ini"
  content = templatefile("${path.module}/templates/inventory.tpl", {
    devops_ip    = "172.16.16.7"
    sre_ip       = "172.16.16.8"
    rocky_01_ip  = "172.16.16.9"
    rocky_02_ip  = "172.16.16.10"
  })
}

output "server_info" {
  value = {
    devops_tools    = "172.16.16.7"
    sre_monitoring  = "172.16.16.8"
    rocky_app_01    = "172.16.16.9"
    rocky_app_02    = "172.16.16.10"
  }
  description = "Server IP addresses for your lab environment"
}
