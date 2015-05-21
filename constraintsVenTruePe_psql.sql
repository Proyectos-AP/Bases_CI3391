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
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT PK_CAMBIO PRIMARY KEY
;
------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CARGO
	ADD CONSTRAINT NOMBRE CONSTRAINT PK_CAMBIO PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CATEGORIA 
	ADD CONSTRAINT NUMERO CONSTRAINT PK_CATEGORIA PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CLIENTE
	ADD CONSTRAINT CEDULA CONSTRAINT PK_CLIENTE PRIMARY KEY 
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESCLIENTE 
	ADD CONSTRAINT (CEDULA_CLIENTE,NOMBRE) PK_NOMBRESCLIENTE PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSCLIENTE
	ADD CONSTRAINT (CEDULA_CLIENTE,APELLIDO) PK_APELLIDOSCLIENTE PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TELEFONOSCLIENTE
	ADD CONSTRAINT (CEDULA_CLIENTE,TELEFONO) PK_TELEFONOSCLIENTE PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE COMPRA
	ADD CONSTRAINT NUM_OPERACION PK_COMPRA PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE DEPENDIENTE
	ADD CONSTRAINT POSTIZA_DEPENDIENTE PK_DEPENDIENTE PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESDEPENDIENTE
	ADD CONSTRAINT (POSTIZA_DEPENDIENTE,NOMBRE) PK_NOMBRESDEPENDIENTE PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSDEPENDIENTE
	ADD CONSTRAINT (POSTIZA_DEPENDIENTE,APELLIDO) PK_APELLIDOSDEPENDIENTE PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE EJEMPLAR
	ADD CONSTRAINT NUM_INVENTARIO PK_EJEMPLAR PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE EMPLEADO 
	ADD CONSTRAINT CEDULA PK_EMPLEADO PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESEMPLEADO 
	ADD CONSTRAINT (CEDULA_EMPLEADO,NOMBRE) PK_NOMBRESEMPLEADO PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSEMPLEADO
	ADD CONSTRAINT (CEDULA_EMPLEADO,APELLIDO) PK_APELLIDOSEMPLEADO PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TELEFONOSEMPLEADO
	ADD CONSTRAINT (CEDULA_EMPLEADO,TELEFONO) PK_TELEFONOSEMPLEADO PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE FACTURA
	ADD CONSTRAINT (ID_NUMERO_FACTURA,ID_RIF_EMPRESA) PK_FACTURA PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE OPERACION
	ADD CONSTRAINT NUM_OPERACION PK_OPERACION PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ORDEN 
	ADD CONSTRAINT NUMERO PK_ORDEN PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PAGO
	ADD CONSTRAINT POSTIZA_PAGO PK_PAGO PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PEDIDO
	ADD CONSTRAINT (NUM_PEDIDO,RIF_PROVEEDOR) PK_PEDIDO PRIMARY KEY 
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PERSONAL_ADMINISTRATIVO
	ADD CONSTRAINT CI_EMPLEADO PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRIMA
	ADD CONSTRAINT MONTO PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTO
	ADD CONSTRAINT (MARCA,MODELO) PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTONUEVO
	ADD CONSTRAINT NUM_INVENTARIO PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTOUSADO
	ADD CONSTRAINT NUM_INVENTARIO PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PROVEEDOR
	ADD CONSTRAINT RIF PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE RECIBO
	ADD CONSTRAINT NUM_RECIBO PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE REMUMERACIONSABADO
	ADD CONSTRAINT MONTO PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE VENDEDOR 
	ADD CONSTRAINT CI_VENDEDOR PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE VENTA
	ADD CONSTRAINT NUM_OPERACION PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ESDEPENDIENTE
	ADD CONSTRAINT (POSTIZA_DEPENDIENTE,CI_EMPLEADO) PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PIDE
	ADD CONSTRAINT (MARCA_PRODUCTO,MODELO_PRODUCTO,CI_CLIENTE) PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE SOLICITA 
	ADD CONSTRAINT (NUM_ORDEN,MARCA_PRODUCTO,MODELO_PRODUCTO) PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAEFECTUA
	ADD CONSTRAINT (NUM_OPERACION,NUM_INVENTARIO_EJEMPLAR_1,NUM_INVENTARIO_EJEMPLAR_2) PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAEJECUTA
	ADD CONSTRAINT (NUM_OPERACION,NUM_INVENTARIO_EJEMPLAR) PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAPAGA
	ADD CONSTRAINT (POSTIZA_PAGO,RIF_PROVEEDOR) PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAREALIZA
	ADD CONSTRAINT (NUM_OPERACION,NUM_INVENTARIO) PRIMARY KEY
;

------------------------------------------------------------------------------------------------------------------------
--                       	  				RESTRICCIONES DE CLAVES FORANEAS		                        		  --
------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CAMBIO
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT FK_CAMBIO_OPERACION REFERENCES OPERACION(NUM_OPERACION),
	ADD CONSTRAINT NUM_RECIBO CONSTRAINT FK_CAMBIO_RECIBO REFERENCES RECIBO(NUM_RECIBO) 
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESCLIENTE 
	ADD CONSTRAINT CEDULA_CLIENTE CONSTRAINT FK_NOMBRESCLIENTE_CLIENTE REFERENCES CLIENTE(CEDULA)

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSCLIENTE
	ADD CONSTRAINT CEDULA_CLIENTE CONSTRAINT FK_APELLIDOSCLIENTE_CLIENTE REFERENCES CLIENTE(CEDULA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TELEFONOSCLIENTE
	ADD CONSTRAINT CEDULA_CLIENTE CONSTRAINT FK_TELEFONOSCLIENTE_CLIENTE REFERENCES CLIENTE(CEDULA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE COMPRA 
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT FK_COMPRA_OPERACION REFERENCES OPERACION(NUM_OPERACION),
	ADD CONSTRAINT NUM_RECIBO CONSTRAINT FK_COMPRA_RECIBO REFERENCES RECIBO(NUM_RECIBO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESDEPENDIENTE
	ADD CONSTRAINT POSTIZA_DEPENDIENTE CONSTRAINT FK_NOMBRESDEPENDIENTE_DEPENDIENTE 
	REFERENCES DEPENDIENTE(POSTIZA_DEPENDIENTE)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSDEPENDIENTE
	ADD CONSTRAINT POSTIZA_DEPENDIENTE CONSTRAINT FK_APELLIDOSDEPENDIENTE_DEPENDIENTE 
	REFERENCES DEPENDIENTE(POSTIZA_DEPENDIENTE)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESEMPLEADO 
	ADD CONSTRAINT CEDULA_EMPLEADO CONSTRAINT FK_NOMBRESEMPLEADO_EMPLEADO REFERENCES EMPLEADO(CEDULA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSEMPLEADO
	ADD CONSTRAINT CEDULA_EMPLEADO CONSTRAINT FK_APELLIDOSEMPLEADO_EMPLEADO REFERENCES EMPLEADO(CEDULA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TELEFONOSEMPLEADO
	ADD CONSTRAINT CEDULA_EMPLEADO CONSTRAINT FK_TELEFONOSEMPLEADO_EMPLEADO REFERENCES EMPLEADO(CEDULA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE OPERACION
	ADD CONSTRAINT CI_VENDEDOR CONSTRAINT FK _OPERACION_VENDEDOR REFERENCES VENDEDOR(CEDULA),
	ADD CONSTRAINT POSTIZA_PAGO CONSTRAINT FK_OPERACION_PAGO REFERENCES PAGO(POSTIZA_PAGO),
	ADD CONSTRAINT CI_CLIENTE CONSTRAINT FK_OPERACION_CLIENTE REFERENCES CLIENTE(CEDULA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ORDEN
	ADD CONSTRAINT RIF_PROVEEDOR CONSTRAINT FK_ORDEN_PROVEEDOR REFERENCES PROVEEDOR(RIF)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PEDIDO 
	ADD CONSTRAINT RIF_PROVEEDOR CONSTRAINT FK_PEDIDO_PROVEEDOR REFERENCES PROVEEDOR(RIF)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PERSONAL_ADMINISTRATIVO
	ADD CONSTRAINT CI_EMPLEADO CONSTRAINT FK_PERSONALADMINISTRATIVO_EMPLEADO REFERENCES EMPLEADO(CEDULA),
	ADD CONSTRAINT NOMBRE_CARGO CONSTRAINT FK_PERSONALADMINISTRATIVO_CARGO REFERENCES CARGO(NOMBRE)




------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTONUEVO
	ADD CONSTRAINT NUM_INVENTARIO CONSTRAINT FK_PRODUCTONUEVO_EJEMPLAR REFERENCES EJEMPLAR(NUM_INVENTARIO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTOUSADO
	ADD CONSTRAINT NUM_INVENTARIO CONSTRAINT FK_PRODUCTOUSADO_EJEMPLAR REFERENCES EJEMPLAR(NUM_INVENTARIO)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE VENTA
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT FK_VENTA_OPERACION REFERENCES OPERACION(NUM_OPERACION)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ESDEPENDIENTE
	ADD CONSTRAINT POSTIZA_DEPENDIENTE CONSTRAINT FK_ESDEPENDIENTE_DEPENDIENTE 
	REFERENCES DEPENDIENTE(POSTIZA_DEPENDIENTE),
	ADD CONSTRAINT CI_EMPLEADO CONSTRAINT FK_ESDEPENDIENTE_EMPLEADO REFERENCES EMPLEADO(CEDULA)

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PIDE
	ADD CONSTRAINT CI_CLIENTE CONSTRAINT FK_PIDE_CLIENTE REFERENCES CLIENTE(CEDULA)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAEFECTUA 
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT FK_TIENDAEFECTUA_OPERACION REFERENCES CAMBIO(NUM_OPERACION),
	ADD CONSTRAINT NUM_INVENTARIO_EJEMPLAR_1 CONSTRAINT FK1_TIENDAEFECTUA_PRODUCTOUSADO 
	REFERENCES PRODUCTOUSADO(NUM_OPERACION),
	ADD CONSTRAINT NUM_INVENTARIO_EJEMPLAR_2 CONSTRAINT FK2_TIENDAEFECTUA_PRODUCTOUSADO 
	REFERENCES PRODUCTOUSADO(NUM_OPERACION)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAEJECUTA
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT FK_TIENDAEJECUTA_OPERACION REFERENCES VENTA(NUM_OPERACION),
	ADD CONSTRAINT NUM_INVENTARIO_EJEMPLAR CONSTRAINT FK_TIENDAEJECUTA_PRODUCTONUEVO 
	REFERENCES PRODUCTONUEVO(NUM_INVENTARIO) 
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAPAGA 
	ADD CONSTRAINT POSTIZA_PAGO  CONSTRAINT FK_TIENDAPAGA_PAGA REFERENCES PAGO(POSTIZA_PAGO),
	ADD CONSTRAINT RIF_PROVEEDOR CONSTRAINT FK_TIENDAPAGA_PROVEEDOR REFERENCES PROVEEDOR(RIF)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAREALIZA
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT FK_TIENDAREALIZA_OPERACION REFERENCES COMPRA(NUM_OPERACION),
	ADD CONSTRAINT NUM_INVENTARIO CONSTRAINT FK_TIENDAEFECTUA_PRODUCTOUSADO REFERENCES PRODUCTOUSADO(NUM_OPERACION)
;

------------------------------------------------------------------------------------------------------------------------
--                       	  					RESTRICCIONES DE DOMINIO		                        		  	  --
------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CAMBIO
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT DOM_CAMBIO_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT NUM_RECIBO CONSTRAINT DOM_CAMBIO_NUM_RECIBO CHECK (NUM_RECIBO > 0)
;

------------------------------------------------------------------------------------------------------------------------
 
ALTER TABLE CARGO
	ADD CONSTRAINT SUELDO CONSTRAINT DOM_CARGO_SUELDO CHECK (SUELDO > 0),
	ADD CONSTRAINT NOMBRE CONSTRAINT DOM_CARGO_NOMBRE CHECK
		(NOMBRE IN ('SECRETARIA','RECEPCIONISTA','GERENTE','CONTADOR'))

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CATEGORIA
	ADD CONSTRAINT SUELDO_BASE CONSTRAINT DOM_CATEGORIA_SUELDO_BASE CHECK (SUELDO_BASE > 0),
	ADD CONSTRAINT NUMERO CONSTRAINT DOM_CATEGORIA_NOMBRE CHECK (NUMERO IN ('I','II','III'))
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE CLIENTE
	ADD CONSTRAINT CEDULA CONSTRAINT DOM_CLIENTE_CEDULA CHECK (CEDULA > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESCLIENTE
	ADD CONSTRAINT CEDULA_CLIENTE CONSTRAINT DOM_CLIENTE_CEDULA_CLIENTE CHECK (CEDULA_CLIENTE > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSCLIENTE
	ADD CONSTRAINT CEDULA_CLIENTE CONSTRAINT DOM_APELLIDOSCLIENTE_CEDULA_CLIENTE CHECK (CEDULA_CLIENTE > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TELEFONOSCLIENTE 
	ADD CONSTRAINT CEDULA_CLIENTE CONSTRAINT DOM_TELEFONOSCLIENTE_CEDULA_CLIENTE CHECK (CEDULA_CLIENTE > 0),
	ADD CONSTRAINT TELEFOO CONSTRAINT DOM_TELEFONOSCLIENTE_TELEFONO CHECK (TELEFONO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE COMPRA 
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT DOM_COMPRA_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT NUM_RECIBO CONSTRAINT DOM_COMPRA_NUM_RECIBO CHECK (NUM_RECIBO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE DEPENDIENTE
	ADD CONSTRAINT POSTIZA_DEPENDIENTE CONSTRAINT DOM_DEPENDIENTE_POSTIZA_DEPENDIENTE CHECK (POSTIZA_DEPENDIENTE > 0),
	ADD CONSTRAINT CEDULA CONSTRAINT DOM_DEPENDIENTE_CEDULA CHECK (CEDULA > 0),
	ADD CONSTRAINT PARENTESCO CONSTRAINT DOM_DEPENDIENTE_PARENTESCO CHECK
							(PARENTESCO IN ('PADRE','HIJO','CONYUGUE','HERMANO')),
	ADD CONSTRAINT SEXO CONSTRAINT DOM_DEPENDIENTE_SEXO CHECK (SEXO IN ('M','F')),
	ADD CONSTRAINT EDAD CONSTRAINT DOM_DEPENDIENTE_EDAD CHECK (EDAD >= 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESDEPENDIENTE
	ADD CONSTRAINT POSTIZA_DEPENDIENTE CONSTRAINT 
	DOM_NOMBRESDEPENDIENTE_POSTIZA_DEPENTDIENTE CHECK (POSTIZA_DEPENDIENTE > 0)
;	

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSDEPENDIENTE
	ADD CONSTRAINT POSTIZA_DEPENDIENTE CONSTRAINT 
	DOM_APELLIDOSDEPENDIENTE_POSTIZA_DEPENTDIENTE CHECK (POSTIZA_DEPENDIENTE > 0)
;	

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE EJEMPLAR
	ADD CONSTRAINT NUM_INVENTARIO CONSTRAINT DOM_EJEMPLAR_NUM_INVENTARIO CHECK (NUM_INVENTARIO > 0),
	ADD CONSTRAINT PRECIO_LISTA CONSTRAINT DOM_EJEMPLAR_PRECIO_LISTA CHECK (PRECIO_LISTA > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE EMPLEADO 
	ADD CONSTRAINT CEDULA CONSTRAINT DOM_EMPLEADO_CEDULA CHECK (CEDULA > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE NOMBRESEMPLEADO 
	ADD CONSTRAINT CEDULA_EMPLEADO CONSTRAINT DOM_NOMBRESEMPLEADO CHECK (CEDULA_EMPLEADO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE APELLIDOSEMPLEADO 
	ADD CONSTRAINT CEDULA_EMPLEADO CONSTRAINT DOM_APELLIDOSEMPLEADO CHECK (CEDULA_EMPLEADO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TELEFONOSEMPLEADO 
	ADD CONSTRAINT CEDULA_EMPLEADO CONSTRAINT DOM_TELEFONOSEMPLEADO CHECK (CEDULA_EMPLEADO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE FACTURA
	ADD CONSTRAINT ID_NUMERO_FACTURA CONSTRAINT DOM_FACTURA_ID_NUMERO_FACTURA CHECK (ID_NUMERO_FACTURA > 0),
	ADD CONSTRAINT NUM_TARJETA CONSTRAINT DOM_FACTURA_NUM_TARJETA CHECK (NUM_TARJETA > 0),
	ADD CONSTRAINT CLAVE_CONF CONSTRAINT DOM_FACTURA_CLAVE_CONF CHECK (CLAVE_CONF > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE OPERACION 
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT DOM_OPERACION_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT CI_VENDEDOR CONSTRAINT DOM_OPERACION_CI_VENDEDOR CHECK (CI_VENDEDOR > 0),
	ADD CONSTRAINT POSTIZA_PAGO CONSTRAINT DOM_OPERACION_POSTIZA_PAGO CHECK (POSTIZA_PAGO > 0),
	ADD CONSTRAINT CI_CLIENTE CONSTRAINT DOM_OPERACION_CI_CLIENTE CHECK (CI_CLIENTE > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ORDEN 
	ADD CONSTRAINT NUMERO CONSTRAINT DOM_OPERACION_NUMERO CHECK (NUMERO > 0),
	ADD CONSTRAINT MONTO_TOTAL CONSTRAINT DOM_OPERACION_MONTO_TOTAL CHECK (MONTO_TOTAL > 0),
	ADD CONSTRAINT CANTIDAD_TOTAL CONSTRAINT DOM_OPERACION_CANTIDAD_TOTAL CHECK (CANTIDAD_TOTAL > 0)
;

------------------------------------------------------------------------------------------------------------------------


ALTER TABLE PAGO
	ADD CONSTRAINT POSTIZA_PAGO CONSTRAINT DOM_OPERACION_POSTIZA_PAGO CHECK (POSTIZA_PAGO > 0),	
	ADD CONSTRAINT MODO CONSTRAINT DOM_PAGO_MODO CHECK 
					(MODO IN ('TARJETA','EFECTIVO','TRANSFERENCIA_BANCARIA')),
	ADD CONSTRAINT MONTO CONSTRAINT DOM_OPERACION_MONTO CHECK (MONTO > 0)

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PEDIDO
	ADD CONSTRAINT NUM_PEDIDO CONSTRAINT DOM_OPERACION_NUM_PEDIDO CHECK (NUM_PEDIDO > 0),	
	ADD CONSTRAINT NUM_ENTREGA CONSTRAINT DOM_OPERACION_NUM_ENTREGA CHECK (NUM_ENTREGA > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PERSONALADMINISTRATIVO
	ADD CONSTRAINT CI_EMPLEADO CONSTRAINT DOM_PERSONALADMINISTRATIVO_CI_EMPLEADO CHECK (CI_EMPLEADO > 0)	
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTO

	ADD CONSTRAINT ANHO_ELABORACION CONSTRAINT DOM_PRODUCTO_ANHO_ELABORACION CHECK (ANHO_ELABORACION > 1800)		
	ADD CONSTRAINT CATEGORIA DOM_PRODUCTO_CATEGORIA CHECK
				(CATEGORIA IN ('LINEA_BLANCA','LINEA_MARRON','DECORACION')),
	ADD CONSTRAINT NUM_EXISTENCIA CONSTRAINT DOM_PRODUCTO_NUM_EXISTENCIA CHECK (NUM_EXISTENCIA > 0),	
	ADD CONSTRAINT NIVEL_MINIMO CONSTRAINT DOM_PRODUCTO_NIVEL_MINIMO CHECK (NIVEL_MINIMO > 0)	

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTONUEVO 
	ADD CONSTRAINT NUM_INVENTARIO CONSTRAINT DOM_PRODUCTONUEVO_NUM_INVENTARIO CHECK (NUM_INVENTARIO > 0)	

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PRODUCTOUSADO
	ADD CONSTRAINT NUM_INVENTARIO CONSTRAINT DOM_PRODUCTOUSADO_NUM_INVENTARIO CHECK (NUM_INVENTARIO > 0)
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PROVEEDOR 

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE RECIBO 
	ADD CONSTRAINT NUM_RECIBO CONSTRAINT DOM_RECIBO_NUM_RECIBO CHECK (NUM_RECIBO > 0)
	ADD CONSTRAINT NUM_TARJETA CONSTRAINT DOM_RECIBO_NUM_TARJETA CHECK (NUM_INVENTARIO > 0)
	ADD CONSTRAINT CLAVE_CONF CONSTRAINT DOM_RECIBO_CLAVE_CONF CHECK (CLAVE_CONF > 0)

;


------------------------------------------------------------------------------------------------------------------------

ALTER TABLE REMUNERACIONSABADO
	ADD CONSTRAINT MONTO CONSTRAINT DOM_REMUNERACIONSABADO_MONTO CHECK (MONTO > 0)

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE VENDEDOR 
	ADD CONSTRAINT CI_VENDEDOR CONSTRAINT DOM_VENDEDOR_CI_VENDEDOR CHECK (CI_VENDEDOR > 0),
	ADD CONSTRAINT COMISION CONSTRAINT DOM_VENDEDOR_COMISION CHECK (COMISION >= 0),
	ADD CONSTRAINT NUM_SABADO CONSTRAINT DOM_VENDEDOR_NUM_SABADO CHECK (NUM_SABADO > 0),
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE VENTA 
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT DOM_VENTA_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT ID_NUMERO_FACTURA CONSTRAINT DOM_VENTA_ID_NUMERO_FACTURA CHECK (ID_NUMERO_FACTURA > 0),

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ESDEPENDIENTE
	ADD CONSTRAINT POSTIZA_DEPENDIENTE CONSTRAINT DOM_ESDEPENDIENTE_POSTIZA_DEPENDIENTE CHECK (POSTIZA_DEPENDIENTE > 0),
	ADD CONSTRAINT CI_EMPLEADO CONSTRAINT DOM_ESDEPENDIENTE_CI_EMPLEADO CHECK (CI_EMPLEADO > 0),

;

------------------------------------------------------------------------------------------------------------------------


ALTER TABLE PIDE 
	ADD CONSTRAINT CI_CLIENTE CONSTRAINT DOM_PIDE_CI_CLIENTE CHECK (CI_CLIENTE > 0),
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE SOLICITA 
	ADD CONSTRAINT NUM_ORDEN CONSTRAINT DOM_SOLICITA_NUM_ORDEN CHECK (NUM_ORDEN > 0),

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAEFECTUA 
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT DOM_TIENDAEFECTUA_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT NUM_INVENTARIO_EJEMPLAR_1 CONSTRAINT DOM_TIENDAEFECTUA_NUM_INVENTARIO_EJEMPLAR_1 
																CHECK (NUM_INVENTARIO_EJEMPLAR_1 > 0),
	ADD CONSTRAINT NUM_INVENTARIO_EJEMPLAR_2 CONSTRAINT DOM_TIENDAEFECTUA_NUM_INVENTARIO_EJEMPLAR_2 
																CHECK (NUM_INVENTARIO_EJEMPLAR_2 > 0),

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAEJECUTA
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT DOM_TIENDAEJECUTA_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT NUM_INVENTARIO_EJEMPLAR CONSTRAINT DOM_TIENDAEJECUTA_NUM_INVENTARIO_EJEMPLAR 
																	CHECK (NUM_INVENTARIO_EJEMPLAR > 0),

;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAPAGA 
	ADD CONSTRAINT POSTIZA_PAGO CONSTRAINT DOM_TIENDAPAGA_POSTIZA_PAGO CHECK (POSTIZA_PAGO > 0),
	ADD CONSTRAINT MODO CONSTRAINT DOM_TIENDAPAGA_MODO CHECK (MODO = 'TRANSFERENCIA_BANCARIA')
;

------------------------------------------------------------------------------------------------------------------------

ALTER TABLE TIENDAREALIZA 
	ADD CONSTRAINT NUM_OPERACION CONSTRAINT DOM_TIENDAREALIZA_NUM_OPERACION CHECK (NUM_OPERACION > 0),
	ADD CONSTRAINT NUM_INVENTARIO CONSTRAINT DOM_TIENDAREALIZA_NUM_INVENTARIO CHECK (NUM_INVENTARIO > 0),

;

------------------------------------------------------------------------------------------------------------------------
--                       	  					RESTRICCIONES EXPLICITAS		                        		  	  --
------------------------------------------------------------------------------------------------------------------------


	
	-- R0: El comprador compra productos a la tienda en efectivo o en tarjeta -- 
	EXP_EMPLEADO_R1 








------------------------------------------------------------------------------------------------------------------------
--                       	  			FIN DE LA DEFINICION DE RESTRICCIONES                        			  	  --
------------------------------------------------------------------------------------------------------------------------



