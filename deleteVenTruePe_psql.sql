/*
* Universidad Simon Bolivar
* Departamento de Computacion y Tecnologia de la Informacion
* Laboratorio de Bases de Datos I (CI3391)
* Nombres: 
*	Alejandra Cordero / Carnet: 12-10645
*	Pablo Maldonado   / Carnet: 12-10561
*
* Archivo: deleteVenTruePe_psql.sql
*
* Descripcion: Script que borra las tablas 
* de la Base de Datos de la mega-tienda 
* de muebles VenTruePe
*
* Ultima modificacion: 22/05/2015
*
*/

------------------------------------------------------------------------------------------------------------------------
--                       	  					INICIO DE ELIMINACION DE TABLAS                       				  --
------------------------------------------------------------------------------------------------------------------------

DROP TABLE CAMBIO CASCADE;
DROP TABLE CARGO CASCADE;
DROP TABLE CATEGORIA;
DROP TABLE CLIENTE CASCADE;
DROP TABLE NOMBRESCLIENTE;
DROP TABLE APELLIDOSCLIENTE;
DROP TABLE COMPRA CASCADE;
DROP TABLE TELEFONOSCLIENTE;
DROP TABLE DEPENDIENTE CASCADE;
DROP TABLE NOMBRESDEPENDIENTE;
DROP TABLE APELLIDOSDEPENDIENTE;
DROP TABLE EJEMPLAR CASCADE;
DROP TABLE EMPLEADO CASCADE;
DROP TABLE NOMBRESEMPLEADO;
DROP TABLE APELLIDOSEMPLEADO;
DROP TABLE TELEFONOSEMPLEADO;
DROP TABLE FACTURA CASCADE;
DROP TABLE OPERACION CASCADE;
DROP TABLE ORDEN;
DROP TABLE PAGO CASCADE;
DROP TABLE PEDIDO;
DROP TABLE PERSONALADMINISTRATIVO;
DROP TABLE PRIMA;
DROP TABLE PRODUCTO;
DROP TABLE PRODUCTONUEVO CASCADE;
DROP TABLE PRODUCTOUSADO CASCADE;
DROP TABLE PROVEEDOR CASCADE;
DROP TABLE RECIBO CASCADE;
DROP TABLE REMUNERACIONSABADO;
DROP TABLE VENDEDOR;
DROP TABLE ESDEPENDIENTE;
DROP TABLE PIDE;
DROP TABLE SOLICITA;
DROP TABLE TIENDAEFECTUA;
DROP TABLE TIENDAEJECUTA;
DROP TABLE TIENDAPAGA;
DROP TABLE TIENDAREALIZA;
DROP TABLE VENTA;

------------------------------------------------------------------------------------------------------------------------
--                       	  					FIN DE ELIMINACION DE TABLAS                       				  	  --
------------------------------------------------------------------------------------------------------------------------