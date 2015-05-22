/*
* Universidad Simon Bolivar
* Departamento de Computacion y Tecnologia de la Informacion
* Laboratorio de Bases de Datos I (CI3391)
* Nombres: 
*	Alejandra Cordero / Carnet: 12-10645
*	Pablo Maldonado   / Carnet: 12-10561
*
* Archivo: constraintsVenTruePe_psql.sql
*
* Descripcion: Script que carga las restricciones explicitas
* de la Base de Datos de la mega-tienda de muebles VenTruePe
*
* Ultima modificacion: 22/05/2015
*
*/

-- nota ORDENAR EN ORDEN ALFABETICO 


------------------------------------------------------------------------------------------------------------------------
--                       	  				RESTRICCIONES DE CLAVES PRIMARIAS		                        		  --
------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CAMBIO
	ADD CONSTRAINT PK_CAMBIO PRIMARY KEY (NUM_OPERACION)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CARGO
	ADD CONSTRAINT PK_CARGO PRIMARY KEY (NOMBRE)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CATEGORIA 
	ADD CONSTRAINT PK_CATEGORIA PRIMARY KEY (NUMERO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CLIENTE
	ADD CONSTRAINT PK_CLIENTE PRIMARY KEY (CEDULA_IDENT)
;  

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESCLIENTE 
	ADD CONSTRAINT PK_NOMBRESCLIENTE PRIMARY KEY (CEDULA_CLIENTE,NOMBRE)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSCLIENTE
	ADD CONSTRAINT PK_APELLIDOSCLIENTE PRIMARY KEY (CEDULA_CLIENTE,APELLIDO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TELEFONOSCLIENTE
	ADD CONSTRAINT PK_TELEFONOSCLIENTE PRIMARY KEY (CEDULA_CLIENTE,TELEFONO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE COMPRA
	ADD CONSTRAINT PK_COMPRA PRIMARY KEY (NUM_OPERACION)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE DEPENDIENTE
	ADD CONSTRAINT PK_DEPENDIENTE PRIMARY KEY (POSTIZA_DEPENDIENTE)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESDEPENDIENTE
	ADD CONSTRAINT PK_NOMBRESDEPENDIENTE PRIMARY KEY (POSTIZA_DEPENDIENTE,NOMBRE)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSDEPENDIENTE
	ADD CONSTRAINT PK_APELLIDOSDEPENDIENTE PRIMARY KEY (POSTIZA_DEPENDIENTE,APELLIDO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE EJEMPLAR
	ADD CONSTRAINT PK_EJEMPLAR PRIMARY KEY (NUM_INVENTARIO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE EMPLEADO 
	ADD CONSTRAINT PK_EMPLEADO PRIMARY KEY (CEDULA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESEMPLEADO 
	ADD CONSTRAINT PK_NOMBRESEMPLEADO PRIMARY KEY (CEDULA_EMPLEADO,NOMBRE)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSEMPLEADO
	ADD CONSTRAINT PK_APELLIDOSEMPLEADO PRIMARY KEY (CEDULA_EMPLEADO,APELLIDO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TELEFONOSEMPLEADO
	ADD CONSTRAINT PK_TELEFONOSEMPLEADO PRIMARY KEY (CEDULA_EMPLEADO,TELEFONO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE FACTURA
	ADD CONSTRAINT PK_FACTURA PRIMARY KEY (ID_NUMERO_FACTURA,ID_RIF_EMPRESA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE OPERACION
	ADD CONSTRAINT PK_OPERACION PRIMARY KEY (NUM_OPERACION)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ORDEN 
	ADD CONSTRAINT PK_ORDEN PRIMARY KEY (NUMERO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PAGO
	ADD CONSTRAINT PK_PAGO PRIMARY KEY (POSTIZA_PAGO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PEDIDO
	ADD CONSTRAINT PK_PEDIDO PRIMARY KEY (NUM_PEDIDO,RIF_PROVEEDOR)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PERSONALADMINISTRATIVO
	ADD CONSTRAINT  PK_PERSONALADMINISTRATIVO PRIMARY KEY (CI_EMPLEADO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRIMA
	ADD CONSTRAINT  PK_PRIMA PRIMARY KEY (MONTO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTO
	ADD CONSTRAINT  PK_PRODUCTO PRIMARY KEY (MARCA,MODELO)
;


------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTONUEVO
	ADD CONSTRAINT  PK_PRODUCTONUEVO PRIMARY KEY (NUM_INVENTARIO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTOUSADO
	ADD CONSTRAINT  PK_PRODUCTOUSADO PRIMARY KEY (NUM_INVENTARIO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PROVEEDOR
	ADD CONSTRAINT PK_PROVEEDOR PRIMARY KEY (RIF)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE RECIBO
	ADD CONSTRAINT  PK_RECIBO PRIMARY KEY (NUM_RECIBO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE REMUNERACIONSABADO
	ADD CONSTRAINT  PK_REMUNERACIONSABADO PRIMARY KEY (MONTO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE VENDEDOR 
	ADD CONSTRAINT PK_VENDEDOR PRIMARY KEY (CI_VENDEDOR)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE VENTA
	ADD CONSTRAINT PK_VENTA PRIMARY KEY (NUM_OPERACION)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ESDEPENDIENTE
	ADD CONSTRAINT PK_ESDEPENDIENTE PRIMARY KEY (POSTIZA_DEPENDIENTE,CI_EMPLEADO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PIDE
	ADD CONSTRAINT PK_PIDE PRIMARY KEY (MARCA_PRODUCTO,MODELO_PRODUCTO,CI_CLIENTE)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE SOLICITA 
	ADD CONSTRAINT  PK_SOLICITA PRIMARY KEY (NUM_ORDEN,MARCA_PRODUCTO,MODELO_PRODUCTO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAEFECTUA
	ADD CONSTRAINT PK_TIENDAEFECTUA PRIMARY KEY (NUM_OPERACION,NUM_INVENTARIO_EJEMPLAR_1,NUM_INVENTARIO_EJEMPLAR_2)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAEJECUTA
	ADD CONSTRAINT PK_TIENDAEJECUTA PRIMARY KEY (NUM_OPERACION,NUM_INVENTARIO_EJEMPLAR)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAPAGA
	ADD CONSTRAINT  PK_TIENDAPAGA PRIMARY KEY (POSTIZA_PAGO,RIF_PROVEEDOR)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAREALIZA
	ADD CONSTRAINT PK_TIENDAREALIZA PRIMARY KEY (NUM_OPERACION,NUM_INVENTARIO)
;

------------------------------------------------------------------------------------------------------------------------
--                       	  				RESTRICCIONES DE CLAVES FORANEAS		                        		  --
------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CAMBIO
	ADD CONSTRAINT FK_CAMBIO_OPERACION FOREIGN KEY (NUM_OPERACION) REFERENCES OPERACION(NUM_OPERACION),
	ADD CONSTRAINT FK_CAMBIO_RECIBO FOREIGN KEY (NUM_RECIBO) REFERENCES RECIBO(NUM_RECIBO) 
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESCLIENTE 
	ADD CONSTRAINT FK_NOMBRESCLIENTE_CLIENTE FOREIGN KEY (CEDULA_CLIENTE) REFERENCES CLIENTE(CEDULA_IDENT)

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSCLIENTE
	ADD CONSTRAINT FK_APELLIDOSCLIENTE_CLIENTE FOREIGN KEY (CEDULA_CLIENTE) REFERENCES CLIENTE(CEDULA_IDENT)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TELEFONOSCLIENTE
	ADD CONSTRAINT FK_TELEFONOSCLIENTE_CLIENTE FOREIGN KEY (CEDULA_CLIENTE) REFERENCES CLIENTE(CEDULA_IDENT)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE COMPRA 
	ADD CONSTRAINT FK_COMPRA_OPERACION FOREIGN KEY (NUM_OPERACION) REFERENCES OPERACION(NUM_OPERACION),
	ADD CONSTRAINT FK_COMPRA_RECIBO FOREIGN KEY (NUM_RECIBO) REFERENCES RECIBO(NUM_RECIBO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESDEPENDIENTE
	ADD CONSTRAINT FK_NOMBRESDEPENDIENTE_DEPENDIENTE 
	FOREIGN KEY (POSTIZA_DEPENDIENTE) REFERENCES DEPENDIENTE(POSTIZA_DEPENDIENTE)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSDEPENDIENTE
	ADD CONSTRAINT FK_APELLIDOSDEPENDIENTE_DEPENDIENTE 
	FOREIGN KEY (POSTIZA_DEPENDIENTE) REFERENCES DEPENDIENTE(POSTIZA_DEPENDIENTE)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESEMPLEADO 
	ADD CONSTRAINT FK_NOMBRESEMPLEADO_EMPLEADO FOREIGN KEY (CEDULA_EMPLEADO) REFERENCES EMPLEADO(CEDULA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSEMPLEADO
	ADD CONSTRAINT FK_APELLIDOSEMPLEADO_EMPLEADO FOREIGN KEY (CEDULA_EMPLEADO) REFERENCES EMPLEADO(CEDULA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TELEFONOSEMPLEADO
	ADD CONSTRAINT FK_TELEFONOSEMPLEADO_EMPLEADO FOREIGN KEY (CEDULA_EMPLEADO) REFERENCES EMPLEADO(CEDULA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE OPERACION
	ADD CONSTRAINT FK_OPERACION_VENDEDOR FOREIGN KEY (CI_VENDEDOR) REFERENCES VENDEDOR(CI_VENDEDOR),
	ADD CONSTRAINT FK_OPERACION_CLIENTE FOREIGN KEY (CI_CLIENTE) REFERENCES CLIENTE(CEDULA_IDENT),
	ADD CONSTRAINT FK_OPERACION_PAGO FOREIGN KEY (POSTIZA_PAGO) REFERENCES PAGO(POSTIZA_PAGO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ORDEN
	ADD CONSTRAINT FK_ORDEN_PROVEEDOR FOREIGN KEY (RIF_PROVEEDOR) REFERENCES PROVEEDOR(RIF)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PEDIDO 
	ADD CONSTRAINT FK_PEDIDO_PROVEEDOR FOREIGN KEY (RIF_PROVEEDOR) REFERENCES PROVEEDOR(RIF)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PERSONALADMINISTRATIVO
	ADD CONSTRAINT FK_PERSONALADMINISTRATIVO_EMPLEADO FOREIGN KEY (CI_EMPLEADO) REFERENCES EMPLEADO(CEDULA),
	ADD CONSTRAINT FK_PERSONALADMINISTRATIVO_CARGO FOREIGN KEY (NOMBRE_CARGO) REFERENCES CARGO(NOMBRE)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTONUEVO
	ADD CONSTRAINT FK_PRODUCTONUEVO_EJEMPLAR FOREIGN KEY (NUM_INVENTARIO) REFERENCES EJEMPLAR(NUM_INVENTARIO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTOUSADO
	ADD CONSTRAINT FK_PRODUCTOUSADO_EJEMPLAR FOREIGN KEY (NUM_INVENTARIO) REFERENCES EJEMPLAR(NUM_INVENTARIO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE VENTA
	ADD CONSTRAINT FK_VENTA_OPERACION FOREIGN KEY (NUM_OPERACION) REFERENCES OPERACION(NUM_OPERACION)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ESDEPENDIENTE
	ADD CONSTRAINT FK_ESDEPENDIENTE_DEPENDIENTE 
		FOREIGN KEY (POSTIZA_DEPENDIENTE) REFERENCES DEPENDIENTE(POSTIZA_DEPENDIENTE),
	ADD CONSTRAINT FK_ESDEPENDIENTE_EMPLEADO FOREIGN KEY (CI_EMPLEADO) REFERENCES EMPLEADO(CEDULA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PIDE
	ADD CONSTRAINT FK_PIDE_CLIENTE FOREIGN KEY (CI_CLIENTE) REFERENCES CLIENTE(CEDULA_IDENT)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAEFECTUA 
	ADD CONSTRAINT FK_TIENDAEFECTUA_OPERACION 
		FOREIGN KEY (NUM_OPERACION) REFERENCES CAMBIO(NUM_OPERACION),
	ADD CONSTRAINT FK1_TIENDAEFECTUA_PRODUCTOUSADO 
		FOREIGN KEY (NUM_INVENTARIO_EJEMPLAR_1) REFERENCES PRODUCTOUSADO(NUM_INVENTARIO),
	ADD CONSTRAINT FK2_TIENDAEFECTUA_PRODUCTOUSADO 
		FOREIGN KEY (NUM_INVENTARIO_EJEMPLAR_2) REFERENCES PRODUCTOUSADO(NUM_INVENTARIO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAEJECUTA
	ADD CONSTRAINT  FK_TIENDAEJECUTA_OPERACION FOREIGN KEY (NUM_OPERACION) REFERENCES VENTA(NUM_OPERACION),
	ADD CONSTRAINT  FK_TIENDAEJECUTA_PRODUCTONUEVO 
		FOREIGN KEY (NUM_INVENTARIO_EJEMPLAR) REFERENCES PRODUCTONUEVO(NUM_INVENTARIO) 
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAPAGA 
	ADD CONSTRAINT FK_TIENDAPAGA_PAGA FOREIGN KEY (POSTIZA_PAGO) REFERENCES PAGO(POSTIZA_PAGO),
	ADD CONSTRAINT FK_TIENDAPAGA_PROVEEDOR FOREIGN KEY (RIF_PROVEEDOR) REFERENCES PROVEEDOR(RIF)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAREALIZA
	ADD CONSTRAINT FK_TIENDAREALIZA_OPERACION FOREIGN KEY (NUM_OPERACION) REFERENCES COMPRA(NUM_OPERACION),
	ADD CONSTRAINT FK_TIENDAEFECTUA_PRODUCTOUSADO FOREIGN KEY (NUM_INVENTARIO) REFERENCES PRODUCTOUSADO(NUM_INVENTARIO)
;

------------------------------------------------------------------------------------------------------------------------
--                       	  					RESTRICCIONES DE DOMINIO		                        		  	  --
------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CAMBIO
	ADD CONSTRAINT DOM_CAMBIO_NUM_OPERACION  CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT DOM_CAMBIO_NUM_RECIBO CHECK (NUM_RECIBO > 0)
;

------------------------------------------------------------------------------------------------------------------------
 
ALTER TABLE CARGO
	ADD CONSTRAINT DOM_CARGO_SUELDO CHECK (SUELDO > 0),
	ADD CONSTRAINT DOM_CARGO_NOMBRE CHECK (NOMBRE IN ('SECRETARIA','RECEPCIONISTA','GERENTE','CONTADOR'))

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CATEGORIA
	ADD CONSTRAINT DOM_CATEGORIA_SUELDO_BASE CHECK (SUELDO_BASE > 0),
	ADD CONSTRAINT DOM_CATEGORIA_NOMBRE CHECK (NUMERO IN ('I','II','III'))
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CLIENTE
	ADD CONSTRAINT DOM_CLIENTE_CEDULA CHECK (CEDULA_IDENT > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESCLIENTE
	ADD CONSTRAINT DOM_CLIENTE_CEDULA_CLIENTE CHECK (CEDULA_CLIENTE > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSCLIENTE
	ADD CONSTRAINT DOM_APELLIDOSCLIENTE_CEDULA_CLIENTE CHECK (CEDULA_CLIENTE > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TELEFONOSCLIENTE 
	ADD CONSTRAINT DOM_TELEFONOSCLIENTE_CEDULA_CLIENTE CHECK (CEDULA_CLIENTE > 0),
	ADD CONSTRAINT DOM_TELEFONOSCLIENTE_TELEFONO CHECK (TELEFONO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE COMPRA 
	ADD CONSTRAINT DOM_COMPRA_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT DOM_COMPRA_NUM_RECIBO CHECK (NUM_RECIBO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE DEPENDIENTE
	ADD CONSTRAINT DOM_DEPENDIENTE_POSTIZA_DEPENDIENTE CHECK (POSTIZA_DEPENDIENTE > 0),
	ADD CONSTRAINT DOM_DEPENDIENTE_CEDULA CHECK (CEDULA > 0),
	ADD CONSTRAINT DOM_DEPENDIENTE_PARENTESCO CHECK	(PARENTESCO IN ('PADRE','HIJO','CONYUGUE','HERMANO')),
	ADD CONSTRAINT DOM_DEPENDIENTE_SEXO CHECK (SEXO IN ('M','F')),
	ADD CONSTRAINT DOM_DEPENDIENTE_EDAD CHECK (EDAD >= 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESDEPENDIENTE
	ADD CONSTRAINT DOM_NOMBRESDEPENDIENTE_POSTIZA_DEPENTDIENTE CHECK (POSTIZA_DEPENDIENTE > 0)
;	

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSDEPENDIENTE
	ADD CONSTRAINT DOM_APELLIDOSDEPENDIENTE_POSTIZA_DEPENTDIENTE CHECK (POSTIZA_DEPENDIENTE > 0)
;	

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE EJEMPLAR
	ADD CONSTRAINT DOM_EJEMPLAR_NUM_INVENTARIO CHECK (NUM_INVENTARIO > 0),
	ADD CONSTRAINT DOM_EJEMPLAR_PRECIO_LISTA CHECK (PRECIO_LISTA > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE EMPLEADO 
	ADD CONSTRAINT DOM_EMPLEADO_CEDULA CHECK (CEDULA > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESEMPLEADO 
	ADD CONSTRAINT DOM_NOMBRESEMPLEADO CHECK (CEDULA_EMPLEADO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSEMPLEADO 
	ADD CONSTRAINT DOM_APELLIDOSEMPLEADO CHECK (CEDULA_EMPLEADO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TELEFONOSEMPLEADO 
	ADD CONSTRAINT DOM_TELEFONOSEMPLEADO CHECK (CEDULA_EMPLEADO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE FACTURA
	ADD CONSTRAINT DOM_FACTURA_ID_NUMERO_FACTURA CHECK (ID_NUMERO_FACTURA > 0),
	ADD CONSTRAINT DOM_FACTURA_NUM_TARJETA CHECK (NUM_TARJETA > 0),
	ADD CONSTRAINT DOM_FACTURA_CLAVE_CONF CHECK (CLAVE_CONF > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE OPERACION 
	ADD CONSTRAINT DOM_OPERACION_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT DOM_OPERACION_CI_VENDEDOR CHECK (CI_VENDEDOR > 0),
	ADD CONSTRAINT DOM_OPERACION_POSTIZA_PAGO CHECK (POSTIZA_PAGO > 0),
	ADD CONSTRAINT DOM_OPERACION_CI_CLIENTE CHECK (CI_CLIENTE > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ORDEN 
	ADD CONSTRAINT DOM_OPERACION_NUMERO CHECK (NUMERO > 0),
	ADD CONSTRAINT DOM_OPERACION_MONTO_TOTAL CHECK (MONTO_TOTAL > 0),
	ADD CONSTRAINT DOM_OPERACION_CANTIDAD_TOTAL CHECK (CANTIDAD_TOTAL > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PAGO
	ADD CONSTRAINT DOM_OPERACION_POSTIZA_PAGO CHECK (POSTIZA_PAGO > 0),	
	ADD CONSTRAINT DOM_PAGO_MODO CHECK (MODO IN ('TARJETA','EFECTIVO','TRANSFERENCIA_BANCARIA')),
	ADD CONSTRAINT DOM_OPERACION_MONTO CHECK (MONTO > 0)

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PEDIDO
	ADD CONSTRAINT DOM_OPERACION_NUM_PEDIDO CHECK (NUM_PEDIDO > 0),	
	ADD CONSTRAINT DOM_OPERACION_NUM_ENTREGA CHECK (NUM_ENTREGA > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PERSONALADMINISTRATIVO
	ADD CONSTRAINT DOM_PERSONALADMINISTRATIVO_CI_EMPLEADO CHECK (CI_EMPLEADO > 0)	
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTO
	ADD CONSTRAINT DOM_PRODUCTO_ANHO_ELABORACION CHECK (ANHO_ELABORACION > 1800),		
	ADD CONSTRAINT DOM_PRODUCTO_CATEGORIA CHECK	(CATEGORIA IN ('LINEA_BLANCA','LINEA_MARRON','DECORACION')),
	ADD CONSTRAINT DOM_PRODUCTO_NUM_EXISTENCIA CHECK (NUM_EXISTENCIA > 0),	
	ADD CONSTRAINT DOM_PRODUCTO_NIVEL_MINIMO CHECK (NIVEL_MINIMO > 0)	
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTONUEVO 
	ADD CONSTRAINT DOM_PRODUCTONUEVO_NUM_INVENTARIO CHECK (NUM_INVENTARIO > 0)	

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTOUSADO
	ADD CONSTRAINT DOM_PRODUCTOUSADO_NUM_INVENTARIO CHECK (NUM_INVENTARIO > 0)
;

------------------------------------------------------------------------------------------------------------------------

--ALTER TABLE PROVEEDOR
	-- FALTAN AGREGAR RESTRICCIONES Y EN LAS DEMAS LO DEL RIFF! 

--;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE RECIBO 
	ADD CONSTRAINT DOM_RECIBO_NUM_RECIBO CHECK (NUM_RECIBO > 0),
	ADD CONSTRAINT DOM_RECIBO_NUM_TARJETA CHECK (NUM_TARJETA > 0),
	ADD CONSTRAINT DOM_RECIBO_CLAVE_CONF CHECK (CLAVE_CONF > 0)

;


------------------------------------------------------------------------------------------------------------------------

ALTER TABLE REMUNERACIONSABADO
	ADD CONSTRAINT DOM_REMUNERACIONSABADO_MONTO CHECK (MONTO > 0)

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE VENDEDOR 
	ADD CONSTRAINT DOM_VENDEDOR_CI_VENDEDOR CHECK (CI_VENDEDOR > 0),
	ADD CONSTRAINT DOM_VENDEDOR_COMISION CHECK (COMISION >= 0),
	ADD CONSTRAINT DOM_VENDEDOR_NUM_SABADO CHECK (NUM_SABADO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE VENTA 
	ADD CONSTRAINT DOM_VENTA_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT DOM_VENTA_ID_NUMERO_FACTURA CHECK (ID_NUMERO_FACTURA > 0)

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ESDEPENDIENTE
	ADD CONSTRAINT DOM_ESDEPENDIENTE_POSTIZA_DEPENDIENTE CHECK (POSTIZA_DEPENDIENTE > 0),
	ADD CONSTRAINT DOM_ESDEPENDIENTE_CI_EMPLEADO CHECK (CI_EMPLEADO > 0)

;

------------------------------------------------------------------------------------------------------------------------


ALTER TABLE PIDE 
	ADD CONSTRAINT DOM_PIDE_CI_CLIENTE CHECK (CI_CLIENTE > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE SOLICITA 
	ADD CONSTRAINT DOM_SOLICITA_NUM_ORDEN CHECK (NUM_ORDEN > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAEFECTUA 
	ADD CONSTRAINT DOM_TIENDAEFECTUA_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT DOM_TIENDAEFECTUA_NUM_INVENTARIO_EJEMPLAR_1 CHECK (NUM_INVENTARIO_EJEMPLAR_1 > 0),
	ADD CONSTRAINT DOM_TIENDAEFECTUA_NUM_INVENTARIO_EJEMPLAR_2 CHECK (NUM_INVENTARIO_EJEMPLAR_2 > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAEJECUTA
	ADD CONSTRAINT DOM_TIENDAEJECUTA_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT DOM_TIENDAEJECUTA_NUM_INVENTARIO_EJEMPLAR CHECK (NUM_INVENTARIO_EJEMPLAR > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAPAGA 
	ADD CONSTRAINT DOM_TIENDAPAGA_POSTIZA_PAGO CHECK (POSTIZA_PAGO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAREALIZA 
	ADD CONSTRAINT DOM_TIENDAREALIZA_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT DOM_TIENDAREALIZA_NUM_INVENTARIO CHECK (NUM_INVENTARIO > 0)
;

------------------------------------------------------------------------------------------------------------------------
--                       	  					RESTRICCIONES EXPLICITAS		                        		  	  --
------------------------------------------------------------------------------------------------------------------------

	-- R0: El comprador compra productos a la tienda en efectivo o en tarjeta -- 
	-- (TIENDA PAGA) ADD CONSTRAINT DOM_TIENDAPAGA_MODO CHECK (MODO = 'TRANSFERENCIA_BANCARIA')
	

------------------------------------------------------------------------------------------------------------------------
--                       	  			FIN DE LA DEFINICION DE RESTRICCIONES                        			  	  --
------------------------------------------------------------------------------------------------------------------------



