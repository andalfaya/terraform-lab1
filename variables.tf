# Nombre del contenedor
variable "container_name" {
  description = "Nombre del contenedor web"
  type        = string
  default     = "web_server"
}

# Puerto externo del contenedor
variable "external_port" {
  description = "Puerto externo para exponer Nginx"
  type        = number
  default     = 8080
}