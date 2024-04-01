/* DAR PERMISOS PARA COMPILAR FUNCIONES Y PROCEDURE */
GRANT CREATE PROCEDURE TO nombreDeUsuario;

/* ACTIVAR SALIDA */
SET SERVEROUTPUT ON;

/* ESTRUCTURA BÁSICA BLOQUE CÓDIGO ANÓNIMO */
DECLARE

BEGIN
    dbms_output.put_line('');
END;
/

/* ESTRUCTURA DE UN PROCEDIMIENTO */
CREATE OR REPLACE PROCEDURE nombreProceso(fecha DATE)
IS
    variables DATE := fecha - 1;
    variables2 INT;    
BEGIN
    variables2 := 8;
    dbms_output.put_line('');        
END;
/

/* BORRAR UN PROCEDURE */
DROP PROCEDURE nombreProceso;