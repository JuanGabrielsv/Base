<h1 style="font-size:12px">Comandos SQL</h1>

Comandos SQL:
```
- Cómo establecer una cuota en el tablespace y poder insertar datos -

ALTER USER nombreusuario QUOTA UNLIMITED ON nombretablespace;
Ej: alter user daw quota unlimited on users;
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
Mayor que fecha 15 días:
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

nombrecolumna tipodato CHECK(nombrecolumna LIKE 'xx' OR nombrecolumna LIKE 'xx')
```
Borrar restricción:
```
ALTER TABLE nombretabla
    DROP CONSTRAINTS constraint_name;
```
Insertar Datos:
```
Insertar en todos los campos respetando el orden:
INSERT INTO nombretabla VALUES (datocolumna1, datocolumna2, datocolumna3);

Insertar en campo específico, campo no null obligatorio y seguir el orden de las columnas a la hora
de introducir los datos:
INSERT INTO nombretabla (nonullcolumna, nombrecolumna) VALUES (dato, dato);

Con fecha:
INSERT INTO nombretabla VALUES (DATE'xxxx-xx-xx', DATE'xxxx-xx-xx');
```
Modificar datos de columna:
```
Si no ponemos WHERE los datos se cambiarán en todas las filas:
UPDATE nombretabla
SET nombrecolumna = nuevodato, nombrecolumna2 = nuevodato, etc
WHERE nombrecolumna = datounicoactual;
```

