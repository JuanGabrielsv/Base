CREATE TABLE barcos (
    matricula_barco VARCHAR2(100) PRIMARY KEY,
    nombre VARCHAR2(100),
    clase VARCHAR2(100),
    armador VARCHAR2(100),
    capacidad INT,
    nacionalidad VARCHAR2(100)
    );
    
CREATE TABLE lotes (
    codigo_lote INT PRIMARY KEY,
    matricula_barco VARCHAR2(100),
    num_kg NUMBER(9,2),
    precio_kg_salida NUMBER(9,2),
    precio_kg_vendido NUMBER(9,2),
    fecha_venta DATE,
    codigo_especie INT
    );
    
CREATE TABLE especies (
    codigo_especie INT PRIMARY KEY,
    nombre_especie VARCHAR2(100),
    tipo VARCHAR2(100),
    cupo_barco NUMBER(9,2),
    caladero_ppal VARCHAR2(100)
    );

CREATE TABLE caladeros (
    codigo_caladero INT PRIMARY KEY,
    nombre_caladero VARCHAR2(100),
    ubicacion VARCHAR2(100),
    especie_ppal VARCHAR2(100)
    );
    
CREATE TABLE fechas_capturas (
    codigo_especie INT,
    codigo_caladero INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    PRIMARY KEY (codigo_especie, codigo_caladero)
    );
    
ALTER TABLE lotes
    ADD FOREIGN KEY (matricula_barco)
    REFERENCES barcos(matricula_barco) ON DELETE CASCADE;

ALTER TABLE lotes 
    ADD FOREIGN KEY (codigo_especie)
    REFERENCES especies(codigo_especie) ON DELETE CASCADE;
    
ALTER TABLE especies
    MODIFY caladero_ppal INT;
    
ALTER TABLE especies 
    ADD FOREIGN KEY (caladero_ppal)
    REFERENCES caladeros(codigo_caladero); 

ALTER TABLE caladeros
    MODIFY especie_ppal INT;

ALTER TABLE caladeros
    ADD FOREIGN KEY (especie_ppal)
    REFERENCES especies(codigo_especie) ON DELETE SET NULL;
    
ALTER TABLE fechas_capturas
    ADD FOREIGN KEY (codigo_especie)
    REFERENCES especies(codigo_especie);
    
ALTER TABLE fechas_capturas
    ADD FOREIGN KEY (codigo_caladero)
    REFERENCES caladeros(codigo_caladero);

ALTER TABLE barcos
    MODIFY matricula_barco VARCHAR2(7);
    
ALTER TABLE barcos
    ADD CHECK (REGEXP_LIKE(matricula_barco, '[A-Z][A-Z]-[0-9][0-9][0-9][0-9]'));
    
ALTER TABLE lotes
    MODIFY fecha_venta NOT NULL;
    
ALTER TABLE lotes
    ADD CHECK (precio_kg_vendido > precio_kg_salida);
    
ALTER TABLE lotes
    ADD CHECK (num_kg > 0);
    
ALTER TABLE lotes
    ADD CHECK (precio_kg_vendido > 0);
    
ALTER TABLE lotes
    ADD CHECK (precio_kg_salida > 0);
    
ALTER TABLE caladeros
    ADD CHECK (nombre_caladero LIKE UPPER(nombre_caladero));

ALTER TABLE caladeros
    ADD CHECK (ubicacion LIKE UPPER (ubicacion));
    
ALTER TABLE fechas_capturas
    ADD CHECK (fecha_inicio NOT BETWEEN DATE '2023-02-02' AND DATE '2023-03-28');
    
ALTER TABLE fechas_capturas
    ADD CHECK (fecha_fin NOT BETWEEN DATE '2023-02-02' AND DATE '2023-03-28');
    
ALTER TABLE caladeros    
    ADD nombre_cientifico VARCHAR2(100);
    
INSERT INTO especies (codigo_especie,tipo) VALUES (1,'europea');
INSERT INTO especies VALUES(2,'esturion','peninsular',250,null);

INSERT INTO barcos (matricula_barco, nombre) VALUES ('FG-3465', 'calipso');
INSERT INTO barcos VALUES ('TR-6745','la rumiante','corveta','naval company',1700,'española');

INSERT INTO caladeros (codigo_caladero, nombre_caladero) VALUES (1,'LUBINAS B');
INSERT INTO caladeros VALUES (2,'SARDINAS C','LAS SALINAS','2','sardina pilchardus');

INSERT INTO fechas_capturas VALUES (2,2, DATE'2023-01-21', DATE'2023-02-01');
INSERT INTO fechas_capturas (codigo_especie, codigo_caladero) VALUES (1,1);

INSERT INTO lotes VALUES (1,'FG-3465',500,45.3,52.22,DATE'2023-04-11',2);
INSERT INTO lotes VALUES (2,'TR-6745',250,62.20,88.40,DATE'2023-04-12',1);

ALTER TABLE barcos
DROP COLUMN armador;

DROP TABLE barcos CASCADE CONSTRAINTS;
DROP TABLE caladeros CASCADE CONSTRAINTS;
DROP TABLE especies CASCADE CONSTRAINTS;
DROP TABLE fechas_capturas CASCADE CONSTRAINTS;
DROP TABLE lotes CASCADE CONSTRAINTS;



    
