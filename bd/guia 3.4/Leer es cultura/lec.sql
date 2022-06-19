DROP table comision_boleta;
DROP TABLE boleta;
DROP TABLE vendedor;
----
CREATE TABLE vendedor(
    id_empleado NUMBER(5) NOT NULL
    ,numrut NUMBER(10) NOT NULL
    ,dvrut CHAR(1) NOT NULL
    ,pnombre VARCHAR2(20) NOT NULL
    ,snombre VARCHAR2(20) NULL
    ,appat VARCHAR2(20) NOT NULL
    ,apmat VARCHAR2(20) NOT NULL
    ,fecha_contrato DATE NOT NULL
    ,sueldo_base NUMBER(7) NOT NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_vendedor PRIMARY KEY(id_empleado)
);
CREATE TABLE boleta(
    nro_boleta NUMBER(8) NOT NULL
    ,id_empleado NUMBER(5) NOT NULL
    ,fecha_boleta DATE NOT NULL
    ,monto_total NUMBER(8) NOT NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_boleta PRIMARY KEY(nro_boleta)
    ,CONSTRAINT FK_bol_emp FOREIGN KEY(id_empleado) REFERENCES vendedor(id_empleado)
);
CREATE TABLE comision_boleta(
    nro_boleta NUMBER(8) NOT NULL
    ,id_empleado NUMBER(5) NOT NULL
    ,monto_comision NUMBER(8) NOT NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_comision_boleta PRIMARY KEY(nro_boleta,id_empleado)
    ,CONSTRAINT FK_com_bol FOREIGN KEY(nro_boleta) REFERENCES boleta(nro_boleta)
    ,CONSTRAINT FK_com_emp FOREIGN KEY(id_empleado) REFERENCES vendedor(id_empleado)
);
----
INSERT INTO vendedor VALUES(1,2222222,2,'PABLO',NULL,'PEREZ','SOTO',TO_DATE('01/03/2010','DD/MM/YYYY'),300000);
INSERT INTO vendedor VALUES(2,3333333,3,'PEDRO','JOSE','TORRES','TRONCOSO',TO_DATE('14/03/2011','DD/MM/YYYY'),280000);
INSERT INTO vendedor VALUES(3,4444444,4,'FRANCISCO','ALEJANDRO','AGUILAR','TAPIA',TO_DATE('01/06/2011','DD/MM/YYYY'),250000);
INSERT INTO vendedor VALUES(4,5555555,5,'MARÍA',NULL,'TOLEDO','ARANCIBIA',TO_DATE('01/03/2014','DD/MM/YYYY'),180000);
-----
INSERT INTO boleta VALUES(90,3,TO_DATE('02/02/2014','DD/MM/YYYY'),75000);
INSERT INTO boleta VALUES(100,1,TO_DATE('01/03/2014','DD/MM/YYYY'),200000);
INSERT INTO boleta VALUES(101,1,TO_DATE('02/03/2014','DD/MM/YYYY'),100000);
INSERT INTO boleta VALUES(102,2,TO_DATE('02/03/2014','DD/MM/YYYY'),75000);
INSERT INTO boleta VALUES(103,3,TO_DATE('02/03/2014','DD/MM/YYYY'),45200);
-----
INSERT INTO comision_boleta VALUES(90,3,9750);
INSERT INTO comision_boleta VALUES(100,1,26000);
INSERT INTO comision_boleta VALUES(101,1,13000);
INSERT INTO comision_boleta VALUES(102,2,9750);
INSERT INTO comision_boleta VALUES(103,3,5876);
---------
SELECT * FROM vendedor WHERE snombre IS NULL;
SELECT * FROM boleta WHERE fecha_boleta = TO_DATE('2014-03-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS');
SELECT * FROM comision_boleta WHERE id_empleado = 3;
SELECT * FROM vendedor ORDER BY appat DESC; --en la guia el ejemplo dice ROMERO pero en los datos que te piden ingresar es TOLEDO

