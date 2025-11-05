# ========================
# Web
# ========================
output "web_names" {
  description = "Nombre del contenedor web"
  value       = [for c in docker_container.web : c.name]
}

output "web_ports" {
  description = "Puerto externo del contenedor web"
  value       = [for c in docker_container.web : c.ports[0].external]
}

output "web_ips" {
  description = "Dirección IP interna del contenedor web"
  value       = [for c in docker_container.web : c.network_data[0].ip_address]
}

# ========================
# Redis
# ========================
output "redis_names" {
  description = "Nombre del contenedor Redis"
  value       = [for c in docker_container.redis : c.name]
}

output "redis_ports" {
  description = "Puerto externo del contenedor Redis"
  value       = [for c in docker_container.redis : c.ports[0].external]
}

output "redis_ips" {
  description = "Dirección IP interna del contenedor Redis"
  value       = [for c in docker_container.redis : c.network_data[0].ip_address]
}

# ========================
# MySQL
# ========================
output "mysql_names" {
  description = "Nombre del contenedor MySQL"
  value       = [for c in docker_container.mysql : c.name]
}

output "mysql_ports" {
  description = "Puerto externo del contenedor MySQL"
  value       = [for c in docker_container.mysql : c.ports[0].external]
}

output "mysql_ips" {
  description = "Dirección IP interna del contenedor MySQL"
  value       = [for c in docker_container.mysql : c.network_data[0].ip_address]
}
