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
	NUM_OPERACION 		NUMERIC(6,0) NOT NULL, -- Numero de operacion del cambio
	NUM_RECIBO  		NUMERIC(6,0) NOT NULL  -- Numero del recibo 
											   --  correspondiente al cambio

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CARGO(
	/* Descripcion de la tabla: 
		- Cargo del personal administrativo de la tienda.
	*/

	-- Atributos de la tabla: 
	NOMBRE 			VARCHAR(13) 	NOT NULL,  -- Nombre de la cargo
	SUELDO 			NUMERIC(8,2) 	NOT NULL   -- Sueldo base
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CATEGORIA(
	/* Descripcion de la tabla: 
		- Categoria de los vendedores de la tienda.
	*/

	-- Atributos de la tabla: 
	NUMERO 			VARCHAR(1) 		NOT NULL,   -- Numero de categoria de los vendedores.
	SUELDO_BASE		NUMERIC(8,2) 	NOT NULL 	-- Sueldo base de cada cargo.
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CLIENTE(
	/* Descripcion de la tabla: 
		- Cliente de la tienda.
	*/

	-- Atributos de la tabla: 
	CEDULA 			NUMERIC(8,0)	NOT NULL, -- Cedula de los clientes.
	DIRECCION		VARCHAR(50)		NOT NULL, -- Direccion de los clientes.
	EMAIL			VARCHAR(20)		NOT NULL  -- Email del cliente.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE NOMBRESCLIENTE(
	/* Descripcion de la tabla: 
		- Nombre de un cliente.
		- Atributo MULTIVALUADO de CLIENTE.
	*/

	-- Atributos de la tabla: 
	CEDULA_CLIENTE 	NUMERIC(8,0) NOT NULL   -- Cedula del cliente.
	NOMBRE 			VARCHAR(20)				-- Nombre del cliente.
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE APELLIDOSCLIENTE(
	/* Descripcion de la tabla: 
		- Apellido de un cliente.
		- Atributo MULTIVALUADO de CLIENTE.
	*/

	-- Atributos de la tabla: 
	CEDULA_CLIENTE  NUMERIC(8,0) NOT NULL   -- Cedula del cliente.
	APELLIDO 		VARCHAR(20) 			-- Apellidos del cliente.
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TELEFONOSCLIENTE(
	/* Descripcion de la tabla: 
		- Telefono de un cliente.
		- Atributo MULTIVALUADO de CLIENTE.
	*/

	-- Atributos de la tabla: 
	CEDULA_CLIENTE  NUMERIC(8,0)  NOT NULL, -- Cedula del cliente.
	TELEFONO		NUMERIC(11,0) NOT NULL  -- Telefonos del cliente.
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE COMPRA( 
	/* Descripcion de la tabla: 
		- Representa las compras realizadas por los clientes en la tienda.
		- Especializacion de la entidad OPERACION.
	*/

	-- Atributos de la tabla: 
	NUM_OPERACION  NUMERIC(6,0) NOT NULL, -- Numero de operacion de la compra.
	NUM_RECIBO 	   NUMERIC(6,0) NOT NULL  -- Numero de recibo correspondiente a la compra.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE DEPENDIENTE(
	/* Descripcion de la tabla: 
		- Dependientes de los empleados de la tienda.
	*/

	-- Atributos de la tabla: 
	POSTIZA_DEPENDIENTE	 	NUMERIC(8,0) 	NOT NULL, 	-- Clave postiza de los dependientes.
	CEDULA  				NUMERIC(8,0), 			  	-- Cedula de los dependientes.
	ASEGURADO 				BOOL 			NOT NULL, 	-- True si el dependiente esta asegurado y 
														--  False si no lo esta.
														
	PARENTESCO 				VARCHAR(10) 	NOT NULL, 	-- Prenteso con el empleado de la empresa.
	SEXO					CHAR 			NOT NULL, 	-- Sexo del dependiente.
	EDAD 					NUMERIC(3,0) 	NOT NULL, 	-- Edad del dependiente.
	MONTO_PRIMA 			NUMERIC(6,2) 	NOT NULL,	-- Monto de la prima correspondiente al dependiente
	
	RANGO_ETARIO_PRIMA 		VARCHAR(20) 	NOT NULL 	-- Rango etario del dependiente(clasificacion 
														-- en el monto de la prima).

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE NOMBRESDEPENDIENTE(
	/* Descripcion de la tabla: 
		- Nombre de un dependiente.
		- Atributo MULTIVALUADO de DEPENDIENTE.
	*/

	-- Atributos de la tabla: 
	POSTIZA_DEPENDIENTE 	NUMERIC(8,0)	NOT NULL, -- Clave postiza del depeniente (clave foranea).
	NOMBRE 					VARCHAR(20)		NOT NULL  -- Nombre del dependiente.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE APELLIDOSDEPENDIENTE(
	/* Descripcion de la tabla: 
		- Apellido de un dependiente.
		- Atributo MULTIVALUADO de DEPENDIENTE.
	*/

	-- Atributos de la tabla: 
	POSTIZA_DEPENDIENTE 	NUMERIC(8,0)	NOT NULL, -- Clave postiza del depeniente (clave foranea).
	APELLIDO 				VARCHAR(20)		NOT NULL  -- Apellido del dependiente.
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE EJEMPLAR(
	/* Descripcion de la tabla: 
		- Producto especifico que se encuentra en la tienda
	*/

	-- Atributos de la tabla: 
	NUM_INVENTARIO 			NUMERIC(6,0)	NOT NULL, -- Numero de inventario del ejemplar.
	PRECIO_LISTA			NUMERIC(8,2)	NOT NULL  -- Precio del ejemplar.
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE EMPLEADO(
	/* Descripcion de la tabla: 
		- Personas que trabajan en la tienda.
	*/

	-- Atributos de la tabla: 
	CEDULA 				NUMERIC(8,0)	NOT NULL, 	-- Cedula del empleado.
	DIRECCION			VARCHAR(50)		NOT NULL,	-- Direccion de habitacion del empleado.
	EMAIL				VARCHAR(25)		NOT NULL,	-- Email del empleado.
	FECHA_INGRESO 		DATE			NOT NULL 	-- Fecha de ingreso del empleado en la empres.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE NOMBRESEMPLEADO(
	/* Descripcion de la tabla:
		- Nombre de un empleado.
		- Atributo MULTIVALUADO de EMPLEADO.
	*/

	-- Atributos de la tabla: 
	CEDULA_EMPLEADO  	NUMERIC(8,0) 	NOT NULL, 	-- Cedula del empleado (clave foranea).
	NOMBRE 	 			VARCHAR(20)		NOT NULL	-- Nombre del empleado.
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE APELLIDOSEMPLEADO(
	/* Descripcion de la tabla: 
		- Apellido de un empleado.
		- Atributo MULTIVALUADO de EMPLEADO.
	*/

	-- Atributos de la tabla: 
	CEDULA_EMPLEADO 	NUMERIC(8,0)	NOT NULL,	--Cedula del empleado (clave foranea).
	APELLIDO 			VARCHAR(20)		NOT NULL	-- Apellido del empleado

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TELEFONOSEMPLEADOS(
	/* Descripcion de la tabla: 
		- Telefono de un empleado.
		- Atributo MULTIVALUADO de EMPLEADO.

	*/

	-- Atributos de la tabla: 
	CEDULA_EMPLEADO 	NUMERIC(8,0)  NOT NULL,	--Cedula del empleado (clave foranea).
	TELEFONO 			NUMERIC(11,0) NOT NULL	-- Telefono del empleado.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE FACTURA(
	/* Descripcion de la tabla: 
		- Documento legal generado al momento de realizar una
		transaccion comercial.
	*/

	-- Atributos de la tabla: 
	ID_NUMERO_FACTURA	NUMERIC(6,0) 	NOT NULL,	-- Numero de la factura
	ID_RIF_EMPRESA		VARCHAR(12)		NOT NULL	-- Rif de la empresa que emite la factura
	NUM_TARJETA			NUMERIC(16,0)			    -- Numero de la tarjeta 
													-- (en caso que de pague con tarjeta).
	CLAVE_CONF			NUMERIC(6,0)				-- Clave de confirmacion de la tarjet
													-- (en caso que de pague con tarjeta).
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE OPERACION(
	/* Descripcion de la tabla: 
		- Representa las posibles operaciones que se pueden
		realizar en la tienda.
	*/

	-- Atributos de la tabla: 
	NUM_OPERACION		NUMERIC(6,0)		NOT NULL,	-- Numero de la operacion.
	FECHA 				DATE				NOT NULL,	-- Fecha cuanto se relizo la operacion.
	CI_VENDEDOR 		NUMERIC(8,0)  		NOT NULL,	-- Ci del vendedor (clave foranea).
	POSTIZA_PAGO 		NUMERIC(6,0)		NOT NULL, 	-- Clave postiza de pago (clave foranea).
	CI_CLIENTE 			NUMERIC(8,0)  		NOT NULL	-- Ci del cliente.
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ORDEN(
	/* Descripcion de la tabla: 
		- Orden de compra realizada por la tienda a un proveedor para
		el rebastecimiento de su inventario.
	*/

	-- Atributos de la tabla: 
	NUMERO 				NUMERIC(6,0)		NOT NULL,	-- Numero de la orden.
	MONTO_TOTAL			NUMERIC(11,2)		NOT NULL,	-- Monto total de la orden.
	FECHA 				DATE				NOT NULL,	-- Fecha de emision de la orden.
	DESCRIPCION 		TEXT				NOT NULL,	-- Descripcion de la orden
	CANTIDAD_TOTAL 		NUMERIC(6,0) 		NOT NULL,	-- Cantidad de elementos pedidos en la orden.
	RIF_PROVEEDOR  		VARCHAR(12)			NOT NULL	-- Rif del proveedo al que se le pedira la orden.


);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PAGO(
	/* Descripcion de la tabla: 
		- Representa los pagos realizados en cada transaccion.
	*/

	-- Atributos de la tabla: 
	POSTIZA_PAGO 		NUMERIC(6,0) 	NOT NULL,	-- Clave postiza de pago.
	MODO 				VARCHAR(22)		NOT NULL,	-- Modo de pago.
	MONTO 				NUMERIC(8,2)	NOT NULL	-- Monto a pagar.
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PEDIDO(
	/* Descripcion de la tabla: 
		- Pedido despachado por un proveedor a la tienda.
		- Endidad debil de PROVEEDOR
	*/

	-- Atributos de la tabla: 
	NUM_PEDIDO			NUMERIC(6,0)		NOT NULL,	-- Numero del pedido.
	NUM_ENTREGA			NUMERIC(6,0)		NOT NULL,	-- Numero de entregas en el que se repartira el pedido.
	RIF_PROVEEDOR  		VARCHAR(12)			NOT NULL	-- Rif del proveedor que despachara el pedido.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PERSONALADMINISTRATIVO(
	/* Descripcion de la tabla: 
		- Representa al personal administrativo de la tienda.
		- Especializacoin de la entidad EMPLEADO.
	*/

	-- Atributos de la tabla: 
	CI_EMPLEADO  	NUMERIC(8,0)  	NOT NULL,	-- Ci del empleado.
	NOMBRE_CARGO  	VARCHAR(13)		NOT NULL	-- Cargo del empleado.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PRIMA(
	/* Descripcion de la tabla: 
		- Representa la tabla de primas utilizada para determinar
		la prima de cada dependiente asegurado.
	*/

	-- Atributos de la tabla: 
	MONTO 			NUMERIC(7,0) 	NOT NULL,	-- Monto de la prima
	RANGO_ETARIO 	VARCHAR(20) 	NOT NULL,	-- Rnago etario a clasificar
	SEXO			CHAR			NOT NULL	-- Parametro que funciona para 
												-- clasificar el monto de la prima.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PRODUCTO(
	/* Descripcion de la tabla: 
		- Representa el modelo de cada producto registrado en la tienda.
	*/

	-- Atributos de la tabla: 
	MARCA 					VARCHAR(20) 		NOT NULL,	-- Marca del produto.
	MODELO 					VARCHAR(20)			NOT NULL,	-- Modelos del producto.
	CATEGORIA 				VARCHAR(20)			NOT NULL,	-- Categoria del produto.
	ANHO_ELABORACION 		NUMERIC(4,0)		NOT NULL,	-- Anio de elaboracion del producto.
	NUM_EXISTENCIA 			NUMERIC(6,0)		NOT NULL,	-- Numero de existencia del producto.
	NIVEL_MINIMO			NUMERIC(6,0)		NOT NULL	-- Nivel minimo al que puede llegar
															-- el numero de elementos de un producto.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PRODUCTONUEVO(
	/* Descripcion de la tabla: 
		- Representa los productos nuevos de la tienda.
		- Especializacion de la entidad EJEMPLAR.
	*/

	-- Atributos de la tabla: 
	NUM_INVENTARIO  		NUMERIC(6,0) NOT NULL	-- Numero de inventario de un 
													-- producto nuevo

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PRODUCTOUSADO(
	/* Descripcion de la tabla: 
		- Representa los productos usados de la tienda.
		- Especializacion de la entidad EJEMPLAR.
	*/

	-- Atributos de la tabla: 
	NUM_INVENTARIO  		NUMERIC(6,0) NOT NULL	-- Numero de inventario de un 
													-- producto nuevo

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PROVEEDOR(
	/* Descripcion de la tabla: 
		- Empresas que proveen productos a la tienda.
	*/

	-- Atributos de la tabla: 
	RIF VARCHAR(12) NOT NULL	-- Rif del proveedor.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE RECIBO (
	/* Descripcion de la tabla: 
		- Comprobante recibido cuando se realiza una operacion
		de trueque en la tienda.
	*/

	-- Atributos de la tabla: 
	NUM_RECIBO 		NUMERIC(6,0)	NOT NULL	-- Numero del recibo.
	NUM_TARJETA		NUMERIC(16,0)				-- Numero de la tarjet de un cliente
												-- en caso que se pague con tarjeta.
												
	CLAVE_CONF 		NUMERIC(6,0)				-- Clave de confirmacion de la operacion
												-- realizada con la tarjeta.
	
);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE REMUNERACIONSABADO(
	/* Descripcion de la tabla: 
		- Remuneracion pagada por la tienda a los empleados por
		cada sabado trabajado.
	*/

	-- Atributos de la tabla: 
	MONTO 			NUMERIC(6,2)	NOT NULL	--Monto de la remuneracion de los sabados.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE VENDEDOR(
	/* Descripcion de la tabla: 
		- Represetna a los vendedores de la tienda.
		- Especializacion de la entidad EMPLEADO.
	*/

	-- Atributos de la tabla: 
	CI_VENDEDOR 		 NUMERIC(8,0) 	NOT NULL,	-- Ci del vendedor.
	COMISION			 NUMERIC(6,2)	NOT NULL,	-- Comision ganada por el vendedor.
	TURNO				 VARCHAR(20) 	NOT NULL,	-- Turno del vendedor.
	NUM_SABADO			 INT 			NOT NULL,	-- Numero de sabados tranajados por el vendedor.
	NUMERO_CATEGORIA 	 VARCHAR(1) 	NOT NULL	-- Numero de categoria del vendedor.


);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE VENTA(
	/* Descripcion de la tabla: 
		- Representa las ventas realizadas por los clientes hacia la tienda
		- Especializacion de la entidad OPERACION
	*/

	-- Atributos de la tabla: 
	NUM_OPERACION  		NUMERIC(6,0) 	NOT NULL,	-- Numero de la venta
	ID_NUMERO_FACTURA 	NUMERIC(6,0) 	NOT NULL, 	-- ID de la factura.
	ID_RIF_EMPRESA  	VARCHAR(12)		NOT NULL 	-- rif de la empresa que emite la venta.

);

------------------------------------------------------------------------------------------------------------------------
--                         					DEFINCION DE INTERRELACIONES                          				  	  --
------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ESDEPENDIENTE(
	/* Descripcion de la tabla: 
		- ES_DEPENDIENTE(V,E): El dependiente D es dependiente del empleado E.
	*/

	-- Atributos de la tabla: 
	POSTIZA_DEPENDIENTE  	NUMERIC(8,0)	NOT NULL,	-- Clave postiza del dependiente
	CI_EMPLEADO  			NUMERIC(8,0) 	NOT NULL	-- Ci del empleado

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PIDE(
	/* Descripcion de la tabla: 
		- PIDE(C,P): El cliente C pide el producto P.
	*/

	-- Atributos de la tabla: 
	MARCA_PRODUCTO 		VARCHAR(20) 		NOT NULL,  	-- Marca del producto.
	MODELO_PRODUCTO  	VARCHAR(20) 		NOT NULL, 	-- Modelo del producto.
	CI_CLIENTE   		NUMERIC(8,0) 		NOT NULL	-- Ci del cliente.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE SOLICITA(
	/* Descripcion de la tabla: 
		- ORDEN(O,P): La orden O solicida el producto P
	*/

	-- Atributos de la tabla: 
	NUM_ORDEN			NUMERIC(6,0)	NOT NULL, 	-- Numero de orden.
	MARCA_PRODUCTO  	VARCHAR(20)  	NOT NULL, 	-- Marca del producto.
	MODELO_PRODUCTO  	VARCHAR(20)		NOT NULL 	-- Modelo del producto.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TIENDAEFECTUA(
	/* Descripcion de la tabla: 
		- TIENDA_EFECTUA(CB,P1,P2): La tienda efectua un cambio CB entre dos productos usados P1 y P2
	*/

	-- Atributos de la tabla: 
	NUM_OPERACION 					NUMERIC(6,0) NOT NULL, 	-- Numero de operacion
	NUM_INVENTARIO_EJEMPLAR_1 		NUMERIC(6,0) NOT NULL,	-- Numero de inventario del producto1
	NUM_INVENTARIO_EJEMPLAR_2 		NUMERIC(6,0) NOT NULL	-- Numero de inventario del producto1


);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TIENDAEJECUTA(
	/* Descripcion de la tabla: 
		- TIENDA_EJECUTA(V,E): LA tienda ejecuta una venta V del ejemplar E.
	*/

	-- Atributos de la tabla: 
	NUM_OPERACION 				NUMERIC(6,0) NOT NULL,	-- Numero de operacion
	NUM_INVENTARIO_EJEMPLAR 	NUMERIC(6,0) NOT NULL	-- Numero de inventario del ejemplar

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TIENDAPAGA(
	/* Descripcion de la tabla:
		- TIENDA_PAGA(PA,PR): La tienda para con el pago PA al proveedor PR 
	*/

	-- Atributos de la tabla: 
	POSTIZA_PAGO 		NUMERIC(6,0) 	NOT NULL,	-- Clave postiza de pago.
	RIF_PROVEEDOR 		VARCHAR(12)		NOT NULL	-- Rif del proveedor.

);

------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TIENDAREALIZA(
	/* Descripcion de la tabla: 
		- TIENDA_REALIZA(CO,P): La tienda realiza una compra CO del producto usado P
	*/

	-- Atributos de la tabla: 	
	NUM_OPERACION  		NUMERIC(6,0) NOT NULL,	-- Numero de operacion
	NUM_INVENTARIO 		NUMERIC(6,0) NOT NULL	-- Numero de inventario

);

------------------------------------------------------------------------------------------------------------------------
--                         					FIN DE LAS DEFINICION DE TABLAS                            				  --
------------------------------------------------------------------------------------------------------------------------
