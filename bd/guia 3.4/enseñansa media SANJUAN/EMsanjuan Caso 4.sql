DROP TABLE horario_prof;
DROP TABLE prom_asign_alumn;
DROP TABLE prom_fin_alumn;
DROP TABLE alumno;
DROP TABLE profesor;
DROP TABLE asignatura;
DROP TABLE curso;

DROP SEQUENCE SQ_profe;
DROP SEQUENCE SQ_horario;
-------- Sequences --------
CREATE SEQUENCE SQ_profe
    INCREMENT BY 5
    START WITH 5
    MAXVALUE 99999
    MINVALUE 1
    NOCYCLE
    NOCACHE;
CREATE SEQUENCE SQ_horario;
------ Generales -----------
CREATE TABLE profesor(
    --id_prof NUMBER(5) NOT NULL
    cod_prof NUMBER(5) NOT NULL
    ,rut_prof NUMBER(10) NOT NULL
    ,dv_prof CHAR(1) NOT NULL
    ,pnom_prof VARCHAR2(25) NOT NULL
    ,snom_prof VARCHAR2(25) NULL
    ,appat_prof VARCHAR2(25) NOT NULL
    ,apmat_prof VARCHAR2(25) NOT NULL
    ,sueldo_base NUMBER(7) NOT NULL
    ------- KEY CONSTRAINTS ---------
    ,CONSTRAINT PK_profesor PRIMARY KEY(cod_prof)
);
CREATE TABLE curso(
    --id_curso NUMBER(5) NOT NULL
    cod_curso NUMBER(5) NOT NULL
    ,sigla_curso VARCHAR2(10) NOT NULL
    ,descripcion VARCHAR2(25) NOT NULL
    ------- KEY CONSTRAINTS ---------
    ,CONSTRAINT PK_curso PRIMARY KEY(cod_curso)
);
CREATE TABLE asignatura(
    --id_asign NUMBER(5) NOT NULL
    cod_asign NUMBER(4) NOT NULL
    ,sigle_asign VARCHAR2(10) NOT NULL
    ,nombre VARCHAR2(30) NOT NULL
    ,observacion VARCHAR2(30) NOT NULL
    ,porc_asist_min NUMBER(3) NOT NULL
    ,min_notas NUMBER(3) NOT NULL
    ,horas_sem NUMBER(2) NOT NULL
    ------- KEY CONSTRAINTS ---------
    ,CONSTRAINT PK_asign PRIMARY KEY(cod_asign)
);
CREATE TABLE alumno(
    --id_alumn NUMBER(5) NOT NULL
    cod_alumn NUMBER(5) NOT NULL
    ,rut_alumn NUMBER(10) NOT NULL
    ,dv_alumn CHAR(1) NOT NULL
    ,pnom_alumn VARCHAR2(25) NOT NULL
    ,snom_alumn VARCHAR2(25) NULL
    ,appat_alumn VARCHAR2(25) NOT NULL
    ,apmat_alumn VARCHAR2(25) NOT NULL
    ,becado CHAR(1) NULL
    ,CURSO_cod_curso NUMBER(5) NOT NULL
    ------- KEY CONSTRAINTS ---------
    ,CONSTRAINT PK_alumno PRIMARY KEY(cod_alumn)
    ,CONSTRAINT FK_cur_alumn FOREIGN KEY(CURSO_cod_curso) REFERENCES curso(cod_curso)
);
------ Intermedias ---------
CREATE TABLE prom_asign_alumn(
    ALUMNO_cod_alumn NUMBER(5) NOT NULL
    ,ASIGN_cod_asign NUMBER(5) NOT NULL
    ,prom_asign NUMBER(2,1) NULL
    ,situacion_asign CHAR(1) NOT NULL
    ------- KEY CONSTRAINTS ---------
    ,CONSTRAINT PK_prom_asign_alumn PRIMARY KEY(ALUMNO_cod_alumn,ASIGN_cod_asign)
    ,CONSTRAINT FK_prom_asign_alumn_alumn FOREIGN KEY(ALUMNO_cod_alumn) REFERENCES alumno(cod_alumn)
    ,CONSTRAINT FK_prom_asign_alumn_asign FOREIGN KEY(ASIGN_cod_asign) REFERENCES asignatura(cod_asign)
);
CREATE TABLE prom_fin_alumn(
    id_prom_fin_alumn NUMBER(5) NOT NULL
    ,ALUMNO_cod_alumn NUMBER(5) NOT NULL
    ,CURSO_cod_curso NUMBER(5) NOT NULL
    ,prom_fin NUMBER(2,1) NOT NULL
    ,situacion_fin CHAR(1) NOT NULL
    ------- KEY CONSTRAINTS ---------
    ,CONSTRAINT PK_prom_fin_alum PRIMARY KEY(id_prom_fin_alumn,ALUMNO_cod_alumn,CURSO_cod_curso)
    ,CONSTRAINT FK_prom_fin_alum_alumn FOREIGN KEY(ALUMNO_cod_alumn) REFERENCES alumno(cod_alumn)
    ,CONSTRAINT FK_prom_fin_alum_asign FOREIGN KEY(CURSO_cod_curso) REFERENCES curso(cod_curso)
);
CREATE TABLE horario_prof(
    id_horario NUMBER(5) NOT NULL
    ,PROF_cod_prof NUMBER(5) NOT NULL
    ,ASIGN_cod_asign NUMBER(5) NOT NULL
    ,CURSO_cod_curso NUMBER(5) NOT NULL
    ,dia_semana VARCHAR2(10) NOT NULL
    ,hora_inicio VARCHAR2(5) NOT NULL
    ,hora_termino VARCHAR2(5) NOT NULL
    ------- KEY CONSTRAINTS ---------
    ,CONSTRAINT PK_horario_prof PRIMARY KEY(id_horario,PROF_cod_prof,ASIGN_cod_asign,CURSO_cod_curso)
    ,CONSTRAINT FK_horario_prof_prof FOREIGN KEY(PROF_cod_prof) REFERENCES profesor(cod_prof)
    ,CONSTRAINT FK_horario_prof_asign FOREIGN KEY(ASIGN_cod_asign) REFERENCES asignatura(cod_asign)
    ,CONSTRAINT FK_horario_prof_curso FOREIGN KEY(CURSO_cod_curso) REFERENCES curso(cod_curso)
);
------ Poblando Tablas -----
    ------ Curso ------
        INSERT INTO curso VALUES (211,'PMA','PRIMERO MEDIO A');
        INSERT INTO curso VALUES (212,'PMB','PRIMERO MEDIO B');
        INSERT INTO curso VALUES (221,'SMA','SEGUNDO MEDIO A');
        INSERT INTO curso VALUES (222,'SMB','SEGUNDO MEDIO B');
    ------- Asignatura ----------
        ------Primero Medio --------
            INSERT INTO asignatura VALUES (1211,'MATEM','MATEMÁTICAS','ASIG. PRIMERO MEDIO',90,5,10);
            INSERT INTO asignatura VALUES (1212,'LENG','LENGUAJE','ASIG. PRIMERO MEDIO',90,5,10);
            INSERT INTO asignatura VALUES (1213,'ING','INGLES','ASIG. PRIMERO MEDIO',70,4,8);
            INSERT INTO asignatura VALUES (1214,'ED.FIS','EDUCAIÓN FÍSICA','ASIG. PRIMERO MEDIO',70,4,7);
            INSERT INTO asignatura VALUES (1215,'FIS','FÍSICA','ASIG. PRIMERO MEDIO',66,4,5);
        ------Segundo Medio --------
            INSERT INTO asignatura VALUES (2211,'MATEM2','MATEMÁTICAS 2','ASIG. SEGUNDO MEDIO',90,5,10);
            INSERT INTO asignatura VALUES (2212,'LENG2','LENGUAJE 2','ASIG. SEGUNDO MEDIO',90,5,10);
            INSERT INTO asignatura VALUES (2213,'ING2','INGLES 2','ASIG. SEGUNDO MEDIO',70,4,8);
            INSERT INTO asignatura VALUES (2214,'ED.FIS2','EDUCAIÓN FÍSICA 2','ASIG. SEGUNDO MEDIO',70,4,7);
            INSERT INTO asignatura VALUES (2215,'FIS2','FÍSICA 2','ASIG. SEGUNDO MEDIO',66,4,5);
    ----------- Alumno ----------
        INSERT INTO alumno VALUES (2111,18012987,'1','JUAN','PABLO','ZÁRATE','POBLETE','S',211);
        INSERT INTO alumno VALUES (2112,19983767,'K','MARÍA',NULL,'JARA','SOTO','S',211);
        INSERT INTO alumno VALUES (2113,19243861,'8','SONIA','ISABEL','TOLEDO','MUÑOS','S',211);
        INSERT INTO alumno VALUES (2114,20997232,'7','SERGIO','RAFAEL','ARAVENA','ARAYA',NULL,211);
        INSERT INTO alumno VALUES (2211,18777666,'6','FRANCISCA',NULL,'PEÑA','ACEVEDO',NULL,221);
        INSERT INTO alumno VALUES (2221,18998111,'1','FRANCISCO','JAVIER','ZÁRATE','DONOSO','S',222);
    ---------- Profesor ---------
        INSERT INTO profesor VALUES (SQ_profe.NEXTVAL,13097654,'0','JUAN','FRANCISCO','TOLEDO','SEGURA',250000);
        INSERT INTO profesor VALUES (SQ_profe.NEXTVAL,14765234,'K','SOFIA',NULL,'GODOY','ARAVENA',250000);
        INSERT INTO profesor VALUES (SQ_profe.NEXTVAL,12876345,'3','PABLO','ALEJANDRO','FIGUEROA','RUBILAR',200000);
        INSERT INTO profesor VALUES (SQ_profe.NEXTVAL,12934666,'9','MARIANA','ISABEL','SAMPAOLI','BIELSA',200000);
        INSERT INTO profesor VALUES (SQ_profe.NEXTVAL,15436789,'K','MARIANA','ISABEL','SAMPAOLI','BIELSA',200000);
        INSERT INTO profesor VALUES (SQ_profe.NEXTVAL,14234987,'5','JUAN','ENRIQUE','PERALTA','CINFUEGOS',200000);
        INSERT INTO profesor VALUES (SQ_profe.NEXTVAL,13098567,'3','FRANCISCO','GUSTAVO','MALDONADO','MUJICA',230000);
        INSERT INTO profesor VALUES (SQ_profe.NEXTVAL,13476958,'8','CLAUDIO','MAURCIO','SOLAR','RIFFO',200000);
        INSERT INTO profesor VALUES (SQ_profe.NEXTVAL,14567890,'2','MARCELA',NULL,'ULLOA','HERRERA',185000);
    ---------- Promedio Asignatura Alumno -----------
        -------- alumno 1 -------
            INSERT INTO prom_asign_alumn VALUES (2111,1211,4.5,'R');
            INSERT INTO prom_asign_alumn VALUES (2111,1212,4.5,'A');
            INSERT INTO prom_asign_alumn VALUES (2111,1213,4,'R');
            INSERT INTO prom_asign_alumn VALUES (2111,1214,4.3,'A');
            INSERT INTO prom_asign_alumn VALUES (2111,1215,3.6,'R');
        -------- alumno 2 -------
            INSERT INTO prom_asign_alumn VALUES (2112,1211,6.9,'A');
            INSERT INTO prom_asign_alumn VALUES (2112,1212,6.7,'A');
            INSERT INTO prom_asign_alumn VALUES (2112,1213,7,'A');
            INSERT INTO prom_asign_alumn VALUES (2112,1214,6.6,'A');
            INSERT INTO prom_asign_alumn VALUES (2112,1215,6.8,'A');
        -------- alumno 3 -------
            INSERT INTO prom_asign_alumn VALUES (2113,1211,7,'A');
            INSERT INTO prom_asign_alumn VALUES (2113,1212,7,'A');
            INSERT INTO prom_asign_alumn VALUES (2113,1213,3.9,'R');
            INSERT INTO prom_asign_alumn VALUES (2113,1214,3.9,'R');
            INSERT INTO prom_asign_alumn VALUES (2113,1215,3.8,'R');
        -------- alumno 4 -------
            INSERT INTO prom_asign_alumn VALUES (2114,1211,4.4,'R');
            INSERT INTO prom_asign_alumn VALUES (2114,1212,4,'R');
            INSERT INTO prom_asign_alumn VALUES (2114,1213,4.9,'A');
            INSERT INTO prom_asign_alumn VALUES (2114,1214,4.8,'A');
            INSERT INTO prom_asign_alumn VALUES (2114,1215,3.9,'R');
        -------- alumno 5 -------
            INSERT INTO prom_asign_alumn VALUES (2211,2211,6.1,'A');
            INSERT INTO prom_asign_alumn VALUES (2211,2212,4.4,'R');
            INSERT INTO prom_asign_alumn VALUES (2211,2213,3.6,'R');
            INSERT INTO prom_asign_alumn VALUES (2211,2214,4,'R');
            INSERT INTO prom_asign_alumn VALUES (2211,2215,4.1,'A');
        -------- alumno 6 -------
            INSERT INTO prom_asign_alumn VALUES (2221,2211,6.9,'A');
            INSERT INTO prom_asign_alumn VALUES (2221,2212,6.4,'A');
            INSERT INTO prom_asign_alumn VALUES (2221,2213,5.9,'A');
            INSERT INTO prom_asign_alumn VALUES (2221,2214,7,'A');
            INSERT INTO prom_asign_alumn VALUES (2221,2215,3.8,'R');
    ------- Horario Profesor -----------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,5,1211,211,'LUNES','08:00','10:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,5,1211,211,'MARTES','08:00','10:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,5,1211,211,'JUEVES','08:00','09:30');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,5,1211,211,'VIERNES','08:00','09:30');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,10,1212,211,'LUNES','10:30','12:45');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,10,1212,211,'MARTES','10:30','12:45');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,10,1212,211,'JUEVES','10:30','12:00');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,10,1212,211,'VIERNES','10:30','12:00');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,15,1213,211,'MARTES','14:00','15:30');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,15,1213,211,'MIERCOLES','08:00','10:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,15,1213,211,'VIERNES','14:00','16:15');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,20,1214,211,'MIERCOLES','14:00','16:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,20,1214,211,'JUEVES','14:00','17:00');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,40,1215,211,'LUNES','14:00','16:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,40,1215,211,'MIERCOLES','10:30','12:00');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,5,2211,221,'LUNES','10:30','12:45');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,5,2211,221,'MARTES','10:30','12:45');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,5,2211,221,'JUEVES','10:30','12:00');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,5,2211,221,'VIERNES','10:30','12:00');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,25,2212,221,'LUNES','08:00','10:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,25,2212,221,'MARTES','08:00','10:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,25,2212,221,'JUEVES','08:00','09:30');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,25,2212,221,'VIERNES','08:00','09:30');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,15,2213,221,'LUNES','14:00','16:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,15,2213,221,'MIERCOLES','10:30','12:45');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,15,2213,221,'VIERNES','14:00','15:30');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,30,2214,221,'MIERCOLES','14:00','17:00');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,30,2214,221,'VIERNES','16:15','18:30');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,40,2215,221,'MARTES','08:00','10:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,40,2215,221,'MIERCOLES','14:00','15:30');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,35,2211,222,'LUNES','08:00','10:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,35,2211,222,'MARTES','08:00','10:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,35,2211,222,'JUEVES','08:00','09:30');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,35,2211,222,'VIERNES','08:00','09:30');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,25,2212,222,'LUNES','10:30','12:45');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,25,2212,222,'MARTES','10:30','12:45');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,25,2212,222,'JUEVES','10:30','12:00');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,25,2212,222,'VIERNES','10:30','12:00');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,45,2213,222,'LUNES','14:00','16:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,45,2213,222,'MIERCOLES','10:30','12:45');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,45,2213,222,'VIERNES','14:00','15:30');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,30,2214,222,'MARTES','14:00','17:00');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,30,2214,222,'JUEVES','16:15','16:30');
        ------
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,40,2215,222,'JUEVES','14:00','16:15');
        INSERT INTO horario_prof VALUES (SQ_horario.NEXTVAL,40,2215,222,'VIERNES','16:15','17:45');
        
SELECT A.* FROM alumno A, curso C WHERE C.cod_curso = A.CURSO_cod_curso AND C.sigla_curso = 'PMA';

SELECT * FROM asignatura WHERE porc_asist_min>=70;

SELECT HP.* FROM horario_prof HP, profesor P WHERE P.pnom_prof='FRANCISCO' AND P.appat_prof='MALDONADO' AND HP.PROF_cod_prof = P.cod_prof;

SELECT PA.* FROM prom_asign_alumn PA, alumno A WHERE A.pnom_alumn='JUAN' AND A.appat_alumn='ZÁRATE' AND PA.ALUMNO_cod_alumn = A.cod_alumn;

SELECT * FROM asignatura WHERE min_notas=5 AND observacion='ASIG. SEGUNDO MEDIO';

SELECT * FROM profesor ORDER BY appat_prof ASC, sueldo_base DESC;

SELECT * FROM alumno WHERE becado IS NULL;

SELECT HP.* FROM horario_prof HP, asignatura ASI WHERE ASI.sigle_asign='ED.FIS2' AND HP.ASIGN_cod_asign = ASI.cod_asign;
