# Ejemplo de Consultas SQL para una Base de Datos de Libros

Este proyecto demuestra el uso de SQL para crear y manipular una base de datos simple de libros, autores y categorías.

## Estructura de la Base de Datos

La base de datos consta de tres tablas principales:

1. **Libros**

   - id_libro (PK)
   - titulo
   - autor_id (FK a Autores.id_autor)
   - categoria_id (FK a Categorias.id_categoria)
   - precio

2. **Autores**

   - id_autor (PK)
   - nombre
   - nacionalidad

3. **Categorias**
   - id_categoria (PK)
   - nombre

Usa una herramienta en línea como [SQL Online IDE](https://sqliteonline.com/):

1. Ve a https://sqliteonline.com/
2. Copia y pega el contenido de `Tables.sql` en el editor.
3. Ejecuta el script para crear la base de datos.
4. Ejecuta cada consulta individualmente para ver los resultados.

## Consultas SQL Detalladas

Las consultas SQL se encuentran en el archivo `Request.sql`. Incluyen:

1. Selección de libros de ficción con sus autores.
2. Cálculo del precio promedio de los libros.
3. Actualización de precios con un descuento.

Cada consulta está comentada para explicar su funcionamiento.
