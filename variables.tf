# ========================
# Contenedor web
# ========================
variable "web_name" {
  description = "Nombre del contenedor web"
  type        = string
  default     = "web_server"
}

variable "web_port" {
  description = "Puerto externo para exponer Nginx"
  type        = number
  default     = 8080
}

variable "web_count" {
  description = "Número de contenedores web a desplegar"
  type        = number
  default     = 4
}

# ========================
# Contenedor Redis
# ========================
variable "redis_name" {
  description = "Nombre del contenedor Redis"
  type        = string
  default     = "redis_server"
}

variable "redis_port" {
  description = "Puerto externo de Redis"
  type        = number
  default     = 6379
}

variable "redis_volume" {
  description = "Ruta de volumen host para Redis, vacía si efímero"
  type        = string
  default     = ""
}

variable "redis_count" {
  description = "Número de contenedores Redis a desplegar"
  type        = number
  default     = 3
}

# ========================
# Contenedor MySQL
# ========================
variable "mysql_name" {
  description = "Nombre del contenedor MySQL"
  type        = string
  default     = "mysql_server"
}

variable "mysql_port" {
  description = "Puerto externo de MySQL"
  type        = number
  default     = 3306
}

variable "mysql_root_password" {
  description = "Contraseña root de MySQL"
  type        = string
  default     = "rootpass"
}

variable "mysql_database" {
  description = "Base de datos inicial de MySQL"
  type        = string
  default     = "demo"
}

variable "mysql_user" {
  description = "Usuario de MySQL"
  type        = string
  default     = "demo_user"
}

variable "mysql_password" {
  description = "Contraseña del usuario MySQL"
  type        = string
  default     = "demo_pass"
}

variable "mysql_volume" {
  description = "Ruta de volumen host para MySQL, vacía si efímero"
  type        = string
  default     = ""
}

variable "mysql_count" {
  description = "Número de contenedores MySQL a desplegar"
  type        = number
  default     = 2
}
