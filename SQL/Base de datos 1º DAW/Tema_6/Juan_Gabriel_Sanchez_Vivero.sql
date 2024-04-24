/* 1.
Se necesita una función llamada compruebaCadena que reciba dos parámetros que
sean palabras del tipo varchar tamaño 10. Si la palabra 1 tiene más letras que
la palabra 2, la función devolverá concatenadas ambas palabras, siendo primero
la palabra 1 y a continuación la palabra 2 (juntas). Si la palabra 2 tiene más
letras que la palabra 1, la función devolverá una palabra que sea la
unión/concatenación de la palabra 2 junto a la palabra 1 (en ese orden).
Si ambas palabras tienen el mismo número de letras, la función debe devolver
tantos guiones como letras tengan (ej.: si ambas palabras tienen 4 letras,
debe devolver ----). */
CREATE OR REPLACE FUNCTION compruebaCadena(palabra1 VARCHAR, palabra2 VARCHAR)
    RETURN VARCHAR
IS
    palabraFinal VARCHAR(10);
BEGIN
    IF length(palabra1) > length(palabra2) THEN
        palabraFinal := palabra1 || palabra2;
        RETURN palabraFinal;
    ELSIF length(palabra1) < length(palabra2) THEN
        palabraFinal := palabra2 || palabra1;
        RETURN palabraFinal;        
    END IF;    
END;
/

DECLARE
    pal1 VARCHAR(10) := 'HOLA';
    pal2 VARCHAR(10) := 'Adios';    
BEGIN
    dbms_output.put_line(compruebaCadena(pal1, pal2));      
END;
/