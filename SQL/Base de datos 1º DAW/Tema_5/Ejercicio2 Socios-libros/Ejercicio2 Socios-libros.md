######  *EJERCICIO 2 SOCIOS - LIBROS - Juan Gabriel Sánchez - 1º desarrollo de aplicaciones WEB.*<hr>
<br>

<span style="display: flex; justify-content: center;">![Imagen peliculas](img/imagen_libros.png)</span>

## ENUNCIADO
Ejercicio 3 - Socios - Libros [PDF](resources/Enunciado.pdf)
## RECURSOS
Archivo SQL [DESCARGAR](resources/Ejercicio2%20Socios-libros.sql)
## CÓDIGO

```
DROP TABLE socios CASCADE CONSTRAINTS;
DROP TABLE libros CASCADE CONSTRAINTS;
DROP TABLE prestamos CASCADE CONSTRAINTS;

CREATE TABLE socios (
    cod_socio CHAR(8) PRIMARY KEY CHECK(REGEXP_LIKE(cod_socio,'S[0-9][0-9][0-9][0-9][0-9]24')),
    dni CHAR(9) CHECK(REGEXP_LIKE(DNI,'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]')),
    nombre VARCHAR2(100),
    apellidos VARCHAR2(100),
    direccion VARCHAR2(300),
    telefono NUMBER(9)
);

CREATE TABLE libros (
    isbn CHAR(17) PRIMARY KEY CHECK(REGEXP_LIKE(isbn,'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]isbn')),
    titulo VARCHAR2(200),
    editorial VARCHAR2(50),
    ano_publicacion INT,
    autores VARCHAR2(300),
    ano_edicion INT,
    deteriorado CHAR(2) CHECK(deteriorado LIKE 'si' OR deteriorado LIKE 'no')
);

CREATE TABLE prestamos (
    cod_socio CHAR(8) CHECK(REGEXP_LIKE(cod_socio,'S[0-9][0-9][0-9][0-9][0-9]24')),
    isbn CHAR(17) CHECK(REGEXP_LIKE(isbn,'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]isbn')),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    fecha_real_devolucion DATE,
    PRIMARY KEY(cod_socio, isbn)
);

ALTER TABLE prestamos
    ADD FOREIGN KEY(cod_socio)
    REFERENCES socios(cod_socio) ON DELETE SET NULL; 
    
ALTER TABLE prestamos
    ADD FOREIGN KEY(isbn)
    REFERENCES libros(isbn) ON DELETE SET NULL;
    
//La fecha de devolución tiene que ser mayor que la fecha de préstamo exactamente en 15 días.

ALTER TABLE prestamos
    ADD CHECK (fecha_devolucion = fecha_prestamo + 15);
    
//La fecha real devolución puede ser mayor o igual que la fecha de préstamo.

ALTER TABLE prestamos
    ADD CHECK (fecha_real_devolucion >= fecha_prestamo);
    
// La fecha real devolución puede ser mayor que la fecha de devolución.
// Aquí no ponemos CHECK ya que el libro lo puede devolver antes de la fecha de devolución.

// Crea un par de socios.

INSERT INTO socios VALUES ('S0000124','45852145F','Pedro','Almodóvar','41950 c\Blas Infante 20',987654321);
INSERT INTO socios VALUES ('S0000224','74125895F','Alberto','Martín','41110 c\Cloud 2',123456789);

// Incluye tres libros en su tabla correspondiente.

INSERT INTO libros VALUES ('1234567891012isbn','El Señor de los anillos','Trompa',1954,'J.R Tolkien',1955,'no');
INSERT INTO libros VALUES ('1234554891012isbn','Harry Potter','Lucider',1988,'J.K Rowling',1991,'si');
INSERT INTO libros VALUES ('9934567891012isbn','Como agua para chocolate','Mandor',1977,'Laura Esquivel',1978,'no');

// El primer socio hace lo siguiente: Saca un libro y lo entrega tarde.

INSERT INTO prestamos VALUES ('S0000124','9934567891012isbn',DATE'2024-01-02',DATE'2024-01-17',DATE'2024-01-20');

//  Saca otro libro un mes después (ya que ha tenido suspensión por retraso) y lo devuelve un día antes de la fecha de devolución.

INSERT INTO prestamos VALUES ('S0000124','1234567891012isbn',DATE'2024-02-02',DATE'2024-02-17',DATE'2024-02-16');

// El segundo socio saca un libro y lo devuelve correctamente en fecha.

INSERT INTO prestamos VALUES ('S0000224','1234554891012isbn',DATE'2024-02-02',DATE'2024-02-17',DATE'2024-02-17');

// Modifica el nombre y apellidos de los dos socios.

UPDATE socios
    SET nombre = 'Manolo', apellidos = 'Ruiz'
    WHERE cod_socio = 'S0000124';
    
UPDATE socios
    SET nombre = 'Fernando', apellidos = 'Sánchez'
    WHERE cod_socio = 'S0000224';
    
// Cambia el año de edición de los tres libros por 2018.

UPDATE libros
    SET ano_edicion = 2018;

// Uno de los préstamos a acabado deteriorando uno de los libros.

UPDATE libros
    SET deteriorado = 'si'
    WHERE isbn = '1234567891012isbn';
```