SELECT 
    s.nombre_sucursal,
    v.nombre_vendedor,
    p.marca,
    COALESCE(SUM(ve.unidades_vendidas * p.precio_unitario), 0) AS total_venta
FROM 
    sucursal s
    CROSS JOIN vendedor v
    CROSS JOIN (SELECT DISTINCT marca FROM producto) p
    LEFT JOIN venta ve ON s.id_sucursal = ve.id_sucursal 
        AND v.id_vendedor = ve.id_vendedor 
        AND ve.id_producto = producto.id_producto
GROUP BY 
    s.nombre_sucursal, v.nombre_vendedor, p.marca
ORDER BY 
    s.nombre_sucursal, v.nombre_vendedor, p.marca;