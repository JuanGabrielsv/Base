/* 1.
Se necesita una funci�n llamada compruebaCadena que reciba dos par�metros que
sean palabras del tipo varchar tama�o 10. Si la palabra 1 tiene m�s letras que
la palabra 2, la funci�n devolver� concatenadas ambas palabras, siendo primero
la palabra 1 y a continuaci�n la palabra 2 (juntas). Si la palabra 2 tiene m�s
letras que la palabra 1, la funci�n devolver� una palabra que sea la
uni�n/concatenaci�n de la palabra 2 junto a la palabra 1 (en ese orden).
Si ambas palabras tienen el mismo n�mero de letras, la funci�n debe devolver
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