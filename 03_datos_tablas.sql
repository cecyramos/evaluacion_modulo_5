-- INSERCION DE DATOS --

INSERT INTO producto (nombre_producto, descripcion, precio, cantidad) VALUES
('Torta Milhoja', 'Torta de milhoja para 25 personas', 25000, 5),
('Torta de Chocolate', 'Torta de chocolate para 40 personas', 40000, 2),
('Pie de Limón', 'Pie de limón para 10 personas', 15000, 10),
('Torta Amor', 'Torta amor para 25 personas', 25000, 5),
('Torta Helada Vainilla', 'Torta helada de vainilla para 25 personas', 40000, 5);

INSERT INTO proveedor (nombre_proveedor, direccion, telefono, email) VALUES
('Amasanderia Carlitos', 'Los Olmos 123', 923456789, 'pedidos@carlitos.com'),
('Pasteleria Amapola', 'Av. Prat 456', 987654321, 'pedidos@pasteleriaamapola.com'),
('Heladeria Pepito', 'Las Dalias 789', 955765555, 'tortas@heladeriapepito.com');

INSERT INTO transaccion (tipo, fecha, cantidad, id_producto, id_proveedor) VALUES
('Venta', '2025-08-26', 1, 3, 1),
('Venta', '2025-08-26', 1, 1, 2),
('Venta', '2025-08-26', 1, 5, 3),
('Venta', '2025-08-26', 1, 3, 1),
('Venta', '2025-08-26', 1, 5, 3),
('Compra', '2025-08-27', 5, 3, 1),
('Compra', '2025-08-27', 5, 2, 2),
('Venta', '2025-08-27', 1, 5, 3),
('Compra', '2025-08-27', 5, 3, 1),
('Venta', '2025-08-27', 1, 5, 3),
('Compra', '2025-08-28', 5, 3, 1),
('Compra', '2025-08-28', 5, 2, 2),
('Venta', '2025-08-28', 1, 3, 3),
('Compra', '2025-08-28', 5, 3, 1),
('Venta', '2025-08-28', 1, 5, 3),
('Venta', '2025-08-29', 1, 3, 1),
('Venta', '2025-08-29', 1, 4, 2),
('Venta', '2025-08-29', 1, 5, 3),
('Venta', '2025-08-29', 1, 3, 1),
('Venta', '2025-08-29', 1, 5, 3),
('Venta', '2025-08-30', 1, 3, 1),
('Compra', '2025-08-30', 5, 2, 2),
('Venta', '2025-08-30', 1, 5, 3),
('Compra', '2025-08-30', 5, 3, 1),
('Venta', '2025-08-30', 1, 5, 3),
('Venta', '2025-08-31', 1, 3, 1),
('Compra', '2025-08-31', 5, 2, 2),
('Venta', '2025-08-31', 1, 5, 3),
('Compra', '2025-09-01', 5, 3, 1),
('Venta', '2025-09-01', 1, 5, 3),
('Compra', '2025-09-01', 5, 3, 1)
;