DROP TABLE futbolistas CASCADE CONSTRAINTS;
DROP TABLE equipos CASCADE CONSTRAINTS;
DROP TABLE partidos CASCADE CONSTRAINTS;

CREATE TABLE futbolistas (
    id_futbolista INT,
    nombre_futbolista VARCHAR2(100),
    apellidos VARCHAR2(100),
    fecha_nacimiento DATE,
    posicion VARCHAR2(100),
    salario NUMBER(10,2),
    PRIMARY KEY(id_futbolista)
    );

CREATE TABLE equipos (
    id_equipo INT,
    nombre_equipo VARCHAR2(100),
    estadio VARCHAR2(100),
    presupuesto NUMBER(12,2),
    PRIMARY KEY(id_equipo)
    );
    
CREATE TABLE partidos (
    id_partido INT,
    arbitro VARCHAR2(100),
    resultado INT CHECK (REGEXP_LIKE(resultado,'[99-99]')),
    estadio VARCHAR2(100),
    fecha_partido DATE,
    PRIMARY KEY(id_partido)
    );
    
ALTER TABLE futbolistas 
    ADD CHECK (posicion IN ('portero','delantero','mediocentro','defensa'));
    
ALTER TABLE futbolistas
    ADD CHECK (REGEXP_LIKE(id_futbolista,'[F][0-9][0-9][0-9][0-9][0-9]'));
    
ALTER TABLE futbolistas
    ADD CHECK (salario > 50000);
    
ALTER TABLE futbolistas
    ADD CHECK (fecha_nacimiento > DATE '1978-01-01');
    
INSERT INTO equipos VALUES (1,'sevilla','ramon sanchez pizjuan',500000000);
INSERT INTO equipos VALUES (2,'betis','benito villamarin',550000000);
INSERT INTO equipos VALUES (3,'barcelona','camp nou',800000000);
    

    
    