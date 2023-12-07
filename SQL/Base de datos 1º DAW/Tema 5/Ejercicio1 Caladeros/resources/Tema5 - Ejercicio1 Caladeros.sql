// CREAMOS LAS TABLAS

CREATE TABLE barcos (
    matricula_barcos VARCHAR2(100) PRIMARY KEY,
    nombre VARCHAR2(100),
    clase VARCHAR2(100),
    armador VARCHAR2(100),
    capacidad INT,
    nacionalidad VARCHAR2(100)
    );
    
CREATE TABLE lotes (
    codigo_lotes INT PRIMARY KEY,
    matricula_barcos VARCHAR2(100),
    num_kg NUMBER(9,2),
    precio_kg_salida NUMBER(9,2),
    precio_kg_vendido NUMBER(9,2),
    fecha_venta DATE,
    cod_especie INT
    );
    
CREATE TABLE especies (
    codigo_especies INT PRIMARY KEY,
    nombre_especies VARCHAR2(100),
    tipo VARCHAR2(100),
    cupo_barco NUMBER(9,2),
    caladero_ppal VARCHAR2(100)
    );

CREATE TABLE caladeros (
    codigo_caladeros INT PRIMARY KEY,
    nombre_caladeros VARCHAR2(100),
    ubicacion VARCHAR2(100),
    especie_ppal VARCHAR2(100)
    );
    
CREATE TABLE fechas_capturas (
    codigo_especies INT,
    codigo_caladeros INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    PRIMARY KEY (codigo_especies, codigo_caladeros)
    );
    
// FUNCIONAL HASTA AQUÍ.
    