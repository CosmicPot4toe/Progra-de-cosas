DROP TABLE situacion_asg_alumno;
DROP TABLE asistencia_alumno;
DROP TABLE nota_alumno;
DROP TABLE alumno;
DROP TABLE asignatura;
DROP TABLE curso;
------
CREATE TABLE curso(
    cod_curso NUMBER(5) NOT NULL
    ,sigla_curso VARCHAR2(10) NOT NULL
    ,descripcion VARCHAR2(25) NOT NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_curso PRIMARY KEY(cod_curso)
);
CREATE TABLE asignatura(
    cod_asignatura NUMBER(4) NOT NULL
    ,sigla_asignatura VARCHAR2(10) NOT NULL
    ,nombre VARCHAR2(30) NOT NULL
    ,observacion VARCHAR2(30) NOT NULL
    ,porc_asis_min NUMBER(3) NOT NULL
    ,minimo_notas NUMBER(3) NOT NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_asignatura PRIMARY KEY(cod_asignatura)
);
CREATE TABLE alumno(
    cod_alumno NUMBER(5) NOT NULL
    ,numrut_alumno NUMBER(10) NOT NULL
    ,dvrut_alumno CHAR(1) NOT NULL
    ,pnombre VARCHAR2(25) NOT NULL
    ,snombre VARCHAR2(25) NULL
    ,appat VARCHAR2(25) NOT NULL
    ,apmat VARCHAR2(25) NOT NULL
    ,FK_cod_curso NUMBER(5) NOT NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_alumno PRIMARY KEY(cod_alumno)
	,CONSTRAINT FK_alumn_curso FOREIGN KEY(FK_cod_curso) REFERENCES curso(cod_curso)
);
CREATE TABLE nota_alumno(
    cod_alumno NUMBER(5) NOT NULL
    ,cod_asignautra NUMBER(4) NOT NULL
    ,nota1 NUMBER(2,1) NOT NULL
    ,nota2 NUMBER(2,1) NOT NULL
    ,nota3 NUMBER(2,1) NOT NULL
    ,nota4 NUMBER(2,1) NULL
    ,nota5 NUMBER(2,1) NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_nota_alumno PRIMARY KEY(cod_alumno,cod_asignautra)
	,CONSTRAINT FK_N_alumn_alumn FOREIGN KEY(cod_alumno) REFERENCES alumno(cod_alumno)
	,CONSTRAINT FK_N_alumn_asign FOREIGN KEY(cod_asignautra) REFERENCES asignatura(cod_asignatura)
);
CREATE TABLE asistencia_alumno(
    cod_alumno NUMBER(5) NOT NULL
    ,cod_asignautra NUMBER(4) NOT NULL
    ,porc_asistencia NUMBER(3) NOT NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_asistencia_alumno PRIMARY KEY(cod_alumno,cod_asignautra)
	,CONSTRAINT FK_AS_alumn_alumn FOREIGN KEY(cod_alumno) REFERENCES alumno(cod_alumno)
	,CONSTRAINT FK_AS_alumn_asign FOREIGN KEY(cod_asignautra) REFERENCES asignatura(cod_asignatura)
);
CREATE TABLE situacion_asg_alumno(
    cod_alumno NUMBER(5) NOT NULL
    ,cod_asignautra NUMBER(4) NOT NULL
    ,promedio_final NUMBER(2,1) NULL
    ,situacion_final CHAR(1) NOT NULL
    ,obs_situacion_final VARCHAR2(70) NULL
	------- KEY CONSTRAINTS ---------
	,CONSTRAINT PK_situacion_asg_alumno PRIMARY KEY(cod_alumno,cod_asignautra)
	,CONSTRAINT FK_SIT_alumn_alumn FOREIGN KEY(cod_alumno) REFERENCES alumno(cod_alumno)
	,CONSTRAINT FK_SIT_alumn_asign FOREIGN KEY(cod_asignautra) REFERENCES asignatura(cod_asignatura)
);
------
INSERT INTO curso VALUES(211,'PMA','PRIMERO MEDIO A');
INSERT INTO curso VALUES(212,'PMB','PRIMERO MEDIO B');
INSERT INTO curso VALUES(221,'SMA','SEGUNDO MEDIO A');
INSERT INTO curso VALUES(222,'SMB','SEGUNDO MEDIO B');

INSERT INTO asignatura VALUES(1211,'MATEM', 'MATEMÁTICAS','ASIGN. PRIMERO MEDIO',90,5);
INSERT INTO asignatura VALUES(1212,'LENG', 'LENGUAJE','ASIGN. PRIMERO MEDIO',90,5);
INSERT INTO asignatura VALUES(1213,'ING', 'INGLES','ASIGN. PRIMERO MEDIO',70,4);
INSERT INTO asignatura VALUES(1214,'ED.FIS', 'EDUCACIÓN FÍSICA','ASIGN. PRIMERO MEDIO',70,4);
INSERT INTO asignatura VALUES(1215,'FIS', 'FÍSICA','ASIGN. PRIMERO MEDIO',66,4);

INSERT INTO alumno VALUES(2111,18012987,'1','JUAN','PABLO','ZÁRATE','POBLETE',211);
INSERT INTO alumno VALUES(2112,19983767,'K','MARÍA',NULL,'JARA','SOTO',211);
INSERT INTO alumno VALUES(2113,19243861,'8','SONIA','ISABEL','TOLEDO','MUÑOZ',211);
INSERT INTO alumno VALUES(2114,20997237,'7','SERGIO','RAFAEL','ARAVENA','ARAYA',212);
INSERT INTO alumno VALUES(2211,18777666,'6','FRANCISCA',NULL,'PEÑA','ACEVEDO',221);
INSERT INTO alumno VALUES(2221,13998111,'1','FRANCISCO','JAVIER','ZÁRATE','DONOSO',222);
---lo de la asistencia (ugh)
    INSERT INTO asistencia_alumno VALUES(2111,1211,85);
    INSERT INTO asistencia_alumno VALUES(2111,1212,87);
    INSERT INTO asistencia_alumno VALUES(2111,1213,60);
    INSERT INTO asistencia_alumno VALUES(2111,1214,68);
    INSERT INTO asistencia_alumno VALUES(2111,1215,68);
    --
    INSERT INTO asistencia_alumno VALUES(2112,1211,100);
    INSERT INTO asistencia_alumno VALUES(2112,1212,95);
    INSERT INTO asistencia_alumno VALUES(2112,1213,100);
    INSERT INTO asistencia_alumno VALUES(2112,1214,100);
    INSERT INTO asistencia_alumno VALUES(2112,1215,100);
    --
    INSERT INTO asistencia_alumno VALUES(2113,1211,76);
    INSERT INTO asistencia_alumno VALUES(2113,1212,50);
    INSERT INTO asistencia_alumno VALUES(2113,1213,63);
    INSERT INTO asistencia_alumno VALUES(2113,1214,48);
    INSERT INTO asistencia_alumno VALUES(2113,1215,40);
    --
    INSERT INTO asistencia_alumno VALUES(2114,1211,98);
    INSERT INTO asistencia_alumno VALUES(2114,1212,90);
    INSERT INTO asistencia_alumno VALUES(2114,1213,89);
    INSERT INTO asistencia_alumno VALUES(2114,1214,80);
    INSERT INTO asistencia_alumno VALUES(2114,1215,88);
    --
    INSERT INTO asistencia_alumno VALUES(2211,1211,64);
    INSERT INTO asistencia_alumno VALUES(2211,1212,44);
    INSERT INTO asistencia_alumno VALUES(2211,1213,98);
    INSERT INTO asistencia_alumno VALUES(2211,1214,73);
    INSERT INTO asistencia_alumno VALUES(2211,1215,77);
    --
    INSERT INTO asistencia_alumno VALUES(2221,1211,98);
    INSERT INTO asistencia_alumno VALUES(2221,1212,99);
    INSERT INTO asistencia_alumno VALUES(2221,1213,90);
    INSERT INTO asistencia_alumno VALUES(2221,1214,92);
    INSERT INTO asistencia_alumno VALUES(2221,1215,65);
-----notas (ugh x2)
    INSERT INTO nota_alumno VALUES(2111,1211,5.5,5,4.5,3.6,3.7);
    INSERT INTO nota_alumno VALUES(2111,1212,4.6,6.6,3.4,5,4.4);
    INSERT INTO nota_alumno VALUES(2111,1213,4,4.1,4.2,4,3.8);
    INSERT INTO nota_alumno VALUES(2111,1214,5,4.5,4.4,4.2,NULL);
    INSERT INTO nota_alumno VALUES(2111,1215,6.3,2.8,2.7,2.5,NULL);

    INSERT INTO nota_alumno VALUES(2112,1211,6.7,6.8,7,7,6.8);
    INSERT INTO nota_alumno VALUES(2112,1212,6.8,6.9,7,6.4,6.2);
    INSERT INTO nota_alumno VALUES(2112,1213,7,7,7,7,NULL);
    INSERT INTO nota_alumno VALUES(2112,1214,6.7,6.9,5.8,6.9,NULL);
    INSERT INTO nota_alumno VALUES(2112,1215,6.9,7,6.8,6.6,NULL);

    INSERT INTO nota_alumno VALUES(2113,1211,2.5,3.7,4.8,4.4,NULL);
    INSERT INTO nota_alumno VALUES(2113,1212,3.5,3.6,3.3,NULL,2.2);
    INSERT INTO nota_alumno VALUES(2113,1213,2.4,2.4,2.2,2.1,NULL);
    INSERT INTO nota_alumno VALUES(2113,1214,3.3,3.4,3.5,3.2,NULL);
    INSERT INTO nota_alumno VALUES(2113,1215,2.2,2.1,2.3,2.2,NULL);

    INSERT INTO nota_alumno VALUES(2114,1211,4.5,4.4,4.3,4.2,4.9);
    INSERT INTO nota_alumno VALUES(2114,1212,4,4,4.2,3.9,3.9);
    INSERT INTO nota_alumno VALUES(2114,1213,4.4,4.3,4.1,4,NULL);
    INSERT INTO nota_alumno VALUES(2114,1214,5.4,5.2,4.4,4.3,NULL);
    INSERT INTO nota_alumno VALUES(2114,1215,3.4,3.5,4.4,4.4,NULL);

    INSERT INTO nota_alumno VALUES(2211,1211,6.5,6.6,6.7,6.8,NULL);
    INSERT INTO nota_alumno VALUES(2211,1212,5.3,4.2,4.4,3.9,4);
    INSERT INTO nota_alumno VALUES(2211,1213,3.5,2.9,3.5,4.5,NULL);
    INSERT INTO nota_alumno VALUES(2211,1214,2.4,3.3,4.5,5.6,NULL);
    INSERT INTO nota_alumno VALUES(2211,1215,4.1,4.2,4,4.2,NULL);

    INSERT INTO nota_alumno VALUES(2221,1211,6.7,6.8,6.9,7,7);
    INSERT INTO nota_alumno VALUES(2221,1212,6.9,6.8,6.6,6.4,5.5);
    INSERT INTO nota_alumno VALUES(2221,1213,5.6,5.5,5.7,6.8,NULL);
    INSERT INTO nota_alumno VALUES(2221,1214,7,7,7,7,NULL);
    INSERT INTO nota_alumno VALUES(2221,1215,4.6,5.5,5.6,6.6,NULL);

SELECT ASA.* FROM asistencia_alumno ASA, alumno A WHERE A.pnombre='FRANCISCO' AND A.appat='ZÁRATE' AND ASA.cod_alumno = A.cod_alumno;

SELECT NA.* FROM nota_alumno NA, alumno A WHERE A.pnombre='FRANCISCA' AND A.appat='PEÑA' AND NA.cod_alumno = A.cod_alumno;

SELECT ASA.*, A.pnombre, A.appat FROM asistencia_alumno ASA, alumno A WHERE porc_asistencia=100 AND ASA.cod_alumno = A.cod_alumno;

