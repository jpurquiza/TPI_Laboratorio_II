CREATE DATABASE CONCESIONARIA

GO

USE CONCESIONARIA

GO

CREATE TABLE PROVINCIAS(
	id_provincia int identity (1,1),
	provincia varchar(50)
	CONSTRAINT pk_provincias PRIMARY KEY (id_provincia)
)

CREATE TABLE LOCALIDADES(
	id_localidad int identity (1,1),
	localidad varchar(50),
	id_provincia int,
	CONSTRAINT pk_localidades PRIMARY KEY (id_localidad),
	CONSTRAINT fk_localilades_provincias FOREIGN KEY (id_provincia)
		REFERENCES PROVINCIAS (id_provincia)
)

CREATE TABLE BARRIOS(
	id_barrio int identity (1,1),
	barrio varchar(50),
	id_localidad int,
	CONSTRAINT pk_barrios PRIMARY KEY (id_barrio),
	CONSTRAINT fk_barrios_localidades FOREIGN KEY (id_localidad)
		REFERENCES LOCALIDADES (id_localidad)
)

CREATE TABLE DOMICILIOS(
	id_domicilio int identity(1,1),
	calle varchar(30) NOT NULL,
	numero int NOT NULL,
	piso int,
	dpto char,
	id_barrio int,
	CONSTRAINT pk_domicilios PRIMARY KEY (id_domicilio),
	CONSTRAINT fk_domicilios_barrios FOREIGN KEY (id_barrio)
		REFERENCES BARRIOS (id_barrio)
)

CREATE TABLE TIPOS_DOCUMENTO(
	id_tipo_documento int identity(1,1),
	tipo_documento varchar(30)
	CONSTRAINT pk_tipos_documento PRIMARY KEY (id_tipo_documento)
)

CREATE TABLE CLIENTES(
	id_cliente int identity (1,1),
	id_domicilio int,
	id_tipo_documento int,
	nro_documento int NOT NULL,
	apellido varchar (50) NOT NULL,
	nombre varchar(50) NOT NULL,
	telefono varchar(30),
	email varchar(50),
	CONSTRAINT pk_personas PRIMARY KEY (id_cliente),
	CONSTRAINT fk_personas_tipos_documento FOREIGN KEY (id_tipo_documento)
		REFERENCES TIPOS_DOCUMENTO (id_tipo_documento),
	CONSTRAINT fk_clientes_domicilios FOREIGN KEY (id_domicilio)
		REFERENCES DOMICILIOS (id_domicilio)
)

CREATE TABLE VENDEDORES(
	id_vendedor int identity (1,1),
	id_domicilio int,
	id_tipo_documento int,
	nro_documento int NOT NULL,
	apellido varchar (50) NOT NULL,
	nombre varchar(50) NOT NULL,
	telefono varchar(30),
	email varchar(50),
	CONSTRAINT pk_vendedores PRIMARY KEY (id_vendedor),
	CONSTRAINT fk_vendedores_tipos_documento FOREIGN KEY (id_tipo_documento)
		REFERENCES TIPOS_DOCUMENTO (id_tipo_documento),
	CONSTRAINT fk_vendedores_domicilios FOREIGN KEY (id_domicilio)
		REFERENCES DOMICILIOS (id_domicilio)
)

CREATE TABLE TIPOS_TRANSMISION(
	id_tipo_transmision int identity (1,1),
	tipo_transmision varchar(50),
	CONSTRAINT pk_tipos_transmision PRIMARY KEY (id_tipo_transmision)
)

CREATE TABLE MARCAS_VEHICULO(
	id_marca_vehiculo int identity (1,1),
	marca_vehiculo varchar(50),
	CONSTRAINT pk_marcas_vehiculos PRIMARY KEY (id_marca_vehiculo)
)

CREATE TABLE MODELOS_VEHICULO(
	id_modelo_vehiculo int identity (1,1),
	modelo_vehiculo varchar(50),
	descripcion varchar (100),
	CONSTRAINT pk_modelos_vehiculo PRIMARY KEY (id_modelo_vehiculo)
)

CREATE TABLE SEGMENTOS_VEHICULO(
	id_segmento_vehiculo int identity (1,1),
	segmento_vehiculo varchar(50),
	CONSTRAINT pk_segmentos_vehiculo PRIMARY KEY (id_segmento_vehiculo)
)

CREATE TABLE ESTADOS_VEHICULO(
	id_estado_vehiculo int identity (1,1),
	estado_vehiculo varchar(50),
	CONSTRAINT pk_estados_vehiculo PRIMARY KEY (id_estado_vehiculo)
)

CREATE TABLE TIPOS_COMBUSTIBLE(
	id_tipo_combustible int identity (1,1),
	tipo_combustible varchar(50),
	CONSTRAINT pk_tipos_combustible PRIMARY KEY (id_tipo_combustible)
)

CREATE TABLE TIPOS_MONEDA(
	id_tipo_moneda int identity(1,1),
	tipo_moneda varchar(50),
	CONSTRAINT pk_tipos_moneda PRIMARY KEY (id_tipo_moneda)
)

CREATE TABLE VEHICULOS(
	id_vehiculo int identity (1,1),
	id_marca_vehiculo int,
	id_modelo_vehiculo int,
	id_segmento_vehiculo int,
	id_estado_vehiculo int,
	id_tipo_combustible int,
	id_tipo_transmision int,
	anio_fabricacion int,
	kilometros int,
	precio_compra numeric (18,2),
	precio_venta numeric (18,2),
	id_tipo_moneda int,
	observaciones varchar(100),
	CONSTRAINT id_vehiculo PRIMARY KEY (id_vehiculo),
	CONSTRAINT fk_vehiculos_marcas_vehiculo FOREIGN KEY (id_marca_vehiculo)
		REFERENCES MARCAS_VEHICULO (id_marca_vehiculo),
	CONSTRAINT fk_vehiculos_modelos_vehiculo FOREIGN KEY (id_modelo_vehiculo)
		REFERENCES MODELOS_VEHICULO (id_modelo_vehiculo),
	CONSTRAINT fk_vehiculos_segmento_vehiculo FOREIGN KEY (id_segmento_vehiculo)
		REFERENCES SEGMENTOS_VEHICULO (id_segmento_vehiculo),
	CONSTRAINT fk_vehiculos_estados_vehiculo FOREIGN KEY (id_estado_vehiculo)
		REFERENCES ESTADOS_VEHICULO (id_estado_vehiculo),
	CONSTRAINT fk_vehiculos_tipos_combustible FOREIGN KEY (id_tipo_combustible)
		REFERENCES TIPOS_COMBUSTIBLE (id_tipo_combustible),
	CONSTRAINT fk_vehiculos_tipos_transmision FOREIGN KEY (id_tipo_transmision)
		REFERENCES TIPOS_TRANSMISION (id_tipo_transmision),
	CONSTRAINT fk_vehiculos_tipos_moneda FOREIGN KEY (id_tipo_moneda)
		REFERENCES TIPOS_MONEDA (id_tipo_moneda)
)

CREATE TABLE HISTORIAL_PRECIOS(
	id_historial int identity(1,1),
	id_vehiculo int,
	precio numeric(18,2),
	id_tipo_moneda int,
	fecha_desde datetime,
	fecha_hasta datetime,
	CONSTRAINT pk_historial_precios PRIMARY KEY (id_historial),
	CONSTRAINT fk_historial_precios_vehiculos FOREIGN KEY (id_vehiculo)
		REFERENCES VEHICULOS (id_vehiculo),
	CONSTRAINT fk_historial_precios_tipos_moneda FOREIGN KEY (id_tipo_moneda)
		REFERENCES TIPOS_MONEDA (id_tipo_moneda)
)

CREATE TABLE FORMAS_PAGO(
	id_forma_pago int identity(1,1),
	forma_pago varchar(50),
	CONSTRAINT pk_formas_pago PRIMARY KEY (id_forma_pago)
)

CREATE TABLE FACTURAS(
	nro_factura int identity(1,1),
	id_cliente int,
	id_vendedor int,
	CONSTRAINT pk_facturas PRIMARY KEY (nro_factura),
	CONSTRAINT fk_facturas_clientes FOREIGN KEY (id_cliente)
		REFERENCES CLIENTES (id_cliente),
	CONSTRAINT fk_facturas_vendedores FOREIGN KEY (id_vendedor)
		REFERENCES VENDEDORES (id_vendedor)
)

CREATE TABLE DETALLE_FACTURAS(
	id_detalle_factura int identity(1,1),
	nro_factura int,
	id_vehiculo int,
	id_forma_pago int,
	precio numeric (18,2),
	id_tipo_moneda int,
	cantidad int,
	CONSTRAINT pk_detalle_facturas PRIMARY KEY (id_detalle_factura),
	CONSTRAINT fk_detalle_facturas_facturas FOREIGN KEY (nro_factura)
		REFERENCES FACTURAS (nro_factura),
	CONSTRAINT fk_detalle_facturas_precios_vehiculos FOREIGN KEY (id_vehiculo)
		REFERENCES VEHICULOS (id_vehiculo),
	CONSTRAINT fk_detalle_facturas_precios_tipos_moneda FOREIGN KEY (id_tipo_moneda)
		REFERENCES TIPOS_MONEDA (id_tipo_moneda),
	CONSTRAINT fk_detalle_facturas_formas_pago FOREIGN KEY (id_forma_pago)
		REFERENCES FORMAS_PAGO (id_forma_pago)
)

CREATE TABLE PRESUPUESTOS(
	id_presupuesto int identity(1,1),
	id_cliente int,
	id_vendedor int,
	CONSTRAINT pk_presupuestos PRIMARY KEY (id_presupuesto),
	CONSTRAINT fk_presupuestos_cliente FOREIGN KEY (id_cliente)
		REFERENCES CLIENTES (id_cliente),
	CONSTRAINT fk_presupuestos_vendedores FOREIGN KEY (id_vendedor)
		REFERENCES VENDEDORES (id_vendedor)
)

CREATE TABLE DETALLE_PRESUPUESTOS(
	id_detalle_presupuestos int identity(1,1),
	id_presupuesto int,
	id_vehiculo int,
	id_forma_pago int,
	precio numeric (18,2),
	id_tipo_moneda int,
	cantidad int,
	fecha datetime,
	fecha_vencimiento datetime,
	CONSTRAINT pk_detalle_presupuestos PRIMARY KEY (id_detalle_presupuestos),
	CONSTRAINT fk_detalle_presupuestos_precios_vehiculos FOREIGN KEY (id_vehiculo)
		REFERENCES VEHICULOS (id_vehiculo),
	CONSTRAINT fk_detalle_presupuestos_presupuestos FOREIGN KEY (id_presupuesto)
		REFERENCES PRESUPUESTOS (id_presupuesto),
	CONSTRAINT fk_detalle_presupuestos_precios_tipos_moneda FOREIGN KEY (id_tipo_moneda)
		REFERENCES TIPOS_MONEDA (id_tipo_moneda),
	CONSTRAINT fk_detalle_presupuestos_formas_pago FOREIGN KEY (id_forma_pago)
		REFERENCES FORMAS_PAGO (id_forma_pago)
)

CREATE TABLE SUCURSALES(
	id_sucursal int identity (1,1),
	id_domicilio int,
	sucursal varchar(50),
	CONSTRAINT pk_sucursales PRIMARY KEY (id_sucursal),
	CONSTRAINT fk_sucursales_domicilios FOREIGN KEY (id_domicilio)
		REFERENCES DOMICILIOS (id_domicilio)
)

CREATE TABLE STOCK(
	id_stock int identity (1,1),
	id_vehiculo int,
	stock int,
	stock_minimo int,
	CONSTRAINT pk_stock PRIMARY KEY (id_stock),
	CONSTRAINT fk_stock_vehiculos FOREIGN KEY (id_vehiculo)
		REFERENCES VEHICULOS  (id_vehiculo)
)

CREATE TABLE STOCK_SUCURSALES(
	id_stock_sucursal int identity (1,1),
	id_stock int,
	id_sucursal int,
	CONSTRAINT pk_stock_sucursales PRIMARY KEY (id_stock_sucursal),
	CONSTRAINT fk_stock_sucursales_stock FOREIGN KEY (id_stock)
		REFERENCES STOCK (id_stock),
	CONSTRAINT fk_stock_sucursales_sucursales FOREIGN KEY (id_sucursal)
		REFERENCES SUCURSALES (id_sucursal)
)

