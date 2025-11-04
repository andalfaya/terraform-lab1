# Nombre del contenedor web
output "web_container_name" {
  description = "Nombre del contenedor web creado"
  value       = docker_container.web.name
}

# Puerto externo del contenedor web
output "web_container_port" {
  description = "Puerto externo del contenedor web"
  value       = docker_container.web.ports[0].external
}

# Dirección IP interna del contenedor web (a través de network_data)
output "web_container_ip" {
  description = "Dirección IP interna del contenedor web"
  value       = docker_container.web.network_data[0].ip_address
}

# Nombre del contenedor Redis
output "redis_container_name" {
  description = "Nombre del contenedor Redis"
  value       = docker_container.redis.name
}

# Dirección IP interna del contenedor Redis (a través de network_data)
output "redis_container_ip" {
  description = "Dirección IP interna del contenedor Redis"
  value       = docker_container.redis.network_data[0].ip_address
}
