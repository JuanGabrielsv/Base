DROP TABLE barcos CASCADE CONSTRAINTS;
DROP TABLE caladeros CASCADE CONSTRAINTS;
DROP TABLE especies CASCADE CONSTRAINTS;
DROP TABLE fechas_capturas CASCADE CONSTRAINTS;
DROP TABLE lotes CASCADE CONSTRAINTS;
// CREAMOS LAS TABLAS

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
    
 // FUNCIONAL HASTA AQUÍ.
    
