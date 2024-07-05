# Integración de JSONPlaceholder API con PostgreSQL

Este proyecto implementa una solución para extraer datos de la JSONPlaceholder API y cargarlos en una base de datos PostgreSQL utilizando Python y Docker. La solución está diseñada para actualizarse diariamente y seguir un esquema de base de datos estrella.

## Estructura del Proyecto

project/
│
├── docker-compose.yml
├── init.sql
├── Dockerfile
├── data_integration.py
├── requirements.txt
└── README.md

## Pasos de Implementación

### 1. Diseño de la Función Python

Se creó una función `extract_and_load_data()` en `data_integration.py` que realiza las siguientes tareas:

- Conecta con la base de datos PostgreSQL.
- Extrae datos de usuarios y publicaciones de JSONPlaceholder API.
- Inserta o actualiza los datos en las tablas correspondientes.
- Maneja errores y registra actividades en un archivo de log.

### 2. Configuración de Docker

#### 2.1 Dockerfile

Se creó un `Dockerfile` para el contenedor de Python:

```
dockerfile
FROM python:3.9
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY data_integration.py .
CMD ["python", "data_integration.py"]
```

#### 2.2 docker-compose.yml

Se configuró un archivo docker-compose.yml para orquestar los contenedores

### 3. Configuración de la Base de Datos

Se creó un archivo init.sql para inicializar la estructura de la base de datos

### 4. Requisitos de Python

Se creó un archivo requirements.txt con las dependencias necesarias

### 5. Ejecución

Para ejecutar el proyecto:

Asegúrate de tener Docker y Docker Compose instalados.
Navega al directorio del proyecto.
Ejecuta el siguiente comando:

```
docker-compose up -d
```

### 6. Actualización Diaria

Para la actualización diaria, se recomienda utilizar un servicio de programación de tareas en la nube:

Para AWS: Configura una función Lambda y un evento CloudWatch para ejecutar diariamente.
Para Google Cloud: Utiliza Cloud Functions con Cloud Scheduler.

### 7. Ejemplo de Función Lambda

´´´
import boto3
import json

def lambda_handler(event, context): # Aquí llamarías a tu función extract_and_load_data()
extract_and_load_data()

    return {
        'statusCode': 200,
        'body': json.dumps('Extracción y carga de datos completada')
    }

´´´

Notas Adicionales

La solución utiliza un esquema de base de datos estrella con una tabla de dimensiones (dim_users) y una tabla de hechos (fact_posts).
Se implementaron mecanismos de logging para rastrear la ejecución y posibles errores.
La solución maneja conflictos de inserción utilizando la cláusula ON CONFLICT para actualizar registros existentes.
