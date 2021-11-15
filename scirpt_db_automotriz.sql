CREATE DATABASE db_automotriz
GO

USE db_automotriz
GO

CREATE TABLE PROVINCIAS(
	id_provincia int identity (1,1),
	provincia varchar(50)
	CONSTRAINT pk_provincias PRIMARY KEY (id_provincia)
)

CREATE TABLE LOCALIDADES(
	id_localidad int identity (1,1),
	id_provincia int,
	localidad varchar(50),
	CONSTRAINT pk_localidades PRIMARY KEY (id_localidad),
	CONSTRAINT fk_localilades_provincias FOREIGN KEY (id_provincia)
		REFERENCES PROVINCIAS (id_provincia)
)

CREATE TABLE BARRIOS(
	id_barrio int identity (1,1),
	id_localidad int,
	barrio varchar(50),
	CONSTRAINT pk_barrios PRIMARY KEY (id_barrio),
	CONSTRAINT fk_barrios_localidades FOREIGN KEY (id_localidad)
		REFERENCES LOCALIDADES (id_localidad)
)

CREATE TABLE DOMICILIOS(
	id_domicilio int identity(1,1),
	id_barrio int,
	calle varchar(30) NOT NULL,
	numero int NOT NULL,
	piso int,
	dpto char,
	CONSTRAINT pk_domicilios PRIMARY KEY (id_domicilio),
	CONSTRAINT fk_domicilios_barrios FOREIGN KEY (id_barrio)
		REFERENCES BARRIOS (id_barrio)
)

CREATE TABLE MARCAS(
	id_marca int identity (1,1),
	marca varchar(50),
	CONSTRAINT pk_marcas PRIMARY KEY (id_marca)
)

CREATE TABLE MODELOS(
	id_modelo int identity (1,1),
	modelo varchar(50),
	CONSTRAINT pk_modelos PRIMARY KEY (id_modelo)
)

CREATE TABLE SEGMENTOS(
	id_segmento int identity (1,1),
	segmento varchar(50),
	CONSTRAINT pk_segmentos PRIMARY KEY (id_segmento)
)

CREATE TABLE TIPOS_COMBUSTIBLE(
	id_tipo_combustible int identity (1,1),
	tipo_combustible varchar(50),
	CONSTRAINT pk_tipos_combustible PRIMARY KEY (id_tipo_combustible)
)

CREATE TABLE TIPOS_TRANSMISION(
	id_tipo_transmision int identity (1,1),
	tipo_transmision varchar(50),
	CONSTRAINT pk_tipos_transmision PRIMARY KEY (id_tipo_transmision)
)

CREATE TABLE TIPOS_PRODUCTO(
	id_tipo_producto int identity (1,1),
	tipo_producto varchar (50),
	CONSTRAINT pk_tipos_producto PRIMARY KEY (id_tipo_producto)
)

CREATE TABLE PRODUCTOS(
	id_producto int identity (1,1),
	id_tipo_producto int,
	descripcion varchar (100),
	id_marca int,
	id_modelo int,
	id_segmento int,
	id_tipo_combustible int,
	id_tipo_transmision int,
	fecha_fabricacion date,
	precio_unitario numeric (10,2),
	stock int,
	stock_minimo int,
	CONSTRAINT pk_productos PRIMARY KEY (id_producto),
	CONSTRAINT fk_productos_tipo_productos FOREIGN KEY (id_tipo_producto)
		REFERENCES TIPOS_PRODUCTO (id_tipo_producto),
	CONSTRAINT fk_productos_marcas FOREIGN KEY (id_marca)
		REFERENCES MARCAS (id_marca),
	CONSTRAINT fk_productos_modelos FOREIGN KEY (id_modelo)
		REFERENCES MODELOS (id_modelo),
	CONSTRAINT fk_productos_segmento FOREIGN KEY (id_segmento)
		REFERENCES SEGMENTOS (id_segmento),
	CONSTRAINT fk_productos_tipos_combustible FOREIGN KEY (id_tipo_combustible)
		REFERENCES TIPOS_COMBUSTIBLE (id_tipo_combustible),
	CONSTRAINT fk_productos_tipos_transmision FOREIGN KEY (id_tipo_transmision)
		REFERENCES TIPOS_TRANSMISION (id_tipo_transmision)
)

CREATE TABLE TIPOS_CLIENTE(
	id_tipo_cliente int identity(1,1),
	tipo_cliente varchar(30)
	CONSTRAINT pk_tipos_documento PRIMARY KEY (id_tipo_cliente)
)

CREATE TABLE CLIENTES(
	id_cliente int identity (1,1),
	id_tipo_cliente int,
	id_domicilio int,
	cuil_cuit int NOT NULL,
	nombre varchar(50) NOT NULL,
	apellido varchar (50) NOT NULL,
	telefono varchar(30),
	email varchar(50),
	CONSTRAINT pk_clientes PRIMARY KEY (id_cliente),
	CONSTRAINT fk_clientes_tipos_cliente FOREIGN KEY (id_tipo_cliente)
		REFERENCES TIPOS_CLIENTE (id_tipo_cliente),
	CONSTRAINT fk_clientes_domicilios FOREIGN KEY (id_domicilio)
		REFERENCES DOMICILIOS (id_domicilio)
)

CREATE TABLE HISTORIAL_PRECIOS(
	id_historial int identity(1,1),
	id_producto int,
	precio numeric(10,2),
	fecha_desde date,
	fecha_hasta date,
	CONSTRAINT pk_historial_precios PRIMARY KEY (id_historial),
	CONSTRAINT fk_historial_precios_productos FOREIGN KEY (id_producto)
		REFERENCES PRODUCTOS (id_producto),
)

CREATE TABLE TIPOS_FACTURA(
	id_tipo_factura int identity (1,1),
	tipo_factura varchar (100),
	CONSTRAINT pk_tipos_factura PRIMARY KEY (id_tipo_factura)
)

CREATE TABLE TIPOS_RESPONSABLE(
	id_tipo_responsable int identity (1,1),
	tipo_responsable varchar (100),
	CONSTRAINT pk_tipos_responsable PRIMARY KEY (id_tipo_responsable)
)

CREATE TABLE FORMAS_PAGO(
	id_forma_pago int identity(1,1),
	forma_pago varchar(50),
	CONSTRAINT pk_formas_pago PRIMARY KEY (id_forma_pago)
)

CREATE TABLE ORDENES_PEDIDO(
	id_orden_pedido int identity (1,1),
	id_producto int,
	id_cliente int,
	cantidad int,
	fecha_pedido date,
	fecha_entrega date,
	CONSTRAINT pk_ordenes_pedido PRIMARY KEY (id_orden_pedido),
	CONSTRAINT fk_ordenes_pedido_productos FOREIGN KEY (id_producto)
		REFERENCES PRODUCTOS (id_producto),
	CONSTRAINT fk_ordenes_pedido_clientes FOREIGN KEY (id_cliente)
		REFERENCES CLIENTES (id_cliente)
)

CREATE TABLE FACTURAS(
	nro_factura int identity(1,1),
	id_cliente int,
	id_tipo_factura int,
	id_forma_pago int,
	id_orden_pedido int,
	fecha date,
	CONSTRAINT pk_facturas PRIMARY KEY (nro_factura),
	CONSTRAINT fk_facturas_clientes FOREIGN KEY (id_cliente)
		REFERENCES CLIENTES (id_cliente),
	CONSTRAINT fk_facturas_tipos_factura FOREIGN KEY (id_tipo_factura)
		REFERENCES TIPOS_FACTURA (id_tipo_factura),
	CONSTRAINT fk_facturas_formas_pago FOREIGN KEY (id_forma_pago)
		REFERENCES FORMAS_PAGO (id_forma_pago),
	CONSTRAINT fk_facturas_ordenes_pedido FOREIGN KEY (id_orden_pedido)
		REFERENCES ORDENES_PEDIDO (id_orden_pedido)
)

CREATE TABLE TIPOS_AUTOPLAN(
	id_tipo_autoplan int identity (1,1),
	cantidad_cuotas int,
	interes int,
	CONSTRAINT pk_tipos_autoplan PRIMARY KEY (id_tipo_autoplan)
)

CREATE TABLE AUTOPLANES(
	id_autoplan int identity (1,1),
	id_tipo_autoplan int,
	id_producto int,
	CONSTRAINT pk_autoplanes PRIMARY KEY (id_autoplan),
	CONSTRAINT fk_autoplanes_tipos_autoplan FOREIGN KEY (id_tipo_autoplan)
		REFERENCES TIPOS_AUTOPLAN (id_tipo_autoplan),
	CONSTRAINT fk_autoplanes_productos FOREIGN KEY (id_producto)
		REFERENCES PRODUCTOS (id_producto)
)

CREATE TABLE DETALLES_FACTURA(
	id_detalle_factura int identity (1,1),
	nro_factura int,
	id_producto int,
	id_autoplan int,
	precio numeric(10,2),
	cantidad int,
	descuento int
	CONSTRAINT pk_detalles_factura PRIMARY KEY (id_detalle_factura),
	CONSTRAINT fk_detalles_factura_facturas FOREIGN KEY (nro_factura)
		REFERENCES FACTURAS (nro_factura),
	CONSTRAINT fk_detalles_factura_productos FOREIGN KEY (id_producto)
		REFERENCES PRODUCTOS (id_producto),
	CONSTRAINT fk_detalles_factura_autoplanes FOREIGN KEY (id_autoplan)
		REFERENCES AUTOPLANES (id_autoplan),
)

--PROCEDIMIENTOS ALMACENADOS

--SP CONSULTAR AUTOPARTES
ALTER PROCEDURE SP_CONSULTAR_AUTOPARTES
@descripcion varchar (100),
@id_modelo int
AS 
BEGIN
SELECT 
	P.id_producto,
	P.descripcion,
	MO.modelo,
	'$ ' + CONVERT(VARCHAR(50),CAST(precio_unitario AS MONEY), 1) 'precio_unitario',
	stock,
	stock_minimo
FROM PRODUCTOS P
	JOIN MODELOS MO ON MO.id_modelo = P.id_modelo
WHERE 
	id_tipo_producto = 2
	AND (@descripcion IS NULL OR P.descripcion LIKE '%' + @descripcion + '%')
	AND (@id_modelo IS NULL OR MO.id_modelo = @id_modelo)
END

--SP CONSULTAR CLIENTES
create proc SP_CONSULTAR_CLIENTES
	@fecha_desde date,
	@fechas_hasta date,
	@check_aux bit
AS
BEGIN
IF(@check_aux = 0)
BEGIN
	Select C.id_cliente, c.apellido+', '+c.nombre Cliente, tc.tipo_cliente, c.cuil_cuit,
	c.telefono, c.email
	from CLIENTES C JOIN FACTURAS F ON C.id_cliente = F.id_cliente
	JOIN TIPOS_CLIENTE tc ON c.id_tipo_cliente = tc.id_tipo_cliente
	where ((@fecha_desde is null and @fechas_hasta is  null)
	OR (f.fecha between @fecha_desde and @fechas_hasta))
	ORDER BY c.id_cliente
END
ELSE
BEGIN
	Select C.id_cliente, c.apellido+', '+c.nombre Cliente, tc.tipo_cliente, c.cuil_cuit,
	c.telefono, c.email 
	from CLIENTES C JOIN FACTURAS F ON C.id_cliente = F.id_cliente
	JOIN TIPOS_CLIENTE tc on c.id_tipo_cliente = tc.id_tipo_cliente
	where C.id_cliente NOT IN (select id_cliente from FACTURAS
	where ((@fecha_desde is null and @fechas_hasta is  null)
	OR (f.fecha between @fecha_desde and @fechas_hasta)))
	ORDER BY c.id_cliente
END
END

--SP CONSULTAR PRODUCTOS
ALTER PROCEDURE SP_CONSULTAR_PRODUCTOS
@descripcion varchar (100),
@id_modelo int,
@id_segmento int,
@id_combustible int,
@id_transmision int,
@precio_desde numeric (10,2),
@precio_hasta numeric (10,2)
AS
BEGIN
SELECT 
	P.descripcion,
	MO.modelo,
	SE.segmento,
	TC.tipo_combustible,
	TT.tipo_transmision,
	'$ ' + CONVERT(VARCHAR(50),CAST(P.precio_unitario AS MONEY), 1) 'precio_unitario',
	P.stock
FROM 
	PRODUCTOS P
	JOIN MODELOS MO ON MO.id_modelo = P.id_modelo
	JOIN SEGMENTOS SE ON SE.id_segmento = P.id_segmento
	JOIN TIPOS_COMBUSTIBLE TC ON TC.id_tipo_combustible = P.id_tipo_combustible
	JOIN TIPOS_TRANSMISION TT ON TT.id_tipo_transmision = P.id_tipo_transmision
WHERE
	(@descripcion IS NULL OR P.descripcion LIKE '%' + @descripcion + '%')
	AND (@id_modelo IS NULL OR MO.id_modelo = @id_modelo)
	AND (@id_segmento IS NULL OR P.id_segmento = @id_segmento)
	AND (@id_combustible IS NULL OR P.id_tipo_combustible = @id_combustible)
	AND (@id_transmision IS NULL OR P.id_tipo_transmision = @id_transmision)
	AND (P.precio_unitario BETWEEN @precio_desde AND @precio_hasta)
END

--SP CARGAR FACTURAS_PEDIDOS
CREATE PROCEDURE SP_CARGAR_FACTURAS_PEDIDOS
@id_producto int,
@cantidad int,
@id_cliente int,
@id_tipo_factura int,
@id_tipo_responsable int,
@descuento int,
@precio numeric(10,2),
@id_forma_pago int
AS
BEGIN
DECLARE @stock int
DECLARE @nro_factura int
SET @stock = (SELECT stock FROM PRODUCTOS WHERE id_producto = @id_producto)
SET @nro_factura = (SELECT ISNULL(MAX(nro_factura),0)+1 FROM FACTURAS)
IF (@stock >= @cantidad)
BEGIN
	INSERT INTO FACTURAS (id_tipo_factura, id_cliente, id_tipo_responsable, id_forma_pago, fecha)
		VALUES (@id_tipo_factura, @id_cliente, @id_tipo_responsable, @id_forma_pago, GETDATE())
	INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, precio, cantidad, descuento)
		VALUES (@nro_factura, @id_producto, @precio, @cantidad, @descuento)
END
ELSE
	INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega)
		VALUES (@id_producto, @id_cliente, @cantidad, GETDATE(), DATEADD(WEEK,3,GETDATE()))
END

--SP CONSULTAR FACTURAS
ALTER PROCEDURE SP_CONSULTAR_FACTURAS
@fecha_desde date,
@fecha_hasta date
AS
BEGIN
SELECT 
	F.nro_factura,
	FORMAT (F.fecha, 'dd/MM/yyyy') 'fecha',
	C.apellido + ', ' + C.nombre 'cliente',	
	DF.cantidad,
	P.descripcion,
	'$ ' + CONVERT(VARCHAR(50),CAST(SUM(DF.precio*cantidad) AS MONEY),1) 'subtotal',
	'$ ' + CONVERT(VARCHAR(50),CAST(SUM((DF.precio*cantidad)*DF.descuento/100) AS MONEY),1) 'descuento',
	'$ ' + CONVERT(VARCHAR(50),CAST(((SUM(DF.precio*cantidad)-SUM(DF.precio*cantidad)*DF.descuento/100)) AS MONEY), 1) 'total'
FROM 
	FACTURAS F
	JOIN DETALLES_FACTURA DF ON DF.nro_factura = F.nro_factura
	JOIN CLIENTES C ON C.id_cliente = F.id_cliente
	JOIN PRODUCTOS P ON P.id_producto = DF.id_producto
WHERE 
	F.fecha BETWEEN @fecha_desde AND @fecha_hasta
GROUP BY
	F.nro_factura, 
	F.fecha, C.apellido + ', ' + C.nombre,	
	DF.cantidad,
	P.descripcion,
	P.precio_unitario,
	DF.descuento
END

--CONSULTAR ORDENES DE PEDIDO - TODAS
CREATE PROCEDURE SP_CONSULTAR_ORDENES_TODAS
AS
BEGIN
SELECT 
	op.id_orden_pedido,
	FORMAT (OP.fecha_entrega, 'dd/MM/yyyy') 'fecha_entrega',
	p.descripcion,
	op.cantidad,
	C.apellido + ', ' + C.nombre 'cliente',
	C.telefono,
	C.email 
FROM 
	ORDENES_PEDIDO OP
	JOIN PRODUCTOS p ON op.id_producto = p.id_producto
	JOIN CLIENTES c ON op.id_cliente = c.id_cliente
END

--SP CONSULTAR ORDENES POR VENCER
CREATE PROCEDURE SP_CONSULTAR_ORDENES_FILTRO
AS
BEGIN
SELECT 
	op.id_orden_pedido,
	FORMAT (OP.fecha_entrega, 'dd/MM/yyyy') 'fecha_entrega',
	p.descripcion,
	op.cantidad,
	C.apellido + ', ' + C.nombre 'cliente',
	C.telefono,
	C.email 
FROM 
	ORDENES_PEDIDO OP
	JOIN PRODUCTOS p ON op.id_producto = p.id_producto
	JOIN CLIENTES c ON op.id_cliente = c.id_cliente
WHERE 
	fecha_entrega BETWEEN GETDATE() AND DATEADD(WEEK, 1, GETDATE())
END



--INSERTAR REGISTROS

--TIPOS DE PRODUCTOS
INSERT INTO TIPOS_PRODUCTO (tipo_producto) VALUES ('AUTOMOVILES')
INSERT INTO TIPOS_PRODUCTO (tipo_producto) VALUES ('AUTOPARTES')

--MARCAS
INSERT INTO MARCAS (marca) VALUES ('RENUALT')

--MODELOS
INSERT INTO MODELOS (modelo) VALUES ('SANDERO')
INSERT INTO MODELOS (modelo) VALUES ('LOGAN')
INSERT INTO MODELOS (modelo) VALUES ('STEPWAY')
INSERT INTO MODELOS (modelo) VALUES ('DUSTER')
INSERT INTO MODELOS (modelo) VALUES ('ALASKAN')
INSERT INTO MODELOS (modelo) VALUES ('KANGOO')
INSERT INTO MODELOS (modelo) VALUES ('OROCH')
INSERT INTO MODELOS (modelo) VALUES ('CAPTURE')
INSERT INTO MODELOS (modelo) VALUES ('KOLEOS')

--SEGMENTOS
INSERT INTO SEGMENTOS (segmento) VALUES ('COUPE')
INSERT INTO SEGMENTOS (segmento) VALUES ('MONOVOLUMEN')
INSERT INTO SEGMENTOS (segmento) VALUES ('SEDAN')
INSERT INTO SEGMENTOS (segmento) VALUES ('HATCHBACK')
INSERT INTO SEGMENTOS (segmento) VALUES ('CROSSOVER')
INSERT INTO SEGMENTOS (segmento) VALUES ('PICKUP')
INSERT INTO SEGMENTOS (segmento) VALUES ('UTILITARIO')
INSERT INTO SEGMENTOS (segmento) VALUES ('SUV')

--TIPOS DE COMBUSTIBLE
INSERT INTO TIPOS_COMBUSTIBLE (tipo_combustible) VALUES ('NAFTA')
INSERT INTO TIPOS_COMBUSTIBLE (tipo_combustible) VALUES ('DIESEL')

--TIPOS DE TRANSMISION
INSERT INTO TIPOS_TRANSMISION (tipo_transmision) VALUES ('MANUAL')
INSERT INTO TIPOS_TRANSMISION (tipo_transmision) VALUES ('AUTOMATICA')

--AUTOMOVILES
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, precio_unitario, id_marca, id_modelo, id_segmento, id_tipo_combustible, id_tipo_transmision, stock) VALUES (1, 'SANDERO LIFE 1.6', 2019400, 1, 1, 4, 1, 1, 15)
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, precio_unitario, id_marca, id_modelo, id_segmento, id_tipo_combustible, id_tipo_transmision, stock) VALUES (1, 'SANDERO ZEN 1.6', 2224700, 1, 1, 4, 1, 1, 12)
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, precio_unitario, id_marca, id_modelo, id_segmento, id_tipo_combustible, id_tipo_transmision, stock) VALUES (1, 'SANDERO INTENS 1.6', 2382800, 1, 1, 4, 1, 1, 10)
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, precio_unitario, id_marca, id_modelo, id_segmento, id_tipo_combustible, id_tipo_transmision, stock) VALUES (1, 'LOGAN LIFE 1.6', 2051400, 1, 2, 3, 1, 1, 13)
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, precio_unitario, id_marca, id_modelo, id_segmento, id_tipo_combustible, id_tipo_transmision, stock) VALUES (1, 'LOGAN ZEN 1.6', 2196200, 1, 2, 3, 1, 1, 11)
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, precio_unitario, id_marca, id_modelo, id_segmento, id_tipo_combustible, id_tipo_transmision, stock) VALUES (1, 'LOGAN INTENS 1.6', 2296300, 1, 2, 3, 1, 1, 9)
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, precio_unitario, id_marca, id_modelo, id_segmento, id_tipo_combustible, id_tipo_transmision, stock) VALUES (1, 'KANGOO LIFE 1.6', 2879100, 1, 6, 2, 1, 1, 12)
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, precio_unitario, id_marca, id_modelo, id_segmento, id_tipo_combustible, id_tipo_transmision, stock) VALUES (1, 'KANGOO ZEN 1.6', 3056300, 1, 6, 2, 1, 1, 10)
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, precio_unitario, id_marca, id_modelo, id_segmento, id_tipo_combustible, id_tipo_transmision, stock) VALUES (1, 'KANGOO INTENS 1.5', 3118000, 1, 6, 2, 2, 1, 9)
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, precio_unitario, id_marca, id_modelo, id_segmento, id_tipo_combustible, id_tipo_transmision, stock) VALUES (1, 'KOLEOS INTENS 2.5', 6739300, 1, 9, 5, 1, 2, 7)

--TIPOS DE CLIENTES
INSERT INTO TIPOS_CLIENTE (tipo_cliente) VALUES ('CONSUMIDOR FINAL')

--CLIENTES
INSERT INTO CLIENTES (id_tipo_cliente, id_domicilio, cuil_cuit, nombre, apellido, telefono, email) VALUES (1, NULL, 35869671, 'MATIAS', 'ROJAS', 3572449783, 'rojasmatias@gmail.com')
INSERT INTO CLIENTES (id_tipo_cliente, id_domicilio, cuil_cuit, nombre, apellido, telefono, email) VALUES (1, NULL, 34291072, 'GUIDO', 'CARIGNANO', 3572569815, NULL)
INSERT INTO CLIENTES (id_tipo_cliente, id_domicilio, cuil_cuit, nombre, apellido, telefono, email) VALUES (1, NULL, 35791823, 'FRANCO', 'ZIN', NULL, 'zinfranco@gmail.com')
INSERT INTO CLIENTES (id_tipo_cliente, id_domicilio, cuil_cuit, nombre, apellido, telefono, email) VALUES (1, NULL, 34651083, 'MAURO', 'VILLAGRA', 3572567612, NULL)
INSERT INTO CLIENTES (id_tipo_cliente, id_domicilio, cuil_cuit, nombre, apellido, telefono, email) VALUES (1, NULL, 35801682, 'AGUSTIN', 'LUCA', 3572589013, 'lucaagustin@gmail.com')
INSERT INTO CLIENTES (id_tipo_cliente, id_domicilio, cuil_cuit, nombre, apellido, telefono, email) VALUES (1, NULL, 34712067, 'AXEL', 'ARCE', NULL, NULL)
INSERT INTO CLIENTES (id_tipo_cliente, id_domicilio, cuil_cuit, nombre, apellido, telefono, email) VALUES (1, NULL, 35987234, 'IVAN', 'SAVORETTI', 3572529061, 'savorettiivan@gmail.com')
INSERT INTO CLIENTES (id_tipo_cliente, id_domicilio, cuil_cuit, nombre, apellido, telefono, email) VALUES (1, NULL, 34892581, 'PABLO', 'PINCIROLLI', 3572527023, NULL)
INSERT INTO CLIENTES (id_tipo_cliente, id_domicilio, cuil_cuit, nombre, apellido, telefono, email) VALUES (1, NULL, 34932510, 'GERMAN', 'CASERES', NULL, 'caseresgerman@gmail.com')
INSERT INTO CLIENTES (id_tipo_cliente, id_domicilio, cuil_cuit, nombre, apellido, telefono, email) VALUES (1, NULL, 35368021, 'FRANCO', 'CUFRE', NULL, NULL)
INSERT INTO CLIENTES (id_tipo_cliente, id_domicilio, cuil_cuit, nombre, apellido, telefono, email) VALUES (1, NULL, 35869674, 'PABLO', 'CABALLERO', NULL, 'ccaballero@gmail.com')
INSERT INTO CLIENTES (id_tipo_cliente, id_domicilio, cuil_cuit, nombre, apellido, telefono, email) VALUES (1, NULL, 35670912, 'MATIAS', 'POROPAT', 3572528055, 'mporopat@gmail.com')

--FORMAS DE PAGO
INSERT INTO FORMAS_PAGO (forma_pago) VALUES ('CHEQUE')
INSERT INTO FORMAS_PAGO (forma_pago) VALUES ('TARJETA')
INSERT INTO FORMAS_PAGO (forma_pago) VALUES ('EFECTIVO')
INSERT INTO FORMAS_PAGO (forma_pago) VALUES ('TRANSFERENCIA')

--TIPO DE FACTURAS
INSERT INTO TIPOS_FACTURA (tipo_factura) VALUES ('A')
INSERT INTO TIPOS_FACTURA (tipo_factura) VALUES ('B')
INSERT INTO TIPOS_FACTURA (tipo_factura) VALUES ('C')

--FACTURAS
INSERT INTO FACTURAS (id_cliente, id_tipo_factura, id_forma_pago, id_orden_pedido, fecha) VALUES (1, 3, 3, NULL, '2021/01/13')
INSERT INTO FACTURAS (id_cliente, id_tipo_factura, id_forma_pago, id_orden_pedido, fecha) VALUES (2, 1, 2, NULL, '2021/01/25')
INSERT INTO FACTURAS (id_cliente, id_tipo_factura, id_forma_pago, id_orden_pedido, fecha) VALUES (3, 2, 1, NULL, '2021/02/06')
INSERT INTO FACTURAS (id_cliente, id_tipo_factura, id_forma_pago, id_orden_pedido, fecha) VALUES (4, 3, 2, NULL, '2021/02/17')
INSERT INTO FACTURAS (id_cliente, id_tipo_factura, id_forma_pago, id_orden_pedido, fecha) VALUES (5, 1, 4, NULL, '2021/03/08')
INSERT INTO FACTURAS (id_cliente, id_tipo_factura, id_forma_pago, id_orden_pedido, fecha) VALUES (6, 2, 3, NULL, '2021/03/22')
INSERT INTO FACTURAS (id_cliente, id_tipo_factura, id_forma_pago, id_orden_pedido, fecha) VALUES (7, 3, 4, NULL, '2021/04/14')
INSERT INTO FACTURAS (id_cliente, id_tipo_factura, id_forma_pago, id_orden_pedido, fecha) VALUES (8, 2, 1, NULL, '2021/04/19')
INSERT INTO FACTURAS (id_cliente, id_tipo_factura, id_forma_pago, id_orden_pedido, fecha) VALUES (9, 3, 4, NULL, '2021/05/01')
INSERT INTO FACTURAS (id_cliente, id_tipo_factura, id_forma_pago, id_orden_pedido, fecha) VALUES (10, 1, 2, NULL, '2021/05/25')
INSERT INTO FACTURAS (id_cliente, id_tipo_factura, id_forma_pago, id_orden_pedido, fecha) VALUES (11, 3, 3, NULL, '2021/06/13')
INSERT INTO FACTURAS (id_cliente, id_tipo_factura, id_forma_pago, id_orden_pedido, fecha) VALUES (12, 1, 4, NULL, '2021/06/18')

--DETALLES DE FACTURAS
INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, id_autoplan, precio, cantidad, descuento) VALUES (1, 1, NULL, 2019400, 1, 5)
INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, id_autoplan, precio, cantidad, descuento) VALUES (2, 5, NULL, 2196200, 1, 10)
INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, id_autoplan, precio, cantidad, descuento) VALUES (3, 3, NULL, 2382800, 1, 5)
INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, id_autoplan, precio, cantidad, descuento) VALUES (4, 4, NULL, 2051400, 1, 10)
INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, id_autoplan, precio, cantidad, descuento) VALUES (5, 6, NULL, 2296300, 1, 5)
INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, id_autoplan, precio, cantidad, descuento) VALUES (6, 6, NULL, 2296300, 1, 10)
INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, id_autoplan, precio, cantidad, descuento) VALUES (7, 1, NULL, 2019400, 1, 5)
INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, id_autoplan, precio, cantidad, descuento) VALUES (8, 8, NULL, 3056300, 1, 10)
INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, id_autoplan, precio, cantidad, descuento) VALUES (9, 1, NULL, 2019400, 1, 5)
INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, id_autoplan, precio, cantidad, descuento) VALUES (10, 4, NULL, 2051400, 1, 10)
INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, id_autoplan, precio, cantidad, descuento) VALUES (11, 7, NULL, 2879100, 1, 5)
INSERT INTO DETALLES_FACTURA (nro_factura, id_producto, id_autoplan, precio, cantidad, descuento) VALUES (12, 4, NULL, 2051400, 1, 10)

--ORDENES DE PEDIDO
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 5, 71, '2020/12/08', '2021/06/08');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (8, 1, 55, '2021/07/15', '2021/01/02');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (2, 1, 90, '2020/09/07', '2021/11/07');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (6, 3, 61, '2021/02/27', '2021/08/08');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 11, 68, '2021/05/06', '2021/04/07');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (7, 9, 87, '2021/07/22', '2021/11/24');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 5, 71, '2021/02/11', '2021/01/08');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (2, 9, 9, '2020/10/04', '2021/10/05');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 10, 37, '2021/05/30', '2021/10/13');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (7, 5, 17, '2020/11/04', '2020/11/21');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (5, 2, 90, '2021/07/05', '2021/03/10');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (9, 6, 72, '2021/10/25', '2021/07/01');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (8, 7, 60, '2021/05/14', '2021/03/11');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 5, 65, '2020/11/05', '2021/08/07');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (9, 11, 45, '2021/09/13', '2021/02/26');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (4, 3, 47, '2021/01/02', '2021/03/03');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (4, 2, 73, '2021/10/23', '2021/05/04');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (9, 1, 17, '2021/01/10', '2021/03/16');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (2, 10, 25, '2020/11/18', '2021/07/05');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (5, 8, 87, '2020/11/16', '2021/02/26');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (8, 9, 73, '2021/03/23', '2021/04/21');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (6, 5, 4, '2021/08/04', '2021/07/13');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (6, 3, 66, '2021/03/28', '2021/05/31');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (4, 11, 18, '2020/09/18', '2021/04/13');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 10, 23, '2020/11/22', '2021/08/03');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (1, 11, 52, '2021/03/22', '2021/08/27');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (7, 3, 82, '2021/03/14', '2021/05/20');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 8, 7, '2021/02/22', '2021/08/18');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 9, 66, '2021/07/05', '2021/01/02');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (2, 2, 63, '2021/02/27', '2021/11/14');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (7, 5, 25, '2021/03/02', '2020/11/10');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (2, 10, 92, '2021/05/17', '2021/07/19');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (9, 7, 42, '2020/11/22', '2021/11/19');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (5, 7, 75, '2021/05/04', '2021/10/11');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 5, 26, '2021/10/07', '2021/10/04');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (9, 8, 99, '2020/10/15', '2021/03/30');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (6, 6, 82, '2020/09/20', '2021/02/21');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (6, 2, 44, '2020/09/21', '2021/11/16');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (8, 8, 64, '2021/04/20', '2021/04/20');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (8, 9, 69, '2021/01/24', '2021/06/15');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (6, 5, 28, '2020/10/02', '2021/08/20');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (5, 11, 92, '2021/04/21', '2021/03/22');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 4, 48, '2021/08/27', '2021/10/14');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 3, 25, '2020/11/30', '2021/11/13');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 10, 34, '2021/11/06', '2021/10/21');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 4, 64, '2021/09/13', '2020/12/30');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 9, 92, '2021/02/07', '2020/12/13');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (1, 6, 59, '2021/07/05', '2021/11/21');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 1, 14, '2020/11/30', '2021/03/11');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 8, 93, '2021/08/03', '2021/11/03');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (2, 10, 8, '2021/06/21', '2021/11/26');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (2, 4, 61, '2021/10/27', '2020/12/16');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (1, 11, 82, '2021/05/06', '2021/07/06');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 10, 35, '2021/09/28', '2021/10/28');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (7, 10, 31, '2020/10/28', '2021/08/11');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (7, 8, 6, '2021/08/12', '2021/01/24');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (1, 6, 91, '2021/08/10', '2021/10/15');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (4, 12, 42, '2021/06/17', '2021/10/16');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (6, 4, 49, '2021/06/17', '2021/06/04');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 5, 38, '2020/12/04', '2021/01/18');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 4, 53, '2020/11/02', '2020/11/06');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (1, 9, 39, '2021/04/15', '2021/01/01');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (6, 9, 35, '2020/09/11', '2021/09/20');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 5, 2, '2021/08/28', '2021/11/13');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (9, 8, 37, '2020/09/11', '2021/04/01');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (5, 9, 58, '2020/10/14', '2021/04/27');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (7, 2, 91, '2020/11/25', '2020/12/12');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (6, 4, 100, '2021/06/27', '2021/07/30');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 8, 27, '2020/11/17', '2020/11/30');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (5, 11, 92, '2021/04/06', '2021/08/01');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (2, 4, 50, '2021/09/11', '2021/09/01');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (2, 12, 12, '2021/08/22', '2021/06/30');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (8, 11, 97, '2021/09/03', '2021/02/28');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (2, 2, 38, '2021/01/27', '2021/03/27');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (4, 5, 75, '2021/05/17', '2020/11/12');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (1, 1, 36, '2021/02/19', '2020/11/20');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (8, 6, 53, '2020/10/21', '2021/09/21');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (1, 1, 83, '2021/01/26', '2020/12/22');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (5, 1, 70, '2021/03/28', '2020/12/09');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (5, 10, 90, '2020/12/01', '2021/10/15');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (5, 12, 87, '2020/10/29', '2021/10/11');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (8, 12, 79, '2021/06/14', '2021/07/13');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (8, 12, 26, '2021/01/12', '2021/03/05');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (4, 6, 45, '2021/09/24', '2021/08/13');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (5, 12, 13, '2021/06/15', '2021/01/20');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (7, 5, 25, '2021/08/15', '2021/07/03');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (8, 4, 100, '2021/07/17', '2021/10/26');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (5, 2, 48, '2020/10/14', '2021/03/01');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (7, 5, 32, '2021/01/02', '2021/08/25');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 10, 87, '2021/07/29', '2021/01/09');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (7, 6, 94, '2021/08/02', '2021/04/18');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (4, 8, 84, '2021/03/23', '2021/04/03');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 9, 67, '2021/01/19', '2021/02/02');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (7, 7, 25, '2020/12/15', '2021/08/30');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 8, 1, '2020/09/23', '2021/01/15');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 5, 34, '2020/09/30', '2021/01/25');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (8, 12, 80, '2021/03/08', '2021/08/19');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (4, 6, 65, '2020/12/13', '2021/10/18');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (1, 3, 43, '2021/01/19', '2021/06/10');
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 5, 50, '2021/07/05', '2021/09/20');

--PRODUCTOS
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BURLETES DE BAUL/PORTON', 1, 7, 409195, 8, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BURLETES DE PUERTAS', 1, 1, 316674, 29, 9);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'PASARRUEDAS PLASTICOS', 1, 6, 472604, 15, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'PARRILLAS', 1, 4, 199025, 10, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'FUNDAS PARA ASIENTOS', 1, 5, 354891, 49, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'PARAGOLPES', 1, 7, 475023, 41, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'VIDRIOS DE ESPEJO', 1, 1, 445696, 37, 9);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'FUNDAS PARA ASIENTOS', 1, 9, 392504, 3, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ESPEJOS', 1, 9, 254984, 34, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'CASCOS DE OPTICA', 1, 8, 318100, 35, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'LENTES', 1, 5, 186160, 47, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ELECTROVENTILADORES', 1, 1, 422223, 3, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ESTRIBERAS', 1, 5, 204444, 1, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'PARRILLAS', 1, 6, 195353, 27, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'VIDRIOS DE OPTICA', 1, 5, 106468, 47, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'LENTES', 1, 5, 115877, 34, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'VIDRIOS DE ESPEJO', 1, 8, 25831, 15, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'PARAGOLPES', 1, 3, 100032, 9, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'SPOILER', 1, 2, 395465, 35, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'MOLDURAS PASARRUEDA', 1, 6, 193612, 15, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'FUNDAS PARA ASIENTOS', 1, 9, 206933, 44, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'FAROS AUXILIARES', 1, 3, 432052, 47, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'GRILLAS PARAG-PARANTE-CAPOT', 1, 1, 185949, 7, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'SPOILER', 1, 8, 224505, 26, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ELECTROVENTILADORES', 1, 3, 480557, 6, 9);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BATERIAS', 1, 1, 71371, 14, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'TAZAS DE RUEDA', 1, 6, 142168, 4, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'PARTES DE CARROCERIA', 1, 9, 129386, 13, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BURLETES DE BAUL/PORTON', 1, 4, 225945, 31, 9);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'DEFLECTORES DE CAPOT', 1, 7, 79938, 11, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'RADIADORES', 1, 7, 105406, 11, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'PARAGOLPES', 1, 6, 121889, 25, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ALMAS DE PARAGOLPE', 1, 8, 228475, 22, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'GRILLAS PARAG-PARANTE-CAPOT', 1, 4, 66265, 13, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'REPARACION DE ESPEJOS CON BASE', 1, 2, 213136, 30, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ESPEJOS', 1, 2, 180085, 48, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BIDON RECUPERADOR DE AGUA', 1, 7, 370577, 18, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BURLETES DE LUNETA Y PARABRISA', 1, 9, 462020, 27, 9);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'CASCOS DE OPTICA', 1, 6, 434150, 16, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'MOLDURAS PASARRUEDA', 1, 2, 498137, 24, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'RADIADORES DE CALEFACCION', 1, 1, 429083, 38, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'RADIADORES DE CALEFACCION', 1, 1, 141434, 30, 9);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'FUNDAS PARA ASIENTOS', 1, 9, 225173, 25, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'PARAGOLPES', 1, 8, 193800, 1, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ELECTROVENTILADORES', 1, 3, 296223, 30, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BATERIAS', 1, 5, 446336, 39, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'RETENES DE OPTICA/SOPORTE AUX', 1, 3, 106132, 17, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ELECTROVENTILADORES', 1, 6, 160867, 31, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'PARTES DE CARROCERIA', 1, 9, 499201, 9, 9);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'VIDRIOS DE ESPEJO', 1, 1, 305618, 36, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ESPEJOS', 1, 1, 220437, 32, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'RADIADORES DE CALEFACCION', 1, 1, 429302, 50, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'RADIADORES DE CALEFACCION', 1, 7, 325033, 40, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'VIDRIOS DE OPTICA', 1, 7, 459117, 1, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'FAROS AUXILIARES', 1, 8, 270152, 19, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ELECTROVENTILADORES', 1, 8, 258961, 13, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ELECTROVENTILADORES', 1, 5, 260738, 38, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'REPARACION DE ESPEJOS CON BASE', 1, 2, 40962, 16, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'GRILLAS PARAG-PARANTE-CAPOT', 1, 9, 387723, 4, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ESTRIBERAS', 1, 9, 317047, 25, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ESTRIBERAS', 1, 5, 36471, 46, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ELECTROVENTILADORES', 1, 7, 214582, 20, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'GRILLAS PARAG-PARANTE-CAPOT', 1, 2, 351544, 12, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ALMAS DE PARAGOLPE', 1, 6, 268314, 40, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ESPEJOS', 1, 5, 377364, 35, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ESCOBILLAS Y BRAZOS', 1, 2, 227888, 11, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'SOPORTES DE PARAGOLPES', 1, 7, 294933, 30, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'REPARACION DE ESPEJOS CON BASE', 1, 9, 428001, 50, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'PASARRUEDAS PLASTICOS', 1, 8, 325242, 38, 9);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'XENON', 1, 9, 383470, 24, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'CACHA DE ESPEJO', 1, 3, 373152, 18, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'MOLDURAS PASARRUEDA', 1, 8, 228351, 43, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BURLETES DE BAUL/PORTON', 1, 9, 240243, 23, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'DEFLECTORES DE VENTANA', 1, 1, 427662, 10, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'PASARRUEDAS PLASTICOS', 1, 9, 243902, 23, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BURLETES DE BAUL/PORTON', 1, 8, 30604, 4, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'AROS DE FARO', 1, 6, 48299, 39, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BATERIAS', 1, 5, 439526, 24, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'TAZAS DE RUEDA', 1, 5, 242124, 9, 9);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'PARRILLAS', 1, 8, 292033, 14, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'SPOILER', 1, 7, 363161, 40, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'VIDRIOS DE ESPEJO', 1, 3, 20505, 29, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'RADIADORES DE CALEFACCION', 1, 9, 231405, 44, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ESTRIBERAS', 1, 2, 342500, 26, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'AROS DE FARO', 1, 9, 232583, 14, 9);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ESTRIBO', 1, 4, 469414, 11, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ESTRIBERAS', 1, 8, 103811, 13, 9);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BURLETES DE PUERTAS', 1, 2, 429214, 39, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ELECTROVENTILADORES', 1, 1, 299494, 31, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'FUNDAS PARA ASIENTOS', 1, 9, 390628, 32, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BURLETES DE BAUL/PORTON', 1, 4, 102953, 44, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'ALMAS DE PARAGOLPE', 1, 9, 259726, 46, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'LENTES', 1, 9, 367122, 36, 9);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'CASCOS DE OPTICA', 1, 5, 158611, 30, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'FUNDAS PARA ASIENTOS', 1, 3, 104846, 6, 5);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'DEFLECTORES DE CAPOT', 1, 2, 274993, 13, 8);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'BURLETES DE LUNETA Y PARABRISA', 1, 3, 158329, 17, 6);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'FAROS', 1, 2, 409160, 34, 10);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'FUNDAS PARA ASIENTOS', 1, 2, 306228, 45, 7);
INSERT INTO PRODUCTOS (id_tipo_producto, descripcion, id_marca, id_modelo, precio, stock, stock_minimo) VALUES (2, 'FAROS AUXILIARES', 1, 2, 445396, 33, 5);