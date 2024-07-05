SELECT 
    s.nombre_sucursal,
    v.nombre_vendedor,
    p.marca,
    p.nombre_producto,
    ve.fecha_venta,
    ve.unidades_vendidas,
    p.precio_unitario,
    (ve.unidades_vendidas * p.precio_unitario) AS valor_venta
FROM 
    venta ve
    JOIN sucursal s ON ve.id_sucursal = s.id_sucursal
    JOIN vendedor v ON ve.id_vendedor = v.id_vendedor
    JOIN producto p ON ve.id_producto = p.id_producto
WHERE 
    EXTRACT(YEAR_MONTH FROM ve.fecha_venta) = EXTRACT(YEAR_MONTH FROM CURRENT_DATE())
ORDER BY 
    s.nombre_sucursal, v.nombre_vendedor, p.marca, p.nombre_producto;