output "api_url" {
  description = "Local API URL"
  value       = "http://127.0.0.1:${var.host_port}"
}

output "container_name" {
  value = docker_container.api.name
}

output "network_name" {
  value = docker_network.app.name
}

output "second_api_url" {
  description = "URL of the second FastAPI instance"
  value       = "http://127.0.0.1:${var.second_host_port}"
}
