<h1 style="font-size:12px">Comandos SQL</h1>

Comandos SQL:
```
- Cómo establecer una cuota en el tablespace y poder insertar datos -

ALTER USER nombreusuario QUOTA UNLIMITED ON nombretablespace;
Ej: ALTER USER daw QUOTA UNLIMITED ON users;

- Borrado de datos -

BEGIN
FOR cur_rec IN (SELECT table_name FROM user_tables)
LOOP
EXECUTE IMMEDIATE 'DROP TABLE ' || cur_rec.table_name || ' CASCADE CONSTRAINTS';
END LOOP;
END;
```
Crear tabla:
```
CREATE TABLE nombreTabla (
    nombreColumna1 datatype,
    nombreColumna2 datatype, 
    … 
    );
```
Añadir columna:
```
ALTER TABLE nombreTabla
    ADD nombreColumna datatype; 
```
Borrar columna:
```
ALTER TABLE nombreTabla
    DROP COLUMN nombreColumna; 
```
Renombrar columna:
```
ALTER TABLE nombreTabla
    RENAME COLUMN nombreColumna
    TO nuevoNombre; 
```
Borrar tabla:
```
DROP TABLE nombreTabla;
DROP TABLE nombreTabla CASCADE CONSTRAINTS;
```
Añadir PK:  
```
ALTER TABLE nombreTabla
    ADD PRIMARY KEY (nombreColumna); 
```
Añadir FK: 
```
ALTER TABLE nombretabla
    ADD FOREIGN KEY (nombrecolumna)
    REFERENCES nombretablaforanea(sucolumnaPK);

ALTER TABLE nombretabla
    ADD FOREIGN KEY (nombrecolumna)
    REFERENCES nombretablaforanea(sucolumnaPK) ON DELETE CASCADE;

ALTER TABLE nombretabla
    ADD FOREIGN KEY (nombrecolumna)
    REFERENCES nombretablaforanea(sucolumnaPK) ON DELETE SET NULL;
```
Modificar tipo de dato:
```
ALTER TABLE nombretabla
    MODIFY nombrecolumna datatype;
```
Modificar not null:
```
ALTER TABLE nombretabla
    MODIFY nombrecolumna NOT NULL;
```
Añadir restricción:
```
ALTER TABLE nombretabla
    ADD CHECK (nombrecolumnadate = nombrecolumnadate + 15);

ALTER TABLE nombretabla
    ADD CHECK (REGEXP_LIKE(nombre_columna,'[A-Z]-[0-9][0-9]'));

ALTER TABLE nombretabla
    ADD CHECK (nombrecolumna LIKE UPPER(nombrecolumna));

ALTER TABLE nombretabla
    ADD CHECK (nombrecolumna > 0);

ALTER TABLE nombretabla
    ADD CHECK (nombrecolumna NOT BETWEEN DATE 'xxxx-xx-xx' AND DATE 'xxxx-xx-xx');

ALTER TABLE nombretabla 
    ADD CHECK (nombrecolumna IN ('portero','delantero','mediocentro','defensa'));

nombrecolumna tipodato 
    CHECK(nombrecolumna LIKE 'xx' OR nombrecolumna LIKE 'xx')

nombrecolumna tipodato
    CHECK(REGEXP_LIKE(nombrecolumna,'xxx[x-x][x-x][x-x]') OR (REGEXP_LIKE(nombrecolumna,'xxxxxx')))
```
Borrar restricción:
```
ALTER TABLE nombretabla
    DROP CONSTRAINTS constraintname;
```
Insertar Datos:
```
INSERT INTO nombretabla VALUES (datocolumna1, datocolumna2, datocolumna3);

INSERT INTO nombretabla (nonullcolumna, nombrecolumna) VALUES (dato, dato);

INSERT INTO nombretabla VALUES (DATE'xxxx-xx-xx', DATE'xxxx-xx-xx');
```
Modificar datos de columna:
```
UPDATE nombretabla
    SET nombrecolumna = nuevodato, nombrecolumna2 = nuevodato, etc
    WHERE nombrecolumna = datounicoactual;
```
Borrar filas/registros de una tabla:
```
DELETE FROM nombratabla
        WHERE nombrecolumna = referenciafila;
```
<hr>
CONSULTAS
<hr>

Buscar un valor mínimo o máximo entre fechas:
```
SELECT nombrecolumna FROM nombretabla WHERE nombrecolumna BETWEEN 'fecha' AND 'fecha' ORDER BY nombrecolumna FETCH FIRST numeroderesultados ROWS ONLY;
```
Contar cuanto de nombrecolumna que no sea "x" y termine en "algo";
```
SELECT COUNT(nombrecolumna) FROM nombretabla WHERE nombrecolumna NOT IN ('nombredato') AND nombrecolumna LIKE 'xxxx';
```
Mostrar en minusculas
```
SELECT LOWER(nombrecolumna) FROM nombretabla; 
```
