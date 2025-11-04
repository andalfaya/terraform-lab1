terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Crear una imagen de Nginx
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Crear un contenedor a partir de la imagen
resource "docker_container" "web" {
  name  = var.container_name
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.external_port
  }
}

# Crear una imagen de Redis (segundo contenedor)
resource "docker_image" "redis" {
  name = "redis:latest"
}

# Crear un contenedor Redis dependiente del web (opcional)
resource "docker_container" "redis" {
  name  = "redis_server"
  image = docker_image.redis.image_id

  # Redis no necesita puertos externos, pero puedes exponerlo si deseas
  ports {
    internal = 6379
    external = 6379
  }

  # Asegura que se cree después de web (opcional)
  depends_on = [docker_container.web]
}
