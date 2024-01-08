DROP TABLE plantas CASCADE CONSTRAINTS;

CREATE TABLE plantas (
    referencia CHAR(9) CHECK (REGEXP_LIKE(referencia,'R[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')),
    nombre VARCHAR2(100) NOT NULL,
    familia VARCHAR2(100),
    flor CHAR(2),
    proveedor VARCHAR2(100) NOT NULL,
    precio NUMBER(*,2),
    stock INT
);

ALTER TABLE plantas
    ADD CHECK(flor IN ('si' OR 'no'));

/* CREATE TABLE plantas (
    referencia CHAR(9) CHECK (REGEXP_LIKE(referencia,'R[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')),
    nombre VARCHAR2(100),
    apellidos VARCHAR2(100),
    direccion VARCHAR2(200),
    codigo_postal INT,
    localidad VARCHAR2(100),
    provincia VARCHAR2(100),
    telefono CHAR(9),
    email VARCHAR2(100)
); */