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

CREATE TABLE TIPOS_MONEDA(
	id_tipo_moneda int identity(1,1),
	tipo_moneda varchar(50),
	CONSTRAINT pk_tipos_moneda PRIMARY KEY (id_tipo_moneda)
)

CREATE TABLE DETALLES_PRODUCTO(
	id_detalle_producto int identity(1,1),
	id_marca int,
	id_modelo int,
	id_segmento int,
	id_tipo_combustible int,
	id_tipo_transmision int,
	fecha_fabricacion datetime,
	CONSTRAINT pk_detalles_producto PRIMARY KEY (id_detalle_producto),
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

CREATE TABLE TIPOS_PRODUCTO(
	id_tipo_producto int identity (1,1),
	tipo_producto varchar (50),
	CONSTRAINT pk_tipos_producto PRIMARY KEY (id_tipo_producto)
)

CREATE TABLE PRODUCTOS(
	id_producto int identity (1,1),
	id_tipo_producto int,
	id_detalle_producto int,
	id_tipo_moneda int,
	descripcion varchar (100),
	precio_unitario numeric (18,2),
	stock int,
	stock_minimo int,
	CONSTRAINT pk_productos PRIMARY KEY (id_producto),
	CONSTRAINT fk_productos_tipo_productos FOREIGN KEY (id_tipo_producto)
		REFERENCES TIPOS_PRODUCTO (id_tipo_producto),
	CONSTRAINT fk_productos_detalles_producto FOREIGN KEY (id_detalle_producto)
		REFERENCES DETALLES_PRODUCTO (id_detalle_producto),
	CONSTRAINT fk_productos_tipos_moneda FOREIGN KEY (id_tipo_moneda)
		REFERENCES TIPOS_MONEDA (id_tipo_moneda)
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
	id_tipo_moneda int,
	precio numeric(18,2),
	fecha_desde datetime,
	fecha_hasta datetime,
	CONSTRAINT pk_historial_precios PRIMARY KEY (id_historial),
	CONSTRAINT fk_historial_precios_productos FOREIGN KEY (id_producto)
		REFERENCES PRODUCTOS (id_producto),
	CONSTRAINT fk_historial_precios_tipos_moneda FOREIGN KEY (id_tipo_moneda)
		REFERENCES TIPOS_MONEDA (id_tipo_moneda)
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
	fecha_pedido datetime,
	fecha_entrega datetime,
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
	id_tipo_responsable int,
	id_forma_pago int,
	id_orden_pedido int,
	fecha datetime,
	CONSTRAINT pk_facturas PRIMARY KEY (nro_factura),
	CONSTRAINT fk_facturas_clientes FOREIGN KEY (id_cliente)
		REFERENCES CLIENTES (id_cliente),
	CONSTRAINT fk_facturas_tipos_factura FOREIGN KEY (id_tipo_factura)
		REFERENCES TIPOS_FACTURA (id_tipo_factura),
	CONSTRAINT fk_facturas_tipos_responsables FOREIGN KEY (id_tipo_responsable)
		REFERENCES TIPOS_RESPONSABLE (id_tipo_responsable),
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
	id_tipo_moneda int,
	precio numeric(18,2),
	cantidad int,
	descuento numeric(18,2),
	CONSTRAINT pk_detalles_factura PRIMARY KEY (id_detalle_factura),
	CONSTRAINT fk_detalles_factura_facturas FOREIGN KEY (nro_factura)
		REFERENCES FACTURAS (nro_factura),
	CONSTRAINT fk_detalles_factura_productos FOREIGN KEY (id_producto)
		REFERENCES PRODUCTOS (id_producto),
	CONSTRAINT fk_detalles_factura_autoplanes FOREIGN KEY (id_autoplan)
		REFERENCES AUTOPLANES (id_autoplan),
	CONSTRAINT fk_detalles_factura_tipos_moneda FOREIGN KEY (id_tipo_moneda)
		REFERENCES TIPOS_MONEDA (id_tipo_moneda)
)
