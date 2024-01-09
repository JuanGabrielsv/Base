DROP TABLE plantas CASCADE CONSTRAINTS;
DROP TABLE socios CASCADE CONSTRAINTS;
DROP TABLE compras CASCADE CONSTRAINTS;


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
    numero VARCHAR2(100) PRIMARY KEY CHECK (REGEXP_LIKE(numero,'SOC[0-9][0-9][0-9][0-9][0-9]') OR (REGEXP_LIKE(numero,'NOSOCIO'))),
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
    identificador_cliente VARCHAR2(100) CHECK (REGEXP_LIKE(identificador_cliente,'SOC[0-9][0-9][0-9][0-9][0-9]') OR (REGEXP_LIKE(identificador_cliente,'NOSOCIO'))),
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
INSERT INTO compras VALUES ('REF00001','SOC00001','R001-2024',DATE'2024-01-09','Efectivo');
UPDATE plantas
    SET stock = 24
    WHERE referencia = 'R001-2024';
    
// El socio B realizará dos compras de la misma planta en días distintos (diferente planta que la comprada por el socio A).

INSERT INTO socios VALUES ('SOC00002','Pepito','López','Calle Laurel','41950','Castilleja de la Cuesta','Sevilla','258963147','wakafote@gmail.com');
INSERT INTO compras VALUES ('REF00002','SOC00002','R002-2024',DATE'2024-01-04','Transferencia');
UPDATE plantas
    SET stock = 19
    WHERE referencia = 'R002-2024';
    
INSERT INTO compras VALUES ('REF00003','SOC00002','R002-2024',DATE'2024-01-06','Transferencia');
UPDATE plantas
    SET stock = 18
    WHERE referencia = 'R002-2024';
    
// Un cliente no socio realizará una compra de una planta.

INSERT INTO socios VALUES ('NOSOCIO','Lorena','Díaz','Calle Rockero Silvio','41110','Sevilla','Sevilla','667258654','Lorena1998@gmail.com');
INSERT INTO compras VALUES ('REF00004','NOSOCIO','R003-2024',DATE'2024-01-05','Tarjeta');
UPDATE plantas
    SET stock = 29
    WHERE referencia = 'R003-2024';

// Modifica el campo flor de un producto y el email del socio A.

UPDATE plantas
    SET flor = 'no'
    WHERE referencia = 'R001-2024';
UPDATE socios
    SET email = 'maracuya@yahoo.com'
    WHERE numero = 'SOC00001';
    
// Borrar todas las compras de los no socios.

DELETE FROM compras
        WHERE identificador_cliente = 'NOSOCIO';
