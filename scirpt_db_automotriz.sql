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
	precio_unitario,
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
CREATE PROCEDURE SP_CONSULTAR_PRODUCTOS
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
	P.precio_unitario,
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
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (3, 8, 1, '2021/11/01', '2021/11/22')
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (7, 4, 1, '2021/11/02', '2021/11/23')
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (5, 6, 1, '2021/11/03', '2021/11/24')
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (9, 2, 1, '2021/11/04', '2021/11/25')
INSERT INTO ORDENES_PEDIDO (id_producto, id_cliente, cantidad, fecha_pedido, fecha_entrega) VALUES (10, 10, 1, '2021/11/05', '2021/11/26')
