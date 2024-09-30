DROP TABLE futbolistas CASCADE CONSTRAINTS;
DROP TABLE equipos CASCADE CONSTRAINTS;
DROP TABLE partidos CASCADE CONSTRAINTS;

CREATE TABLE futbolistas (
    id_futbolista VARCHAR2(50),
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
    resultado VARCHAR2(100) CHECK (REGEXP_LIKE(resultado,'[0-9]-[0-9]')),
    estadio VARCHAR2(100),
    fecha_partido DATE,
    PRIMARY KEY(id_partido)
    );
    
ALTER TABLE futbolistas
    ADD id_equipo INT
    ADD FOREIGN KEY (id_equipo)
    REFERENCES equipos(id_equipo);
    
ALTER TABLE partidos
    ADD id_equipo INT
    ADD FOREIGN KEY (id_equipo)
    REFERENCES equipos(id_equipo);
    
ALTER TABLE futbolistas 
    ADD CHECK (posicion IN ('portero','delantero','mediocentro','defensa'));
    
ALTER TABLE futbolistas
    ADD CHECK (REGEXP_LIKE(id_futbolista,'[F][0-9][0-9][0-9][0-9][0-9]'));
    
ALTER TABLE futbolistas
    ADD CHECK (salario > 50000);
    
ALTER TABLE futbolistas
    ADD CHECK (fecha_nacimiento > DATE '1978-01-01');
    
INSERT INTO equipos VALUES (1,'Sevilla','Ram�n S�nchez Pizju�n',500000000);
INSERT INTO equipos VALUES (2,'Betis','Benito Villamar�n',550000000);
INSERT INTO equipos VALUES (3,'Barcelona','Camp Nou',800000000);

INSERT INTO futbolistas VALUES ('F00123','Sergio','Rico',DATE'1992-05-23','portero',60000,1);
INSERT INTO futbolistas VALUES ('F00223','Mariano','D�az',DATE'1993-06-15','delantero',55000,1);
INSERT INTO futbolistas VALUES ('F00323','Ivan','Rakitic',DATE'1989-02-08','mediocentro',75000,1);
INSERT INTO futbolistas VALUES ('F00423','Claudio','Bravo',DATE'1991-01-18','portero',55000,2);
INSERT INTO futbolistas VALUES ('F00523','Guido','Rodriguez',DATE'1990-12-12','mediocentro',51000,2);
INSERT INTO futbolistas VALUES ('F00623','Assane','Diao',DATE'1989-06-05','delantero',88000,2);
INSERT INTO futbolistas VALUES ('F00723','Ander','Astralaga',DATE'1995-08-05','portero',51000,3);
INSERT INTO futbolistas VALUES ('F00823','I�igo','Martinez',DATE'1996-07-02','defensa',62000,3);
INSERT INTO futbolistas VALUES ('F00923','Ferran','Torres',DATE'1997-05-26','delantero',58000,3);

//SEVILLA VS BETIS
INSERT INTO partidos VALUES (1,'Ricardo de Burgos','3-0','Ram�n S�nchez Pizju�n',DATE'2023-03-12',1);
INSERT INTO partidos VALUES (2,'Ricardo de Burgos','3-0','Ram�n S�nchez Pizju�n',DATE'2023-03-12',2);
INSERT INTO partidos VALUES (3,'Carlos del Cerro','0-8','Benito Villamar�n',DATE'2023-03-26',1);
INSERT INTO partidos VALUES (4,'Carlos del Cerro','0-8','Benito Villamar�n',DATE'2023-03-26',2);
//SEVILLA VS BARCELONA
INSERT INTO partidos VALUES (5,'Carlos del Cerro','5-0','Ram�n S�nchez Pizju�n',DATE'2023-03-18',1);
INSERT INTO partidos VALUES (6,'Carlos del Cerro','5-0','Ram�n S�nchez Pizju�n',DATE'2023-03-18',3);
INSERT INTO partidos VALUES (7,'Jes�s Gil Manzano','0-5','Camp Nou',DATE'2023-04-16',1);
INSERT INTO partidos VALUES (8,'Jes�s Gil Manzano','0-5','Camp Nou',DATE'2023-04-16',3);
//BETIS VS BARCELONA
INSERT INTO partidos VALUES (9,'Ricardo de Burgos','3-3','Benito Villamar�n',DATE'2023-05-15',2);
INSERT INTO partidos VALUES (10,'Ricardo de Burgos','3-3','Benito Villamar�n',DATE'2023-05-15',3);
INSERT INTO partidos VALUES (11,'Ricardo de Burgos','0-0','Camp Nou',DATE'2023-03-12',2);
INSERT INTO partidos VALUES (12,'Ricardo de Burgos','0-0','Camp Nou',DATE'2023-03-12',3);
//Cambia 3 jugadores de equipo (fichajes de invierno).
UPDATE futbolistas
    SET id_equipo = 2, salario = 65000
    WHERE id_futbolista = 'F00123'; 
UPDATE futbolistas
    SET id_equipo = 1, salario = 66000
    WHERE id_futbolista = 'F00423';
UPDATE futbolistas
    SET id_equipo = 1, salario = 55000
    WHERE id_futbolista = 'F00823';
//Al final de la liga se retiran 2 jugadores, b�rralos de la tabla futbolistas.
DELETE FROM futbolistas
    WHERE id_futbolista = 'F00123';
DELETE FROM futbolistas
    WHERE id_futbolista = 'F00923';
