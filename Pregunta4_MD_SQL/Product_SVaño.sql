SELECT 
    p.nombre_producto,
    p.marca
FROM 
    producto p
WHERE 
    p.id_producto NOT IN (
        SELECT DISTINCT id_producto 
        FROM venta 
        WHERE YEAR(fecha_venta) = YEAR(CURRENT_DATE())
    )
ORDER BY 
    p.marca, p.nombre_producto;