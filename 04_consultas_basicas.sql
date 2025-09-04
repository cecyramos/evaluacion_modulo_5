-- CONSULTAS BASICAS --

-- 1° Recupera todos los productos disponibles en el inventario. --
SELECT * 
FROM producto;

-- 2° Recupera todos los proveedores que suministran productos específicos. --

-- Opcion 1: muestra todos los proveedores de la tabla proveedores--
SELECT * 
FROM proveedor;

-- Opcion 2: muestra el listado de proveedores y productos que se han comprado de esos proveedores de acuerdo a la tabla transaccion--
SELECT id_proveedor, id_producto, tipo
FROM transaccion
WHERE tipo = 'Compra';

-- 3° Consulta las transacciones realizadas en una fecha específica. --
SELECT *
FROM transaccion
WHERE fecha = '2025-08-26';

-- 4° Realiza consultas de selección con funciones de agrupación, como COUNT() y SUM(), para calcular el número total de productos vendidos o el valor total de las compras. --

-- 4A. Total de productos vendidos --
-- Opcion 1: Contando el numero de ventas totales --
SELECT SUM(cantidad) AS total_productos_vendidos
FROM transaccion
WHERE tipo = 'Venta';

-- Opcion 2: Agrupando el numero de ventas por dia --
SELECT fecha, SUM(cantidad) AS total_productos_vendidos
FROM transaccion
WHERE tipo = 'Venta' GROUP BY fecha;

-- Opcion 3: Agrupando el numero de ventas por producto --
SELECT id_producto, SUM(cantidad) AS total_productos_vendidos
FROM transaccion
WHERE tipo = 'Venta' GROUP BY id_producto;

-- 4B. Valor total de las compras --
-- Opcion 1: Sumando el total de las compras --
SELECT SUM(p.precio * t.cantidad) AS total_compras
FROM transaccion t
JOIN producto p ON t.id_producto = p.id_producto
WHERE t.tipo = 'Venta'; 
-- NOTA: Estoy filtrando por tipo = 'Venta' considerando que los precios de la tabla producto se refieren a los precios al publico --
-- Son las "compras" que el publico realiza --

-- Opcion 2: Agrupando el total de las compras por dia --
SELECT t.fecha, SUM(p.precio * t.cantidad) AS total_compras
FROM transaccion t
JOIN producto p ON t.id_producto = p.id_producto
WHERE t.tipo = 'Venta'
GROUP BY fecha;