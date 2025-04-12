/* PRIMERA ENTREGA - Alejo Duarte
La siguiente Base de Datos busca como objetivo eficientizar el control de cobros y efectividad de sus colaboradores de cobranzas
de una financiera que brinda créditos a sus clientes,
Para esto se plantearon varias tablas relacionadas entre sí. Estas son:
- Tabla Clientes
- Tabla Créditos
- Tabla Empleados
- Tabla Cobros
- Tabla Gestiones_empleados
- Tabla Promesas_pago

SITUACION PROBLEMATICA
La entidad financiera Ya Crédito está teniendo un problema de registros con sus créditos cobrados y a cobrar.
Actualmente se utiliza un sistema de registro que no es eficiente. lo cual le está generado una posible pérdida. 
Además, hay problemas a la hora de calcular qué incidencia tienen los representantes 
de cobranzas en el cobro de estas deudas.
La implementación de una base de datos relacional se presenta como una solución crucial para centralizar y organizar 
toda la información relevante sobre clientes, créditos, cobros y la actividad de los empleados. 
Esto permitirá mejorar la precisión de los registros, facilitar el seguimiento del ciclo de vida del crédito, 
automatizar tareas de informes y proporcionar a los cobradores las herramientas necesarias para gestionar eficientemente 
su cartera y reducir la mora, minimizando así las posibles pérdidas financieras para Ya Crédito.

MODELO DE NEGOCIO
Ya Crédito a sus clientes ofrece acceso rápido a créditos a sus clientes.
Esta entidad busca tener una relación automatizada con sus clientes, lo cual le permita reducir costos en esta operación.
Además de que esto es lo que buscan los clientes de Ya Crédito, un acceso rápido a financiación.
El valor que ofrecerá la base de datos a "Ya Crédito" será: 
- Eficiencia en la gestión de cobros, 
- reducción de pérdidas por mora, 
- mejor seguimiento del rendimiento de los empleados, 
- información para la toma de decisiones.

En la Tabla Clientes tendremos los datos de los clientes, tales como: nombre, apellido, DNI, edad, mail, telefono.
En la Tabla Créditos tendremos los datos de los créditos brindados a cada uno de los clientes, con sus respectivas condiciones, vinculadas
entre sí con el id de los clientes como clave foránea.
En la Tabla Empleados estarán los datos de los empleados encargados de la gestión de la cobranza de la cartera morosa de
Ya Créditos.
En la Tabla Cobros se encontrarán los cobros de cada unos de los créditos brindados a los clientes, los cuales pudieron haberse dado de manera orgánica (que el cliente pague
proactivamente) o que haya sido gracias a la gestión de cobranzas de un empleado.  En caso de haber sido gracias a un empleado, esto lo veremos referenciado con una clave 
foránea, la cual será el id del empleado.
En la Tabla Gestiones_empleados tendremos las gestiones de cobranzas de los empleados para atraer los pagos de los clietnes. En caso de ser una gestión exitosa, esta tendrá como resultado una
promesa de pago cumplida.
En la Tabla Promesas_pago estará el estado de cada una de las promesas de pago hechas por los empleados y si esta representó un cobro efectivo.

*/

CREATE DATABASE Creditos;
USE  creditos;
CREATE TABLE clientes(
id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR (100) NOT NULL,
apellido VARCHAR (100) NOT NULL,
dni INT UNIQUE NOT NULL,
telefono VARCHAR (20) NOT NULL,
mail VARCHAR (100) DEFAULT NULL UNIQUE,
edad INT DEFAULT NULL
);

INSERT INTO clientes (nombre, apellido, dni, telefono, mail, edad)
	VALUES
('Sofía', 'Martínez', 25698741, '1155551234', 'sofia.martinez@email.com', 30),
('Juan', 'Pérez', 30123456, '1166667890', 'juan.perez@email.com', 45),
('Isabella', 'García', 38765432, '1177772345', 'isabella.garcia@email.com', 22),
('Mateo', 'López', 28901234, '1188888901', 'mateo.lopez@email.com', 50),
('Valentina', 'Rodríguez', 42345678, '1199993456', 'valentina.rodriguez@email.com', 28),
('Benjamín', 'Díaz', 33456789, '1144445678', 'benjamin.diaz@email.com', 38),
('Emma', 'Fernández', 40567890, '1133339012', 'emma.fernandez@email.com', 25),
('Sebastián', 'Gómez', 29678901, '1122224567', 'sebastian.gomez@email.com', 42),
('Martina', 'Ruiz', 36789012, '1111118901', 'martina.ruiz@email.com', 31),
('Nicolás', 'Torres', 45890123, '1100003456', 'nicolas.torres@email.com', 27),
('Lucía', 'Flores', 31901234, '1154321098', 'lucia.flores@email.com', 48),
('Gabriel', 'Vargas', 27012345, '1165432109', 'gabriel.vargas@email.com', 35),
('Camila', 'Jiménez', 39123456, '1176543210', 'camila.jimenez@email.com', 29),
('Alejandro', 'Castro', 43234567, '1187654321', 'alejandro.castro@email.com', 41),
('Antonella', 'Ortiz', 34345678, '1198765432', 'antonella.ortiz@email.com', 24);

CREATE TABLE creditos(
id_credito INT PRIMARY KEY AUTO_INCREMENT,
monto INT,
interes INT,
gastos INT,
plazo VARCHAR (20) NOT NULL,
fecha_otorgamiento DATE NOT NULL,
id_cliente INT,
FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

INSERT INTO creditos (monto, interes, gastos, plazo, fecha_otorgamiento, id_cliente)
	VALUES 
(10000, 15, 50, '12 meses', '2025-03-15', 1),
(50000, 12, 100, '24 meses', '2025-02-20', 2),
(25000, 18, 75, '18 meses', '2025-03-01', 3),
(75000, 10, 150, '36 meses', '2025-01-10', 4),
(15000, 20, 60, '6 meses', '2025-03-25', 5),
(30000, 14, 80, '24 meses', '2025-02-10', 6),
(60000, 11, 120, '30 meses', '2025-01-25', 7),
(20000, 16, 70, '15 meses', '2025-03-05', 8),
(40000, 13, 90, '28 meses', '2025-02-15', 9),
(80000, 9, 160, '40 meses', '2025-01-05', 10),
(12000, 19, 55, '9 meses', '2025-03-20', 11),
(35000, 13, 85, '26 meses', '2025-02-05', 12),
(55000, 12, 110, '32 meses', '2025-01-20', 13),
(18000, 17, 65, '12 meses', '2025-03-10', 14),
(45000, 14, 95, '30 meses', '2025-02-01', 15);


 CREATE TABLE empleados (
 id_empleado INT PRIMARY KEY AUTO_INCREMENT,
 nombre_empleado VARCHAR (100) DEFAULT NULL,
 apellido_empleado VARCHAR (100) DEFAULT NULL,
 email_empleado VARCHAR (100) UNIQUE 
 );
 
 INSERT INTO empleados (nombre_empleado, apellido_empleado, email_empleado) VALUES
('Laura', 'Gómez', 'laura.gomez@empresa.com'),
('Carlos', 'Rodríguez', 'carlos.rodriguez@empresa.com'),
('Ana', 'Pérez', 'ana.perez@empresa.com'),
('Javier', 'López', 'javier.lopez@empresa.com'),
('Mariana', 'Díaz', 'mariana.diaz@empresa.com'),
('Sebastián', 'Fernández', 'sebastian.fernandez@empresa.com'),
('Valentina', 'Ruiz', 'valentina.ruiz@empresa.com'),
('Martín', 'Torres', 'martin.torres@empresa.com'),
('Lucía', 'Flores', 'lucia.flores@empresa.com'),
('Andrés', 'Vargas', 'andres.vargas@empresa.com'),
('Camila', 'Jiménez', 'camila.jimenez@empresa.com'),
('Federico', 'Castro', 'federico.castro@empresa.com'),
('Daniela', 'Ortiz', 'daniela.ortiz@empresa.com'),
('Gustavo', 'Suárez', 'gustavo.suarez@empresa.com'),
('Silvina', 'Romero', 'silvina.romero@empresa.com');

 
 CREATE TABLE cobros(
 id_cobro INT PRIMARY KEY AUTO_INCREMENT, 
 monto INT,
 fecha_pago DATETIME,
 metodo_de_pago VARCHAR (50),
 id_empleado INT DEFAULT NULL,
 FOREIGN KEY (id_empleado)
 REFERENCES empleados (id_empleado)
 );
 
 ALTER TABLE cobros MODIFY fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP;
 ALTER TABLE cobros ADD COLUMN id_credito INT;
 ALTER TABLE cobros ADD CONSTRAINT fk_id_credito
	FOREIGN KEY (id_credito)
	REFERENCES creditos (id_credito);
ALTER TABLE cobros MODIFY id_credito INT NOT NULL;
    
INSERT INTO cobros (monto, metodo_de_pago, id_empleado, id_credito) VALUES
	(1000, 'Transferencia Bancaria', NULL, 1),
    (2000, 'Transferencia Bancaria', NULL, 1),
    (1000, 'Efectivo', 1, 1),
    (10000, 'Transferencia Bancaria', 2, 2),
    (10000, 'Debito Automatico', NULL, 2),
	(5000, 'Pago en Línea', NULL, 3),
	(5000, 'Transferencia Bancaria', 3,3),
	(5000, 'Débito Automático', NULL,3),
	(15000, 'Débito Automático', 1, 4),
	(15000, 'Pago en Línea', NULL, 4),
	(15000, 'Transferencia Bancaria', 2, 4),
    (3000, 'Transferencia Bancaria', NULL, 5),
	(3000, 'Débito Automático', 3, 5);
    
    
CREATE TABLE gestiones_empleados(
id_gestion INT PRIMARY KEY AUTO_INCREMENT,
id_empleado INT,
id_cliente INT,
resultado_gestion VARCHAR (100),
FOREIGN KEY (id_empleado)
 REFERENCES empleados (id_empleado),
 FOREIGN KEY (id_cliente)
 REFERENCES clientes (id_cliente)
);

CREATE TABLE promesas_pago (
id_promesa INT PRIMARY KEY AUTO_INCREMENT,
monto_promesa INT,
estado_promesa VARCHAR (30) DEFAULT 'En curso',
id_cliente INT, 
id_empleado INT,
id_gestion INT,
FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
FOREIGN KEY (id_gestion) REFERENCES gestiones_empleados (id_gestion)
);

ALTER TABLE cobros CHANGE COLUMN monto monto_cobro INT;


INSERT INTO gestiones_empleados (id_empleado, id_cliente, resultado_gestion) VALUES
(1, 1, 'Llamada telefónica: Cliente informa imposibilidad de pago.'),
(2, 3, 'Envío de correo electrónico recordando deuda.'),
(1, 5, 'Visita domiciliaria: Se dejó notificación.'),
(3, 2, 'Mensaje de texto: Solicitud de contacto.'),
(2, 7, 'Llamada telefónica: Cliente pide prórroga.'),
(1, 9, 'Envío de carta formal de intimación.'),
(3, 4, 'Llamada telefónica: Cliente desconoce deuda.'),
(2, 6, 'Envío de correo electrónico con plan de pagos.'),
(1, 8, 'Visita domiciliaria: Cliente no se encuentra.'),
(3, 10, 'Mensaje de texto: Confirmación de pago parcial.'),
(1, 11, 'Llamada telefónica: Cliente promete pago en 72 horas.'),
(2, 13, 'Envío de correo electrónico con descuento por pago total.'),
(3, 15, 'Llamada telefónica: Cliente se compromete a pagar la próxima semana.'),
(1, 12, 'Envío de carta formal de inicio de acciones legales.'),
(2, 14, 'Mensaje de texto: Recordatorio de fecha de promesa de pago.');

INSERT INTO promesas_pago (monto_promesa, estado_promesa, id_cliente, id_empleado, id_gestion) VALUES
(3500, 'Pendiente', 11, 1, 11), 
(8000, 'Pendiente', 5, 1, 3),  
(1200, 'Pendiente', 7, 2, 5),  
(5000, 'Pendiente', 15, 3, 13), 
(2200, 'Pendiente', 9, 1, 6),  
(10000, 'Cumplida', 3, 2, 2), 
(6000, 'Pendiente', 1, 1, 1),  
(9500, 'Pendiente', 13, 2, 12), 
(1800, 'Pendiente', 10, 3, 10), 
(4200, 'Pendiente', 14, 2, 15),
(7800, 'Vencida', 2, 3, 4),
(1500, 'Pendiente', 6, 2, 8),
(11500, 'Cumplida', 8, 1, 9),  
(2800, 'Pendiente', 4, 3, 7),  
(6700, 'Pendiente', 12, 1, 14); 


