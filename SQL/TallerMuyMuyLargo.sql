DROP DATABASE IF EXISTS tienda_camisetas;
CREATE DATABASE tienda_camisetas CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tienda_camisetas;

-- 1. Tabla Clasificación / Ligas
CREATE TABLE clasificaciones (
    id_clasificacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

-- 2. Tabla Formas de Pago
CREATE TABLE formas_pago (
    id_forma_pago INT AUTO_INCREMENT PRIMARY KEY,
    metodo VARCHAR(50) NOT NULL
);

-- 3. Tabla Vendedores (Vallenato + WWF)
CREATE TABLE vendedores (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    comision DECIMAL(4,2) NOT NULL
);

-- 4. Tabla Clientes (Reguetón)
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

-- 5. Tabla Productos (Camisetas)
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_clasificacion INT NOT NULL,
    talla ENUM('S', 'M', 'L', 'XL') NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (id_clasificacion) REFERENCES clasificaciones(id_clasificacion)
);

-- 6. Tabla Ventas
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME NOT NULL,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    id_forma_pago INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor),
    FOREIGN KEY (id_forma_pago) REFERENCES formas_pago(id_forma_pago)
);

-- 7. Tabla Detalle de Ventas
CREATE TABLE detalle_ventas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO clasificaciones (id_clasificacion, nombre, pais) VALUES
(1, 'Liga BetPlay Dimayor', 'Colombia'),
(2, 'LaLiga EA Sports', 'España'),
(3, 'Premier League', 'Inglaterra'),
(4, 'Bundesliga', 'Alemania'),
(5, 'Serie A', 'Italia'),
(6, 'J1 League', 'Japón');

INSERT INTO formas_pago (id_forma_pago, metodo) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta de Crédito'),
(3, 'Transferencia Bancaria'),
(4, 'Nequi / Daviplata');

INSERT INTO vendedores (id_vendedor, nombre_completo, telefono, comision) VALUES
(1, 'Diomedes "The Undertaker" Díaz', '3001112233', 0.05),
(2, 'Silvestre "Stone Cold" Dangond', '3002223344', 0.06),
(3, 'Rafael "Macho Man" Orozco', '3003334455', 0.05),
(4, 'Kaleth "The Rock" Morales', '3004445566', 0.07),
(5, 'Poncho "Hulk Hogan" Zuleta', '3005556677', 0.04),
(6, 'Jorge "Bret Hitman Hart" Oñate', '3006667788', 0.05),
(7, 'Peter "Shawn Michaels" Manjarrés', '3007778899', 0.06),
(8, 'Iván "Ultimate Warrior" Villazón', '3008889900', 0.04),
(9, 'Martín "Rey Mysterio" Elías', '3009990011', 0.06),
(10, 'Jean Carlos "Triple H" Centeno', '3000001122', 0.05);

INSERT INTO clientes (id_cliente, nombre_completo, ciudad, email) VALUES
(1, 'Benito "Bad Bunny" Martínez', 'Medellín', 'benito@sanbenito.com'),
(2, 'Carolina "Karol G" Giraldo', 'Medellín', 'karolg@bichota.com'),
(3, 'José "J Balvin" Osorio', 'Medellín', 'balvin@rayo.com'),
(4, 'William "Don Omar" Landrón', 'Bogotá', 'donomar@king.com'),
(5, 'Ramón "Daddy Yankee" Ayala', 'Barranquilla', 'yankee@legend.com'),
(6, 'Juan Luis "Maluma" Londoño', 'Cali', 'maluma@prettboy.com'),
(7, 'Emmanuel "Anuel AA" Gazmey', 'Barranquilla', 'anuel@rhlm.com'),
(8, 'Raúl "Rauw Alejandro" Ocasio', 'Santa Marta', 'rauw@saturno.com'),
(9, 'Austin "Arcángel" Santos', 'Bogotá', 'maravilla@flow.com'),
(10, 'Jesús "Farruko" Rosado', 'Santa Marta', 'farru@gangalee.com'),
(11, 'Nick "Nicky Jam" Rivera', 'Medellín', 'nicky@dimelo.com'),
(12, 'Gabriel "Ozuna" Soto', 'Cali', 'ozuna@negrito.com'),
(13, 'Michael "Myke Towers" Torres', 'Bucaramanga', 'myke@easy.com'),
(14, 'Carlos "Sech" Isaías', 'Bogotá', 'sech@blimp.com'),
(15, 'Salomón "Feid" Villada', 'Medellín', 'ferxxo@mor.com');

INSERT INTO productos (id_producto, nombre, id_clasificacion, talla, precio, stock) VALUES
-- Liga Colombiana (id_clasificacion = 1)
(1, 'Camiseta Millonarios Local 2024', 1, 'M', 280000, 25),
(2, 'Camiseta Millonarios Visitante 2024', 1, 'L', 270000, 18),
(3, 'Camiseta Junior FC Tiburón Clásica', 1, 'L', 260000, 30),
(4, 'Camiseta Junior FC Roja Alternativa', 1, 'M', 250000, 15),
(5, 'Camiseta Atlético Nacional Conmemorativa', 1, 'S', 290000, 20),
(6, 'Camiseta Atlético Nacional Verde Clásica', 1, 'XL', 280000, 12),
(7, 'Camiseta Unión Magdalena Retro 1968', 1, 'M', 210000, 15),
(8, 'Camiseta América de Cali Diablos Rojos', 1, 'L', 270000, 22),
(9, 'Camiseta Santa Fe Edición Campeón', 1, 'M', 260000, 14),

-- Liga Española (id_clasificacion = 2)
(10, 'Camiseta Real Madrid Local 2024', 2, 'M', 380000, 40),
(11, 'Camiseta Real Madrid Tercera Equipación', 2, 'L', 390000, 20),
(12, 'Camiseta FC Barcelona Senyera', 2, 'S', 370000, 25),
(13, 'Camiseta FC Barcelona Blaugrana Clásica', 2, 'M', 375000, 35),
(14, 'Camiseta Atlético de Madrid Rojiblanca', 2, 'XL', 340000, 18),
(15, 'Camiseta Real Betis Balompié Verde', 2, 'M', 310000, 10),

-- Premier League (id_clasificacion = 3)
(16, 'Camiseta Manchester City Celeste UCL', 3, 'L', 395000, 28),
(17, 'Camiseta Arsenal London Cannon Retro', 3, 'M', 360000, 22),
(18, 'Camiseta Liverpool FC Anfield Red', 3, 'S', 370000, 26),
(19, 'Camiseta Manchester United Devil Black', 3, 'XL', 350000, 16),
(20, 'Camiseta Chelsea FC Stamford Bridge', 3, 'M', 340000, 15),

-- Bundesliga (id_clasificacion = 4)
(21, 'Camiseta Bayern Múnich All-Red', 4, 'L', 360000, 30),
(22, 'Camiseta Borussia Dortmund Signal Iduna', 4, 'M', 350000, 24),
(23, 'Camiseta Bayer Leverkusen Campeón Invicto', 4, 'L', 380000, 18),
(24, 'Camiseta RB Leipzig Alternativa', 4, 'S', 310000, 12),

-- Serie A (id_clasificacion = 5)
(25, 'Camiseta Inter de Milán Nerazzurra', 5, 'M', 365000, 22),
(26, 'Camiseta AC Milan Clásica Rossonera', 5, 'L', 365000, 25),
(27, 'Camiseta Juventus Turin Zebra White', 5, 'XL', 350000, 19),
(28, 'Camiseta AS Roma Lupa Capitolina', 5, 'M', 345000, 14),
(29, 'Camiseta SSC Napoli Maradona Edition', 5, 'L', 390000, 17),

-- J1 League (id_clasificacion = 6)
(30, 'Camiseta Vissel Kobe Crimson Red', 6, 'M', 320000, 15),
(31, 'Camiseta Urawa Red Diamonds Home', 6, 'L', 330000, 16),
(32, 'Camiseta Yokohama F. Marinos Tricolor', 6, 'S', 325000, 14),
(33, 'Camiseta Gamba Osaka Black-Blue', 6, 'M', 315000, 10),
(34, 'Camiseta Kashima Antlers Zico Spirit', 6, 'XL', 330000, 11);

INSERT INTO ventas (id_venta, fecha, id_cliente, id_vendedor, id_forma_pago) VALUES
(1, '2026-01-05 10:15:00', 1, 1, 2),
(2, '2026-01-05 11:30:00', 2, 2, 4),
(3, '2026-01-06 09:45:00', 3, 3, 1),
(4, '2026-01-06 14:20:00', 4, 4, 3),
(5, '2026-01-07 16:00:00', 5, 5, 2),
(6, '2026-01-08 10:00:00', 6, 6, 4),
(7, '2026-01-08 12:15:00', 7, 7, 1),
(8, '2026-01-09 15:30:00', 8, 8, 3),
(9, '2026-01-10 11:00:00', 9, 9, 2),
(10, '2026-01-10 17:45:00', 10, 10, 4),
(11, '2026-01-11 13:10:00', 11, 1, 1),
(12, '2026-01-12 10:30:00', 12, 2, 2),
(13, '2026-01-13 16:20:00', 13, 3, 3),
(14, '2026-01-14 11:40:00', 14, 4, 4),
(15, '2026-01-15 15:00:00', 15, 5, 1),
(16, '2026-01-16 09:30:00', 1, 6, 2),
(17, '2026-01-16 14:15:00', 2, 7, 4),
(18, '2026-01-17 11:00:00', 3, 8, 1),
(19, '2026-01-18 16:45:00', 4, 9, 3),
(20, '2026-01-19 10:20:00', 5, 10, 2),
(21, '2026-01-20 12:00:00', 6, 1, 4),
(22, '2026-01-20 15:30:00', 7, 2, 1),
(23, '2026-01-21 09:50:00', 8, 3, 2),
(24, '2026-01-22 14:10:00', 9, 4, 3),
(25, '2026-01-23 11:25:00', 10, 5, 4),
(26, '2026-01-24 16:40:00', 11, 6, 1),
(27, '2026-01-25 10:15:00', 12, 7, 2),
(28, '2026-01-26 13:50:00', 13, 8, 4),
(29, '2026-01-27 15:10:00', 14, 9, 1),
(30, '2026-01-28 11:30:00', 15, 10, 3),
(31, '2026-01-29 09:20:00', 1, 2, 2),
(32, '2026-01-30 14:00:00', 2, 3, 4),
(33, '2026-01-31 16:30:00', 3, 4, 1),
(34, '2026-02-01 10:00:00', 4, 5, 3),
(35, '2026-02-02 12:40:00', 5, 6, 2),
(36, '2026-02-03 15:15:00', 6, 7, 4),
(37, '2026-02-04 11:10:00', 7, 8, 1),
(38, '2026-02-05 14:35:00', 8, 9, 2),
(39, '2026-02-06 17:00:00', 9, 10, 3),
(40, '2026-02-07 10:45:00', 10, 1, 4),
(41, '2026-02-08 13:20:00', 11, 2, 1),
(42, '2026-02-09 16:10:00', 12, 3, 2),
(43, '2026-02-10 09:30:00', 13, 4, 4),
(44, '2026-02-11 11:55:00', 14, 5, 1),
(45, '2026-02-12 15:40:00', 15, 6, 3),
(46, '2026-02-13 12:15:00', 1, 7, 2),
(47, '2026-02-14 17:50:00', 2, 8, 4),
(48, '2026-02-15 10:05:00', 3, 9, 1),
(49, '2026-02-16 14:25:00', 4, 10, 2),
(50, '2026-02-17 16:30:00', 5, 1, 3),
(51, '2026-02-18 11:20:00', 6, 2, 4),
(52, '2026-02-19 13:45:00', 7, 3, 1),
(53, '2026-02-20 15:10:00', 8, 4, 2),
(54, '2026-02-21 09:40:00', 9, 5, 4),
(55, '2026-02-22 12:30:00', 10, 6, 1),
(56, '2026-02-23 16:15:00', 11, 7, 3),
(57, '2026-02-24 10:50:00', 12, 8, 2),
(58, '2026-02-25 14:00:00', 13, 9, 4),
(59, '2026-02-26 17:20:00', 14, 10, 1),
(60, '2026-02-27 11:10:00', 15, 1, 2),
(61, '2026-02-28 15:05:00', 1, 3, 4),
(62, '2026-03-01 09:30:00', 2, 4, 1),
(63, '2026-03-02 12:15:00', 3, 5, 3),
(64, '2026-03-03 14:40:00', 4, 6, 2),
(65, '2026-03-04 16:55:00', 5, 7, 4),
(66, '2026-03-05 10:20:00', 6, 8, 1),
(67, '2026-03-06 13:45:00', 7, 9, 2),
(68, '2026-03-07 15:30:00', 8, 10, 3),
(69, '2026-03-08 11:00:00', 9, 1, 4),
(70, '2026-03-09 17:15:00', 10, 2, 1),
(71, '2026-03-10 10:40:00', 11, 3, 2),
(72, '2026-03-11 14:05:00', 12, 4, 4),
(73, '2026-03-12 16:20:00', 13, 5, 1),
(74, '2026-03-13 11:50:00', 14, 6, 3),
(75, '2026-03-14 15:10:00', 15, 7, 2),
(76, '2026-03-15 09:25:00', 1, 8, 4),
(77, '2026-03-16 12:35:00', 2, 9, 1),
(78, '2026-03-17 14:50:00', 3, 10, 2),
(79, '2026-03-18 16:15:00', 4, 1, 3),
(80, '2026-03-19 10:30:00', 5, 2, 4),
(81, '2026-03-20 13:00:00', 6, 3, 1),
(82, '2026-03-21 15:45:00', 7, 4, 2),
(83, '2026-03-22 11:15:00', 8, 5, 4),
(84, '2026-03-23 17:30:00', 9, 6, 1),
(85, '2026-03-24 10:10:00', 10, 7, 3),
(86, '2026-03-25 14:20:00', 11, 8, 2),
(87, '2026-03-26 16:40:00', 12, 9, 4),
(88, '2026-03-27 11:35:00', 13, 10, 1),
(89, '2026-03-28 15:00:00', 14, 1, 2),
(90, '2026-03-29 09:45:00', 15, 2, 4),
(91, '2026-03-30 12:50:00', 1, 4, 1),
(92, '2026-03-31 16:10:00', 2, 5, 3),
(93, '2026-04-01 10:25:00', 3, 6, 2),
(94, '2026-04-02 13:40:00', 4, 7, 4),
(95, '2026-04-03 15:20:00', 5, 8, 1),
(96, '2026-04-04 11:05:00', 6, 9, 2),
(97, '2026-04-05 17:00:00', 7, 10, 3),
(98, '2026-04-06 10:30:00', 8, 1, 4),
(99, '2026-04-07 14:15:00', 9, 2, 1),
(100, '2026-04-08 16:35:00', 10, 3, 2),
(101, '2026-04-09 11:45:00', 11, 4, 4),
(102, '2026-04-10 15:10:00', 12, 5, 1),
(103, '2026-04-11 09:50:00', 13, 6, 3),
(104, '2026-04-12 13:25:00', 14, 7, 2),
(105, '2026-04-13 16:40:00', 15, 8, 4);

-- Detalles de ventas vinculados a los productos y ventas anteriores
INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 280000), (1, 10, 1, 380000),
(2, 3, 1, 260000),
(3, 5, 3, 290000), (3, 7, 1, 210000),
(4, 16, 2, 395000),
(5, 21, 1, 360000), (5, 22, 1, 350000),
(6, 25, 2, 365000),
(7, 30, 1, 320000), (7, 31, 2, 330000),
(8, 2, 1, 270000),
(9, 12, 2, 370000),
(10, 18, 1, 370000), (10, 19, 1, 350000),
(11, 23, 2, 380000),
(12, 26, 1, 365000),
(13, 32, 2, 325000),
(14, 4, 3, 250000),
(15, 8, 1, 270000), (15, 9, 2, 260000),
(16, 11, 1, 390000),
(17, 13, 2, 375000),
(18, 17, 1, 360000),
(19, 20, 2, 340000),
(20, 24, 1, 310000),
(21, 27, 2, 350000),
(22, 28, 1, 345000), (22, 29, 1, 390000),
(23, 33, 3, 315000),
(24, 34, 1, 330000),
(25, 1, 1, 280000), (25, 3, 1, 260000),
(26, 6, 2, 280000),
(27, 10, 1, 380000),
(28, 14, 2, 340000),
(29, 15, 1, 310000),
(30, 16, 1, 395000), (30, 18, 1, 370000),
(31, 21, 2, 360000),
(32, 25, 1, 365000),
(33, 30, 2, 320000),
(34, 2, 1, 270000),
(35, 5, 2, 290000),
(36, 7, 3, 210000),
(37, 12, 1, 370000),
(38, 17, 2, 360000),
(39, 22, 1, 350000),
(40, 26, 2, 365000),
(41, 31, 1, 330000),
(42, 3, 2, 260000),
(43, 8, 1, 270000),
(44, 13, 2, 375000),
(45, 19, 1, 350000),
(46, 23, 1, 380000), (46, 24, 2, 310000),
(47, 28, 1, 345000),
(48, 32, 2, 325000),
(49, 1, 3, 280000),
(50, 4, 1, 250000),
(51, 9, 2, 260000),
(52, 10, 1, 380000), (52, 11, 1, 390000),
(53, 16, 2, 395000),
(54, 20, 1, 340000),
(55, 25, 2, 365000),
(56, 29, 1, 390000),
(57, 34, 2, 330000),
(58, 6, 1, 280000),
(59, 14, 2, 340000),
(60, 18, 1, 370000),
(61, 22, 2, 350000),
(62, 27, 1, 350000),
(63, 31, 2, 330000),
(64, 2, 1, 270000), (64, 5, 1, 290000),
(65, 7, 2, 210000),
(66, 12, 1, 370000),
(67, 15, 2, 310000),
(68, 19, 1, 350000),
(69, 23, 2, 380000),
(70, 26, 1, 365000),
(71, 30, 2, 320000),
(72, 33, 1, 315000),
(73, 1, 1, 280000),
(74, 8, 2, 270000),
(75, 10, 1, 380000),
(76, 13, 2, 375000),
(77, 17, 1, 360000),
(78, 21, 2, 360000),
(79, 25, 1, 365000),
(80, 28, 2, 345000),
(81, 32, 1, 325000),
(82, 3, 2, 260000),
(83, 9, 1, 260000),
(84, 11, 2, 390000),
(85, 16, 1, 395000),
(86, 22, 2, 350000),
(87, 24, 1, 310000),
(88, 27, 2, 350000),
(89, 29, 1, 390000),
(90, 34, 2, 330000),
(91, 4, 1, 250000),
(92, 7, 2, 210000),
(93, 10, 1, 380000),
(94, 14, 2, 340000),
(95, 18, 1, 370000),
(96, 23, 2, 380000),
(97, 26, 1, 365000),
(98, 30, 2, 320000),
(99, 33, 1, 315000),
(100, 2, 2, 270000),
(101, 5, 1, 290000),
(102, 12, 2, 370000),
(103, 17, 1, 360000),
(104, 21, 2, 360000),
(105, 31, 1, 330000);


/*1.Obtener el nombre del producto, su precio y el nombre de la liga (clasificación) a la que pertenece.*/

select 
p.nombre as nombre_producto,
p.precio,
c.nombre as nombre_liga
from productos p
inner join clasificaciones c on p.id_clasificacion = c.id_clasificacion;

/*2.Listar todas las ventas mostrando: id_venta, fecha y el nombre completo del cliente que compró.*/

select
v.id_venta,
v.fecha,
c.nombre_completo as nombre_cliente
from ventas v
inner join clientes c on v.id_cliente = c.id_cliente;

/*3.Mostrar el id_venta, fecha y el nombre completo del vendedor que atendió cada transacción.*/

select 
v.id_venta,
v.fecha,
vend.nombre_completo as nombre_vendedor
from ventas v
inner join vendedores vend on v.id_vendedor = vend.id_vendedor;

/*4.Listar las ventas con el método de pago utilizado (mostrar id_venta, fecha y metodo).*/

select 
v.id_venta,
v.fecha,
fp.metodo
from ventas v
inner join formas_pago fp on v.id_forma_pago = fp.id_forma_pago;

/*5.Mostrar el nombre de cada producto vendido junto con la cantidad y el precio unitario registrado en la tabla detalle_ventas.*/

select 
p.nombre as nombre_producto,
dv.cantidad,
dv.precio_unitario
from detalle_ventas dv
inner join productos p on dv.id_producto = p.id_producto;

/*6.Obtener una lista de camisetas de la liga de 'Colombia', mostrando nombre del producto, talla y nombre de la liga.*/

select 
p.nombre as nombre_producto,
p.talla,
c.nombre as nombre_liga
from productos p
inner join clasificaciones c on p.id_clasificacion = c.id_clasificacion
where c.pais = 'Colombia';

/*7.Consultar las ventas realizadas a clientes residentes en la ciudad de 'Medellín', mostrando fecha, nombre del cliente y ciudad.*/

select 
v.fecha,
c.nombre_completo as nombre_cliente,
c.ciudad
from ventas v
inner join clientes c on v.id_cliente = c.id_cliente
where c.ciudad = 'Medellín';

/*8.Listar las ventas atendidas por el vendedor 'Diomedes "The Undertaker" Díaz', mostrando el id_venta y la fecha.*/

select 
v.id_venta,
v.fecha
from ventas v
inner join vendedores vend on v.id_vendedor = vend.id_vendedor
where vend.nombre_completo = 'Diomedes "The Undertaker" Díaz';

/*9.Mostrar las ventas pagadas mediante 'Nequi / Daviplata', detallando el id_venta, fecha y el método.*/



/*10.Obtener el nombre del cliente, nombre del vendedor y la fecha para cada venta registrada.*/