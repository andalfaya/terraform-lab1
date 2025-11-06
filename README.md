# terraform-lab1
Lab 6 : Primeros pasos con Terraform (IaC local con Docker) 

# 🧭 Uso de Workspaces en Terraform

Este proyecto utiliza **workspaces** para gestionar distintos entornos de despliegue:

- 🧑‍💻 `dev` → entorno de desarrollo  
- 🧪 `srg` → entorno de staging o preproducción  
- 🚀 `prod` → entorno de producción  

Cada workspace mantiene su propio **estado independiente**, ubicado en `terraform.tfstate.d/<workspace>/`.

---

## ⚙️ 1. Inicialización

Antes de comenzar, inicializa Terraform en el proyecto:

```bash
terraform init

## 🧩 2. Creación de Workspaces

Los **workspaces** permiten tener múltiples entornos aislados dentro del mismo proyecto de Terraform.  
Cada workspace mantiene su propio **estado de infraestructura**, evitando conflictos entre entornos como desarrollo, pruebas y producción.

Por ejemplo, puedes desplegar los mismos contenedores o recursos Docker en tres entornos distintos (`dev`, `srg`, `prod`), sin que se afecten entre sí.

---

### 🛠️ Crear los Workspaces

Crea los tres entornos principales (solo es necesario hacerlo una vez):

```bash
terraform workspace new dev
terraform workspace new srg
terraform workspace new prod
```

## 🔍 3. Listar Workspaces Existentes

Terraform permite listar fácilmente todos los **workspaces** creados en el proyecto.  
Esto es útil para verificar en qué entorno estás trabajando antes de ejecutar comandos como `plan` o `apply`.

---

### 📋 Mostrar todos los Workspaces

Ejecuta el siguiente comando:

```bash
terraform workspace list
```
### Ejemplo de salida:
``` bash
  default
* dev
  srg
  prod
```

El asterisco (*) indica el workspace activo.

## 🔁 4. Seleccionar un workspace

Para cambiar entre entornos (por ejemplo, de `dev` a `srg` o `prod`), usa el siguiente comando:

```bash
terraform workspace select <nombre_workspace>
```
Puedes verificar el cambio con:

```bash
terraform workspace show
```

## 🧮 5. Planificar cambios

Genera el plan de ejecución para el entorno actual (cargando su archivo de variables):

```bash
terraform plan -var-file="$(terraform workspace show).tfvars"
```

### Ejemplo:
Si estás en srg, Terraform usará automáticamente srg.tfvars.

## 🚀 6. Aplicar cambios

Ejecuta los cambios en el entorno activo:

```bash
terraform apply -var-file="$(terraform workspace show).tfvars"
```

También puedes aplicar directamente sin confirmación:

```bash
terraform apply -auto-approve -var-file="$(terraform workspace show).tfvars"
```

## 🧹 7. Eliminar un workspace

### ⚠️ No puedes eliminar el workspace activo.
Primero cambia a otro (por ejemplo default).

```bash
terraform workspace select default
terraform workspace delete dev
```

Repite para srg o prod si lo necesitas:

```bash
terraform workspace delete srg
terraform workspace delete prod
```
