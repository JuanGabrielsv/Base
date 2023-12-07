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
    
// FUNCIONAL HASTA AQUÍ.


    