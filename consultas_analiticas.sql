-- Creación de la tabla Categoria
CREATE TABLE categorias (
    id INTEGER PRIMARY KEY,
    nombre TEXT
);

-- Creación de la tabla Producto
CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    marca TEXT,
    categoria_id INTEGER,
    precio_unitario REAL,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

-- Creación de la tabla Sucursal
CREATE TABLE Sucursales (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    direccion TEXT
);

-- Creación de la tabla Stock
CREATE TABLE Stock (
    id INTEGER PRIMARY KEY,
    sucursal_id INTEGER NOT NULL,
    producto_id INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    UNIQUE(sucursal_id, producto_id),
    FOREIGN KEY (sucursal_id) REFERENCES Sucursal(id),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);

-- Creación de la tabla Cliente
CREATE TABLE Clientes (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    telefono TEXT
);

-- Creación de la tabla Orden
CREATE TABLE Orden (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    sucursal_id INTEGER,
    fecha TEXT,
    total REAL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (sucursal_id) REFERENCES Sucursal(id)
);

-- Creación de la tabla Item
CREATE TABLE Item (
    id INTEGER PRIMARY KEY,
    orden_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER,
    monto_venta REAL,
    FOREIGN KEY (orden_id) REFERENCES Orden(id),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);

INSERT INTO categorias (id, nombre)
VALUES
    (1, 'Electrónicos'),
    (2, 'Ropa'),
    (3, 'Hogar'),
    (4, 'Deportes'),
    (5, 'Juguetes');

-- Insertar datos en la tabla Productos
INSERT INTO productos (id, nombre, marca, categoria_id, precio_unitario) VALUES
    (1, 'Televisor', 'Sony', 1, 1000),
    (2, 'Laptop', 'HP', 1, 800),
    (3, 'Camisa', 'Zara', 2, 50),
    (4, 'Pantalón', 'Levi''s', 2, 70),
    (5, 'Sartén', 'T-fal', 3, 30),
    (6, 'Toalla', 'Cannon', 3, 20),
    (7, 'Pelota', 'Nike', 4, 15),
    (8, 'Raqueta', 'Wilson', 4, 50),
    (9, 'Muñeca', 'Barbie', 5, 25),
    (10, 'Carro', 'Hot Wheels', 5, 10);

-- Insertar datos en la tabla Sucursales
INSERT INTO Sucursales (id, nombre, direccion) VALUES
    (1, 'Sucursal A', 'Calle 1'),
    (2, 'Sucursal B', 'Calle 2'),
    (3, 'Sucursal C', 'Calle 3');

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (id, nombre, telefono) VALUES
    (1, 'Juan', '1234567890'),
    (2, 'María', '0987654321'),
    (3, 'Pedro', '5555555555');

-- Insertar datos en la tabla Órdenes
INSERT INTO Orden (id, cliente_id, sucursal_id, fecha, total) VALUES
    (1, 1, 3, '2023-06-12', 575),
    (2, 2, 1, '2023-06-12', 705),
    (3, 3, 3, '2023-06-12', 9000),
    (4, 2, 3, '2023-06-12', 10400),
    (5, 3, 3, '2023-06-12', 85),
    (6, 1, 1, '2023-06-12', 830),
    (7, 1, 1, '2023-06-12', 490),
    (8, 3, 3, '2023-06-12', 16100),
    (9, 3, 2, '2023-06-12', 680),
    (10, 2, 1, '2023-06-12', 7525),
    (11, 2, 3, '2023-06-12', 725),
    (12, 3, 1, '2023-06-12', 11430),
    (13, 3, 3, '2023-06-12', 4900),
    (14, 3, 3, '2023-06-12', 5490),
    (15, 1, 1, '2023-06-12', 420);

-- Insertar datos en la tabla Items
INSERT INTO Item (id, orden_id, producto_id, cantidad, monto_venta) VALUES
    (1, 1, 9, 7, 175),
    (2, 1, 8, 8, 400),
    (6, 2, 9, 3, 75),
    (7, 2, 5, 9, 270),
    (8, 2, 5, 10, 300),
    (9, 2, 6, 3, 60),
    (11, 3, 1, 9, 9000),
    (16, 4, 1, 4, 4000),
    (17, 4, 2, 8, 6400),
    (21, 5, 6, 2, 40),
    (22, 5, 7, 3, 45),
    (26, 6, 4, 9, 630),
    (27, 6, 9, 4, 100),
    (28, 6, 3, 2, 100),
    (31, 7, 5, 8, 240),
    (32, 7, 9, 6, 150),
    (33, 7, 8, 2, 100),
    (36, 8, 1, 6, 6000),
    (37, 8, 1, 10, 10000),
    (38, 8, 3, 2, 100),
    (41, 9, 8, 9, 450),
    (42, 9, 3, 3, 150),
    (43, 9, 7, 2, 30),
    (44, 9, 10, 5, 50),
    (46, 10, 9, 9, 225),
    (47, 10, 1, 7, 7000),
    (48, 10, 3, 6, 300),
    (51, 11, 7, 5, 75),
    (52, 11, 9, 8, 200),
    (53, 11, 3, 9, 450),
    (56, 12, 2, 7, 5600),
    (57, 12, 1, 5, 5000),
    (58, 12, 6, 9, 180),
    (59, 12, 8, 9, 450),
    (60, 12, 8, 4, 200),
    (61, 13, 9, 4, 100),
    (62, 13, 2, 6, 4800),
    (66, 14, 1, 5, 5000),
    (67, 14, 4, 7, 490),
    (71, 15, 9, 6, 150),
    (72, 15, 5, 9, 270);

-- Insertar datos en la tabla Stocks
INSERT INTO Stocks (Id, Sucursal_Id, Producto_Id, Cantidad) VALUES
    (1, 1, 1, 65),
    (2, 1, 2, 71),
    (3, 1, 3, 8),
    (4, 1, 4, 42),
    (5, 1, 5, 61),
    (6, 1, 6, 14),
    (7, 1, 7, 70),
    (8, 1, 8, 66),
    (9, 1, 9, 13),
    (10, 1, 10, 68),
    (11, 2, 1, 14),
    (12, 2, 2, 67),
    (13, 2, 3, 74),
    (14, 2, 4, 32),
    (15, 2, 5, 75),
    (16, 2

SELECT 
    MIN(precio_unitario) AS precio_minimo,
    MAX(precio_unitario) AS precio_maximo,
    AVG(precio_unitario) AS precio_promedio
FROM Productos;

SELECT 
    Sucursal_Id,
    SUM(Cantidad) AS cantidad_total_en_stock
FROM Stocks
GROUP BY Sucursal_Id;

SELECT 
    i.orden_id,
    o.cliente_id,
    SUM(i.monto_venta) AS total_ventas_por_cliente
FROM Órdenes o
JOIN Items i ON o.id = i.orden_id
GROUP BY i.orden_id, o.cliente_id;


