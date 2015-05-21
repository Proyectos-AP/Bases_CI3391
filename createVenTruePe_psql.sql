/*
* Universidad Simon Bolivar
* Departamento de Computacion y Tecnologia de la Informacion
* Laboratorio de Bases de Datos I (CI3391)
* Nombres: 
*	Alejandra Cordero / Carnet: 12-10645 
*	Pablo Maldonado   / Carnet: 12-10561
*
* Archivo: createVenTruePe_psql.sql
*
* Descripcion: Script que crea las tablas a utilizar en la Base de Datos de la mega-tienda de Muebles VenTruePe
*
* Ultima modificacion: 22/05/2015
*
*/

------------------------------------------------------------------------------------------------------------------------
--                   DEFINICION DE ENTIDADES (SE INCLUYEN AQUELLAS QUE ABSORBIERON INTERRELACIONES)  				  --
------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CAMBIO(
	/* Descripcion de la tabla: 
		- Representa los trueques realizados entre un cliente y la tienda.
		- Especializacion de la entidad OPERACION. 
	*/

	-- Atributos de la tabla: 
	NUM_OPERACION 		NUMERIC(6,0) NOT NULL, -- 
	NUM_RECIBO  		NUMERIC(6,0) NOT NULL  -- 

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CARGO(
	/* Descripcion de la tabla: 
		- Cargo del personal administrativo de la tienda.
	*/

	-- Atributos de la tabla: 
	NOMBRE 			VARCHAR(13) 	NOT NULL,  -- SE PUEDE DECIR QUE SON 13 POR EL CARGO DE SECRETARIA
	SUELDO 			NUMERIC(8,2) 	NOT NULL   -- explicar la precision
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CATEGORIA(
	/* Descripcion de la tabla: 
		- Categoria de los vendedores de la tienda.
	*/

	-- Atributos de la tabla: 
	NUMERO 			VARCHAR(2) 		NOT NULL,   --
	SUELDO_BASE		NUMERIC(8,2) 	NOT NULL 	-- REAL POSITIVO
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CLIENTE(
	/* Descripcion de la tabla: 
		- Cliente de la tienda.
	*/

	-- Atributos de la tabla: 
	CEDULA 			NUMERIC(8,0)	NOT NULL, --
	DIRECCION		VARCHAR(50)		NOT NULL, --
	EMAIL			VARCHAR(20)		NOT NULL  -- revisar si hay tipo para email

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE NOMBRESCLIENTE(
	/* Descripcion de la tabla: 
		- Nombre de un cliente.
		- Atributo MULTIVALUADO de CLIENTE.

	*/

	-- Atributos de la tabla: 
	CEDULA_CLIENTE 	NUMERIC(8,0) NOT NULL,  --
	NOMBRE 			VARCHAR(20)				--
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE APELLIDOSCLIENTE(
	/* Descripcion de la tabla: 
		- Apellido de un cliente.
		- Atributo MULTIVALUADO de CLIENTE.

	*/

	-- Atributos de la tabla: 
	CEDULA_CLIENTE  NUMERIC(8,0) NOT NULL,  --
	APELLIDO 		VARCHAR(20) 			--
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TELEFONOSCLIENTE(
	/* Descripcion de la tabla: 
		- Telefono de un cliente.
		- Atributo MULTIVALUADO de CLIENTE.
	*/

	-- Atributos de la tabla: 
	CEDULA_CLIENTE  NUMERIC(8,0)  NOT NULL, --
	TELEFONO		NUMERIC(11,0) NOT NULL  --
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE COMPRA( 
	/* Descripcion de la tabla: 
		- Representa las compras realizadas por los clientes en la tienda.
		- Especializacion de la entidad OPERACION.
	*/

	-- Atributos de la tabla: 
	NUM_OPERACION  NUMERIC(6,0) NOT NULL, --
	NUM_RECIBO 	   NUMERIC(6,0) NOT NULL  --

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE DEPENDIENTE(
	/* Descripcion de la tabla: 
		- Dependientes de los empleados de la tienda.
	*/

	-- Atributos de la tabla: 
	POSTIZA_DEPENDIENTE	 	NUMERIC(8,0) 	NOT NULL, 	--
	CEDULA  				NUMERIC(8,0), 			  	--
	ASEGURADO 				BOOL 			NOT NULL, 	--
	PARENTESCO 				VARCHAR 		NOT NULL, 	--
	SEXO					CHAR 			NOT NULL, 	-- INDICAR RESTRICCION EXPLICITA EL SEXO 
	EDAD 					NUMERIC(3,0) 	NOT NULL, 	--
	MONTO_PRIMA 			NUMERIC(6,2) 	NOT NULL,	--
	RANGO_ETARIO_PRIMA 		VARCHAR(20) 	NOT NULL, 	--
	SEXO_PRIMA				CHAR			NOT NULL,	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE NOMBRESDEPENDIENTE(
	/* Descripcion de la tabla: 
		- Nombre de un dependiente.
		- Atributo MULTIVALUADO de DEPENDIENTE.
	*/

	-- Atributos de la tabla: 
	POSTIZA_DEPENDIENTE 	NUMERIC(8,0)	NOT NULL, -- (COMO SE ORDENAN LOS NOMBRES?)
	NOMBRE 					VARCHAR(20)		NOT NULL  --

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE APELLIDOSDEPENDIENTE(
	/* Descripcion de la tabla: 
		- Apellido de un dependiente.
		- Atributo MULTIVALUADO de DEPENDIENTE.
	*/

	-- Atributos de la tabla: 
	POSTIZA_DEPENDIENTE 	NUMERIC(8,0)	NOT NULL, -- es foranea
	APELLIDO 				VARCHAR(20)		NOT NULL  --
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE EJEMPLAR(
	/* Descripcion de la tabla: 
		- Producto especifico que se encuentra en la tienda
	*/

	-- Atributos de la tabla: 
	NUM_INVENTARIO 			NUMERIC(6,0)	NOT NULL, --
	PRECIO_LISTA			NUMERIC(8,2)	NOT NULL  --
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE EMPLEADO(
	/* Descripcion de la tabla: 
		- Personas que trabajan en la tienda.
	*/

	-- Atributos de la tabla: 
	CEDULA 				NUMERIC(8,0)	NOT NULL, 	-- ESPECIFICAR PORQUE 8 
	DIRECCION			VARCHAR			NOT NULL,	--
	EMAIL				VARCHAR			NOT NULL,	--
	FECHA_INGRESO 		DATE			NOT NULL 	-- SE PODRIA VERIFICAR ALGO DE FECHA?

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE NOMBRESEMPLEADO(
	/* Descripcion de la tabla:
		- Nombre de un empleado.
		- Atributo MULTIVALUADO de EMPLEADO.
	*/

	-- Atributos de la tabla: 
	CEDULA_EMPLEADO  	NUMERIC(8,0) 	NOT NULL, 	--
	NOMBRE 	 			VARCHAR(20)		NOT NULL	--
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE APELLIDOSEMPLEADO(
	/* Descripcion de la tabla: 
		- Apellido de un empleado.
		- Atributo MULTIVALUADO de EMPLEADO.
	*/

	-- Atributos de la tabla: 
	CEDULA_EMPLEADO 	NUMERIC(8,0)	NOT NULL,	--
	APELLIDO 			VARCHAR(20)		NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TELEFONOSEMPLEADOS(
	/* Descripcion de la tabla: 
		- Telefono de un empleado.
		- Atributo MULTIVALUADO de EMPLEADO.

	*/

	-- Atributos de la tabla: 
	CEDULA_EMPLEADO 	NUMERIC(8,0)  NOT NULL,	--
	TELEFONO 			NUMERIC(11,0) NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE FACTURA(
	/* Descripcion de la tabla: 
		- Documento legal generado al momento de realizar una
		transaccion comercial.
	*/

	-- Atributos de la tabla: 
	ID_NUMERO_FACTURA	NUMERIC(6,0) 	NOT NULL,	--
	ID_RIF_EMPRESA		VARCHAR(12)		NOT NULL,	--
	NUM_TARJETA			NUMERIC(16,0)	NOT NULL,	--
	CLAVE_CONF			NUMERIC(6,0)	NOT NULL	--
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE OPERACION(
	/* Descripcion de la tabla: 
		- Representa las posibles operaciones que se pueden
		realizar en la tienda.
	*/

	-- Atributos de la tabla: 
	NUM_OPERACION		NUMERIC(6,0)		NOT NULL,	--
	FECHA 				DATE				NOT NULL,	--
	CI_VENDEDOR 		NUMERIC(8,0)  		NOT NULL,	--
	POSTIZA_PAGO 		NUMERIC(6,0)		NOT NULL, 	-- (ARREGLAR NOMBRE EN EL LIBRE OFFFICE)
	CI_CLIENTE 			NUMERIC(8,0)  		NOT NULL	--
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ORDEN(
	/* Descripcion de la tabla: 
		- Orden de compra realizada por la tienda a un proveedor para
		el rebastecimiento de su inventario.
	*/

	-- Atributos de la tabla: 
	NUMERO 				NUMERIC(6,0)		NOT NULL,	--
	MONTO_TOTAL			NUMERIC(11,2)		NOT NULL,	--
	FECHA 				DATE				NOT NULL,	--
	DESCRIPCION 		VARCHAR(200)		NOT NULL,	-- es tipo texto
	CANTIDAD_TOTAL 		NUMERIC 			NOT NULL,	--
	RIF_PROVEEDOR  		VARCHAR(12)			NOT NULL	--


);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PAGO(
	/* Descripcion de la tabla: 
		- Representa los pagos realizados en cada transaccion.
	*/

	-- Atributos de la tabla: 
	POSTIZA_PAGO 		NUMERIC(6,0) 	NOT NULL,	--
	MODO 				VARCHAR(22)		NOT NULL,	--
	MONTO 				NUMERIC(8,2)	NOT NULL	--
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PEDIDO(
	/* Descripcion de la tabla: 
		- Pedido despachado por un proveedor a la tienda.
		- Endidad debil de PROVEEDOR
	*/

	-- Atributos de la tabla: 
	NUM_PEDIDO			NUMERIC(6,0)		NOT NULL,	--
	NUM_ENTREGA			NUMERIC(6,0)		NOT NULL,	--
	RIF_PROVEEDOR  		VARCHAR(12)			NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PERSONALADMINISTRATIVO(
	/* Descripcion de la tabla: 
		- Representa al personal administrativo de la tienda.
		- Especializacoin de la entidad EMPLEADO.
	*/

	-- Atributos de la tabla: 
	CI_EMPLEADO  	NUMERIC(8,0)  	NOT NULL,	--
	NOMBRE_CARGO  	VARCHAR(13)		NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PRIMA(
	/* Descripcion de la tabla: 
		- Representa la tabla de primas utilizada para determinar
		la prima de cada dependiente asegurado.
	*/

	-- Atributos de la tabla: 
	MONTO 			NUMERIC(7,0) 	NOT NULL,	--
	RANGO_ETARIO 	VARCHAR(20) 	NOT NULL,	-- hace falta agregar las cosas de dominio
	SEXO			CHAR			NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PRODUCTO(
	/* Descripcion de la tabla: 
		- Representa el modelo de cada producto registrado en la tienda.
	*/

	-- Atributos de la tabla: 
	MARCA 					VARCHAR(20) 		NOT NULL,	--
	MODELO 					VARCHAR(20)			NOT NULL,	--
	CATEGORIA 				VARCHAR(20)			NOT NULL,	--
	ANHO_ELABORACION 		NUMERIC(4,0)		NOT NULL,	--
	NUM_EXISTENCIA 			NUMERIC(6,0)		NOT NULL,	--
	NIVEL_MINIMO			NUMERIC(6,0)		NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PRODUCTONUEVO(
	/* Descripcion de la tabla: 
		- Representa los productos nuevos de la tienda.
		- Especializacion de la entidad EJEMPLAR.
	*/

	-- Atributos de la tabla: 
	NUM_INVENTARIO  		NUMERIC(6,0) NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PRODUCTOUSADO(
	/* Descripcion de la tabla: 
		- Representa los productos usados de la tienda.
		- Especializacion de la entidad EJEMPLAR.
	*/

	-- Atributos de la tabla: 
	NUM_INVENTARIO  		NUMERIC(6,0) NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PROVEEDOR(
	/* Descripcion de la tabla: 
		- Empresas que proveen productos a la tienda.
	*/

	-- Atributos de la tabla: 
	RIF VARCHAR(12) NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE RECIBO (
	/* Descripcion de la tabla: 
		- Comprobante recibido cuando se realiza una operacion
		de trueque en la tienda.
	*/

	-- Atributos de la tabla: 
	NUM_RECIBO 		NUMERIC(6,0)	NOT NULL,	--
	NUM_TARJETA		NUMERIC(16,0)	NOT NULL,	--
	CLAVE_CONF 		NUMERIC(6,0)	NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE REMUNERACIONSABADO(
	/* Descripcion de la tabla: 
		- Remuneracion pagada por la tienda a los empleados por
		cada sabado trabajado.
	*/

	-- Atributos de la tabla: 
	MONTO 			NUMERIC(6,2)	NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE VENDEDOR(
	/* Descripcion de la tabla: 
		- Represetna a los vendedores de la tienda.
		- Especializacion de la entidad EMPLEADO.
	*/

	-- Atributos de la tabla: 
	CI_VENDEDOR 		 NUMERIC(8,0) 	NOT NULL,	-- ARREGLAR EN EL LIBREOFFICE ESTO ES FORANEO 
	COMISION			 NUMERIC(6,2)	NOT NULL,	--
	TURNO				 VARCHAR(20) 	NOT NULL,	--
	NUM_SABADO			 INT 			NOT NULL,	--
	NOMBRE_CATEGORIA 	 VARCHAR(20)	NOT NULL	--REVISAR COMO ES QUE SE LLAMA LA FORANEA  -- es foranea


);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE VENTA(
	/* Descripcion de la tabla: 
		- Representa las ventas realizadas por los clientes hacia la tienda
		- Especializacion de la entidad OPERACION
	*/

	-- Atributos de la tabla: 
	NUM_OPERACION  		NUMERIC(6,0) 	NOT NULL,	--
	ID_NUMERO_FACTURA 	NUMERIC(6,0) 	NOT NULL, 	-- es foranea
	ID_RIF_EMPRESA  	VARCHAR(12)		NOT NULL 	-- es foranea (VAN JUNTAS LAS DOS ULTIMAS)

);

------------------------------------------------------------------------------------------------------------------------
--                         					DEFINCION DE INTERRELACIONES                          				  	  --
------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ESDEPENDIENTE(
	/* Descripcion de la tabla: 
		- ES_DEPENDIENTE(V,E): El dependiente D es dependiente del empleado E.
	*/

	-- Atributos de la tabla: 
	POSTIZA_DEPENDIENTE  	NUMERIC(8,0)	NOT NULL,	--
	CI_EMPLEADO  			NUMERIC(8,0) 	NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PIDE(
	/* Descripcion de la tabla: 
		- PIDE(C,P): El cliente C pide el producto P.
	*/

	-- Atributos de la tabla: 
	MARCA_PRODUCTO 		VARCHAR(20) 		NOT NULL,  	-- es foranea
	MODELO_PRODUCTO  	VARCHAR(20) 		NOT NULL, 	-- es foranea (VAN JUNTAS A PRODUCTO)
	CI_CLIENTE   		NUMERIC(8,0) 		NOT NULL

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE SOLICITA(
	/* Descripcion de la tabla: 
		- ORDEN(O,P): La orden O solicida el producto P
	*/

	-- Atributos de la tabla: 
	NUM_ORDEN			NUMERIC(6,0)	NOT NULL, 	-- tambien es foranea?
	MARCA_PRODUCTO  	VARCHAR(20)  	NOT NULL, 	-- es foranea
	MODELO_PRODUCTO  	VARCHAR(20)		NOT NULL 	-- es foranea (VAN JUNTAS A PRODUCTO)

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TIENDAEFECTUA(
	/* Descripcion de la tabla: 
		- TIENDA_EFECTUA(CB,P1,P2): La tienda efectua un cambio CB entre dos productos usados P1 y P2
	*/

	-- Atributos de la tabla: 
	NUM_OPERACION 					NUMERIC(6,0) NOT NULL, 	--	
	NUM_INVENTARIO_EJEMPLAR_1 		NUMERIC(6,0) NOT NULL,	--
	NUM_INVENTARIO_EJEMPLAR_2 		NUMERIC(6,0) NOT NULL	--


);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TIENDAEJECUTA(
	/* Descripcion de la tabla: 
		- TIENDA_EJECUTA(V,E): LA tienda ejecuta una venta V del ejemplar E.
	*/

	-- Atributos de la tabla: 
	NUM_OPERACION 				NUMERIC(6,0) NOT NULL,	--
	NUM_INVENTARIO_EJEMPLAR 	NUMERIC(6,0) NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TIENDAPAGA(
	/* Descripcion de la tabla:
		- TIENDA_PAGA(PA,PR): La tienda para con el pago PA al proveedor PR 
	*/

	-- Atributos de la tabla: 
	POSTIZA_PAGO 		NUMERIC(6,0) 	NOT NULL,	--
	RIF_PROVEEDOR 		VARCHAR(12)		NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TIENDAREALIZA(
	/* Descripcion de la tabla: 
		- TIENDA_REALIZA(CO,P): La tienda realiza una compra CO del producto usado P
	*/

	-- Atributos de la tabla: 	
	NUM_OPERACION  		NUMERIC(6,0) NOT NULL,	--
	NUM_INVENTARIO 		NUMERIC(6,0) NOT NULL	--

);

------------------------------------------------------------------------------------------------------------------------
--                         					FIN DE LAS DEFINICION DE TABLAS                            				  --
------------------------------------------------------------------------------------------------------------------------