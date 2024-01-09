DROP TABLE plantas CASCADE CONSTRAINTS;
DROP TABLE socios CASCADE CONSTRAINTS;
DROP TABLE compras CASCADE CONSTRAINTS;
DROP TABLE nosocios CASCADE CONSTRAINTS;

CREATE TABLE plantas (
    referencia CHAR(9) PRIMARY KEY CHECK (REGEXP_LIKE(referencia,'R[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')),
    nombre VARCHAR2(100) NOT NULL,
    familia VARCHAR2(100),
    flor CHAR(2) CHECK(flor IN('si','no')),
    proveedor VARCHAR2(100) NOT NULL,
    precio NUMBER(*,2) CHECK (precio >= 0),
    stock INT CHECK (stock >= 0)
);

CREATE TABLE socios (
    numero VARCHAR2(100) PRIMARY KEY CHECK (REGEXP_LIKE(numero,'SOC[0-9][0-9][0-9][0-9][0-9]')),
    nombre VARCHAR2(100),
    apellidos VARCHAR2(100),
    direccion VARCHAR2(200),
    codigo_postal INT,
    localidad VARCHAR2(100),
    provincia VARCHAR2(100),
    telefono CHAR(9),
    email VARCHAR2(100)
);

CREATE TABLE compras (
    referencia VARCHAR2(100) PRIMARY KEY CHECK (REGEXP_LIKE(referencia,'REF[0-9][0-9][0-9][0-9][0-9]')),
    identificador_cliente VARCHAR2(100) CHECK (REGEXP_LIKE(identificador_cliente,'SOC[0-9][0-9][0-9][0-9][0-9]')),
    identificador_planta CHAR(9),
    fecha_compra DATE,
    forma_de_pago VARCHAR2(100)
);

ALTER TABLE compras
    ADD FOREIGN KEY (identificador_cliente)
    REFERENCES socios(numero);
    
ALTER TABLE compras
    ADD FOREIGN KEY (identificador_planta)
    REFERENCES plantas(referencia);

// Incluye 3 plantas con todos sus campos rellenos.
    
INSERT INTO plantas VALUES ('R001-2024','Margarita','Asteráceas','si','Flor company',12.50,25);
INSERT INTO plantas VALUES ('R002-2024','Rosa','Rosaceae','si','Flor company',18.50,20);
INSERT INTO plantas VALUES ('R003-2024','Tulipán','Liliaceae','si','Tulipa corp',9.50,30);

// El socio A realizará una compra de una planta.

INSERT INTO socios VALUES ('SOC00001','Mauricio','Sánchez','Calle Paco','54852','Guillena','Sevilla','654987321','malacatones@yugu.es');
INSERT INTO compras(referencia,identificador_cliente) VALUES ('REF00001','SOC00001');


