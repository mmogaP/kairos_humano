-- 1. Seleccionar el título y el nombre del autor de todos los libros de la categoría "Ficción"
SELECT l.titulo, a.nombre AS autor
FROM Libros l
JOIN Autores a ON l.autor_id = a.id_autor
JOIN Categorias c ON l.categoria_id = c.id_categoria
WHERE c.nombre = 'Ficción';

-- 2. Calcular el precio promedio de todos los libros en la tabla Libros
SELECT AVG(precio) AS precio_promedio
FROM Libros;

-- 3. Actualizar el precio de todos los libros escritos por el autor con id_autor = 5 con un 10% de descuento
UPDATE Libros
SET precio = precio * 0.9
WHERE autor_id = 5;

-- Verificar el cambio
SELECT titulo, precio
FROM Libros
WHERE autor_id = 5;