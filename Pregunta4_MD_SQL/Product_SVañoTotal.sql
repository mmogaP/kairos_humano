SELECT 
    p.nombre_producto,
    p.marca,
    COALESCE(SUM(ve.unidades_vendidas * p.precio_unitario), 0) AS total_venta
FROM 
    producto p
    LEFT JOIN venta ve ON p.id_producto = ve.id_producto 
        AND YEAR(ve.fecha_venta) = YEAR(CURRENT_DATE()) - 1
WHERE 
    p.id_producto NOT IN (
        SELECT DISTINCT id_producto 
        FROM venta 
        WHERE YEAR(fecha_venta) = YEAR(CURRENT_DATE())
    )
GROUP BY 
    p.nombre_producto, p.marca
ORDER BY 
    total_venta DESC, p.marca, p.nombre_producto;