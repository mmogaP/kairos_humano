SELECT 
    p.nombre_producto,
    p.marca,
    SUM(ve.unidades_vendidas) AS unidades_vendidas
FROM 
    venta ve
    JOIN producto p ON ve.id_producto = p.id_producto
WHERE 
    ve.fecha_venta >= DATE_SUB(CURRENT_DATE(), INTERVAL 2 MONTH)
GROUP BY 
    p.nombre_producto, p.marca
HAVING 
    SUM(ve.unidades_vendidas) > 1000
ORDER BY 
    unidades_vendidas DESC;