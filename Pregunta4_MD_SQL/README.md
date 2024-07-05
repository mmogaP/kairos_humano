# Consultas SQL para Análisis de Ventas

Este documento contiene consultas SQL diseñadas para analizar datos de ventas en una base de datos que incluye información sobre sucursales, vendedores, productos y ventas.

## Estructura de la Base de Datos

La base de datos consta de las siguientes tablas:

1. `sucursal` (id_sucursal, nombre_sucursal, ciudad, pais, jefe_sucursal)
2. `venta` (id_venta, id_vendedor, id_sucursal, id_producto, unidades_vendidas, fecha_venta)
3. `vendedor` (id_vendedor, nombre_vendedor, telefono_vendedor)
4. `producto` (id_producto, nombre_producto, categoria_producto, marca, precio_unitario)

## Consultas

### 1. Ventas del Mes Actual

Esta consulta proporciona un listado detallado de las ventas realizadas en el mes actual, incluyendo información de la sucursal, vendedor, producto y detalles de la venta.

### 2. Ventas Totales por Sucursal, Vendedor y Marca

Muestra las ventas totales agrupadas por sucursal, vendedor y marca de producto. Incluye a todos los vendedores, incluso aquellos que no han realizado ventas.

### 3. Productos con Más de 1000 Unidades Vendidas en los Últimos 2 Meses

Identifica los productos que han tenido un alto volumen de ventas (más de 1000 unidades) en los últimos dos meses.

### 4. Productos sin Ventas en el Año Actual

Lista los productos que no han tenido ventas en el año en curso.

### 5. Ventas del Año Anterior para Productos sin Ventas en el Año Actual

Para los productos que no han tenido ventas en el año actual, esta consulta muestra el monto total de ventas del año anterior.
