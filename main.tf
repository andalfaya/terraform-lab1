terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# ========================
# IMÁGENES
# ========================
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_image" "redis" {
  name = "redis:latest"
}

resource "docker_image" "mysql" {
  name = "mysql:latest"
}

# ========================
# CONTENEDORES
# ========================

# Contenedor web (Nginx)
resource "docker_container" "web" {
  count = var.web_count
  name  = "${var.web_name}-${count.index + 1}"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    # external = var.web_count == 1 ? var.web_port:0
    external = var.web_port + count.index
  }

  restart        = "no"
  remove_volumes = true
}

# Contenedor Redis
resource "docker_container" "redis" {
  count = var.redis_count
  name  = "${var.redis_name}-${count.index + 1}"
  image = docker_image.redis.image_id

  ports {
    internal = 6379
    # external = var.redis_count == 1 ? var.redis_port:0
    external = var.redis_port + count.index
  }

  dynamic "volumes" {
    for_each = var.redis_volume != "" ? [var.redis_volume] : []
    content {
      host_path      = volumes.value
      container_path = "/data"
    }
  }

  depends_on     = [docker_container.web]
  restart        = "no"
  remove_volumes = true
}

# Contenedor MySQL
resource "docker_container" "mysql" {
  count = var.mysql_count
  name  = "${var.mysql_name}-${count.index + 1}"
  image = docker_image.mysql.image_id

  ports {
    internal = 3306
    # external = var.mysql_count == 1 ? var.mysql_port:0
    external = var.mysql_port + count.index
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
    "MYSQL_DATABASE=${var.mysql_database}",
    "MYSQL_USER=${var.mysql_user}",
    "MYSQL_PASSWORD=${var.mysql_password}"
  ]

  dynamic "volumes" {
    for_each = var.mysql_volume != "" ? [var.mysql_volume] : []
    content {
      host_path      = volumes.value
      container_path = "/var/lib/mysql"
    }
  }

  depends_on     = [docker_container.web]
  restart        = "no"
  remove_volumes = true
}
