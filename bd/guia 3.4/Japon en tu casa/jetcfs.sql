DROP TABLE comision_ventas;
DROP TABLE ventas;
DROP TABLE empleado;
DROP TABLE tipo_empleado;
-------
CREATE TABLE tipo_empleado(
    tipo_empleado NUMBER(2) NOT NULL
    ,desc_tipo_empleado VARCHAR2(25) NOT NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_tipo_empleado PRIMARY KEY(tipo_empleado)
);
CREATE TABLE empleado(
    id_empleado NUMBER(5) NOT NULL
    ,numrut NUMBER(10) NOT NULL
    ,dvrut CHAR(1) NOT NULL
    ,pnombre VARCHAR2(25) NOT NULL
    ,snombre VARCHAR2(25) NULL
    ,appat VARCHAR2(25) NOT NULL
    ,apmat VARCHAR2(25) NOT NULL
    ,fecha_contrato DATE NOT NULL
    ,FK_tipo_emp NUMBER(2) NOT NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_empleado PRIMARY KEY(id_empleado)
    ,CONSTRAINT FK_emp_tipemp FOREIGN KEY(FK_tipo_emp) REFERENCES tipo_empleado(tipo_empleado)
);
CREATE TABLE ventas(
    nro_boleta NUMBER(8) NOT NULL
    ,FK_id_empleado NUMBER(5) NOT NULL
    ,fecha_boleta DATE NOT NULL
    ,monto_total NUMBER(8) NOT NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_ventas PRIMARY KEY(nro_boleta)
    ,CONSTRAINT FK_vent_emp FOREIGN KEY(FK_id_empleado) REFERENCES empleado(id_empleado)
);
CREATE TABLE comision_ventas(
    nro_boleta NUMBER(8) NOT NULL
    ,monto_comision NUMBER(8) NOT NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_comision_ventas PRIMARY KEY(nro_boleta)
    ,CONSTRAINT FK_comvent_vent FOREIGN KEY(nro_boleta) REFERENCES ventas(nro_boleta)
);
-------
INSERT INTO tipo_empleado VALUES(1,'Administrativo');
INSERT INTO tipo_empleado VALUES(2,'Cocinero');
INSERT INTO tipo_empleado VALUES(3,'Vendedor');
INSERT INTO tipo_empleado VALUES(4,'Repartidor');

INSERT INTO empleado VALUES(4,5555555,'5','MARIA',NULL,'ROMERO','ROJAS',TO_DATE('01/08/12','DD/MM/YY'),1);
INSERT INTO empleado VALUES(5,6666666,'6','SONIA','EUGENIA','TAPIA','VEGA',TO_DATE('01/08/12','DD/MM/YY'),2);
INSERT INTO empleado VALUES(1,2222222,'2','PABLO',NULL,'PEREZ','SOTO',TO_DATE('01/03/10','DD/MM/YY'),3);
INSERT INTO empleado VALUES(2,3333333,'3','PEDRO','JOSE','TORRES','TRONCOSO',TO_DATE('14/03/11','DD/MM/YY'),3);
INSERT INTO empleado VALUES(3,4444444,'4','FRANCISCO','ALEJANDRO','AGUILAR','TAPIA',TO_DATE('01/06/11','DD/MM/YY'),3);

INSERT INTO ventas VALUES(100,1,TO_DATE('01/03/2014','DD/MM/YYYY'),200000);
INSERT INTO ventas VALUES(101,1,TO_DATE('02/03/2014','DD/MM/YYYY'),100000);
INSERT INTO ventas VALUES(102,1,TO_DATE('02/03/2014','DD/MM/YYYY'),75000);
INSERT INTO ventas VALUES(103,3,TO_DATE('02/03/2014','DD/MM/YYYY'),45200);
INSERT INTO ventas VALUES(90,3,TO_DATE('02/02/2014','DD/MM/YYYY'),75000);

INSERT INTO comision_ventas VALUES(100,26000);
INSERT INTO comision_ventas VALUES(101,13000);
INSERT INTO comision_ventas VALUES(102,9750);
INSERT INTO comision_ventas VALUES(103,5876);
INSERT INTO comision_ventas VALUES(90,9750);
------- 
SELECT * FROM empleado WHERE FK_tipo_emp = 2;

SELECT * FROM empleado 
    WHERE EXTRACT(YEAR FROM TO_DATE(fecha_contrato,'DD/MM/YY'))= 2012;

SELECT * FROM ventas WHERE FK_id_empleado = 1;

SELECT * FROM comision_ventas WHERE monto_comision>10000;

SELECT * FROM ventas ORDER BY fecha_boleta ASC,monto_total DESC;




