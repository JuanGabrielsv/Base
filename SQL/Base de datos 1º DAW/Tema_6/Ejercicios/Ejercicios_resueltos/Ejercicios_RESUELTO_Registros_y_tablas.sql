/* ACTIVAR SALIDA */
SET SERVEROUTPUT ON;

/* BORRADO DE TABLAS */
/*BEGIN
FOR cur_rec IN (SELECT table_name FROM user_tables)
LOOP
EXECUTE IMMEDIATE 'DROP TABLE ' || cur_rec.table_name || ' CASCADE CONSTRAINTS';
END LOOP;
END; */

/* EJERCICIO 1
Declarar un tipo registro Tpersona con los siguientes campos: un código de tipo
numérico, un nombre de tipo cadena de 100 caracteres y la edad integer.
Asignarle valor a una variable de tipo Tpersona e imprimirlo por pantalla. */
DECLARE
    TYPE Tpersona IS RECORD (
        codigo NUMBER(38),
        nombre VARCHAR2(100),
        edad INTEGER(38)
    );
    persona1 Tpersona;
BEGIN   
    persona1.codigo := 1983;
    persona1.nombre := 'Juan Gabriel';
    persona1.edad := 41;
    
    dbms_output.put_line(persona1.codigo || ' ' || persona1.nombre || ' ' ||
    persona1.edad);  
END;
/