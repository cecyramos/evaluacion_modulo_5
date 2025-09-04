-- CONSULTAS COMPLEJAS --

-- 1° Realiza una consulta que recupere el total de ventas de un producto durante el mes anterior. --
SELECT SUM(p.precio * t.cantidad) AS total_ventas
FROM transaccion t
JOIN producto p ON t.id_producto = p.id_producto
WHERE t.tipo = 'Venta' AND t.id_producto = 3 AND MONTH(t.fecha) = MONTH(NOW()) - 1 AND YEAR(t.fecha) = YEAR(NOW());
-- Nota: Similar a la consulta basica pero con restricciones adicionales --
-- El id_producto es 3 y el mes es el mes anterior al actual --

-- 2° Implementa una consulta con subconsultas (subqueries) para obtener productos que no se han vendido durante un período determinado. --
SELECT *
FROM producto
WHERE id_producto NOT IN (
    SELECT id_producto
    FROM transaccion
    WHERE tipo = 'Venta' AND fecha BETWEEN '2025-08-01' AND '2025-08-31'
);