resource "docker_image" "api" {
  name         = var.image_name
  keep_locally = true
}

resource "docker_network" "app" {
  name   = "${var.project_name}-network"
  driver = "bridge"
}

resource "docker_container" "api" {
  name  = "${var.project_name}-api"
  image = docker_image.api.image_id

  networks_advanced {
    name = docker_network.app.name
  }

  ports {
    internal = var.container_port
    external = var.host_port
    ip       = "127.0.0.1"
  }
}

resource "docker_container" "api_second" {
  name  = "${var.project_name}-api-second"
  image = docker_image.api.image_id

  networks_advanced {
    name = docker_network.app.name
  }

  ports {
    internal = var.container_port
    external = var.second_host_port
    ip       = "127.0.0.1"
  }
}
