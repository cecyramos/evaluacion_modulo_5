-- CREACION DE TABLAS --

/* NORMALIZACION:
He aplicado principios de normalización en mi modelo de datos, separando la información en 
tablas lógicas como producto, proveedor y transaccion. Esto se logra utilizando claves foráneas 
(id_producto, id_proveedor) en la tabla transaccion para relacionarla con las tablas de producto 
y proveedor, lo que reduce drásticamente la redundancia de datos, asegura la integridad de la 
información y facilita las actualizaciones y el mantenimiento general de la base de datos. */
CREATE TABLE producto(
    id_producto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    precio INT NOT NULL CHECK (precio>=0), -- agregué restricciones para que los valores no puedan ser negativos --
    cantidad INT NOT NULL CHECK (cantidad>=0)
 ) ENGINE=InnoDB;

CREATE TABLE proveedor(
    id_proveedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_proveedor VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono INT NOT NULL,
    email VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE transaccion(
    id_transaccion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad>0), -- agregué esta restriccion para que la cantidad sea mayor a 0 ya que no tiene sentido comprar o vender 0 productos--
    id_producto INT,
    id_proveedor INT,
    CONSTRAINT fk_producto
        FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
        ON DELETE CASCADE -- Si se elimina el producto, se elimina la transacción --
        ON UPDATE CASCADE,
    CONSTRAINT fk_proveedor
        FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;