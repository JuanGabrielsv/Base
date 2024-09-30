/* ### EJERCICIO 1 */
CREATE OR REPLACE PROCEDURE introduceEquipos(
    vNombreEquipo equipos.nombre%TYPE, 
    vNombreEstadio equipos.estadio%TYPE,
    vPresupuesto equipos.presupuesto%TYPE
    )
IS
    vExiste equipos.nombre%TYPE;
    vIdNuevo equipos.id%TYPE;
    presupuestoNoValido EXCEPTION;
BEGIN
    SELECT equipos.nombre INTO vExiste FROM equipos WHERE equipos.estadio = vNombreEstadio;
    dbms_output.put_line('Ese equipo ya existe');
EXCEPTION
    WHEN no_data_found THEN
        IF vPresupuesto = 0 THEN
            RAISE presupuestoNoValido;
        END IF;
        SELECT MAX(equipos.id) INTO vIdNuevo FROM equipos;
        vIdNuevo := vIdNuevo + 1;
        INSERT INTO equipos VALUES (vIdNuevo, vNombreEquipo, vNombreEstadio,
                vPresupuesto);
                dbms_output.put_line('Se ha introducido correctamente un nuevo equipo');
    WHEN presupuestoNoValido THEN
        dbms_output.put_line('El presupuesto debe ser mayor que cero');
END;
/

BEGIN
    introduceEquipos('EQUIPO Z', 'BENITO VILLAMARÍN', 300000);    
END;
/

/* ### EJERCICIO 2 */
CREATE OR REPLACE PROCEDURE borrarEquipo(vIdEquipo equipos.id%TYPE)
IS
    vExiste equipos.id%TYPE;
BEGIN
    SELECT equipos.id INTO vExiste FROM equipos WHERE equipos.id = vIdEquipo;
    dbms_output.put_line('');
    /*IF (SELECT DISTINCT(futbolistas.id_equipo) FROM futbolistas WHERE futbolistas.id_equipo = vIdEquipo) = vIdEquipo THEN
    END IF;*/ --no he conseguido realizar esta condicion... :(
    DELETE FROM equipos WHERE equipos.id = vIdEquipo;   
    
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No existe ese equipo para borrar');
END;
/

BEGIN
    borrarEquipo(5);
END;
/

/* ### EJERCICIO 3 */

CREATE OR REPLACE FUNCTION obtenerDiaSemanaNacimientoFutbolista(vIdFutbolista futbolistas.id%TYPE) RETURN VARCHAR2
IS
    vExiste futbolistas.id%TYPE;
    vDia VARCHAR2(100);
BEGIN
    SELECT futbolistas.id INTO vExiste FROM futbolistas WHERE futbolistas.id = vIdFutbolista;    
    SELECT TO_CHAR(fecha_nacimiento, 'DAY') INTO vDia FROM futbolistas WHERE futbolistas.id = vIdFutbolista;     
    RETURN vDia;
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('El futbolista no está registrado');
END;
/

SELECT TO_CHAR(fecha_nacimiento, 'DAY') FROM futbolistas;

BEGIN
    dbms_output.put_line(obtenerDiaSemanaNacimientoFutbolista('F00220'));    
END;
/

/* ## EJERCICIO 4 */
CREATE OR REPLACE PROCEDURE listarDatosCuriosoFutbolistas
IS
    vNombreEquipo equipos.nombre%TYPE;
    vMasAlto futbolistas.altura%TYPE := 0;
    vMasFlaco futbolistas.peso%TYPE := 500;
    CURSOR cDatos IS
        SELECT MAX(futbolistas.altura) as ALTURA, equipos.nombre FROM futbolistas 
        JOIN equipos ON equipos.id = futbolistas.id_equipo GROUP BY equipos.nombre;
    CURSOR cDatos2 IS
        SELECT MIN(futbolistas.peso) as PESO, equipos.nombre FROM futbolistas 
        JOIN equipos ON equipos.id = futbolistas.id_equipo GROUP BY equipos.nombre;
    CURSOR cDatos3 IS
        SELECT equipos.nombre AS equiNombre, count(futbolistas.nombre) AS cantidad FROM equipos 
        JOIN futbolistas ON futbolistas.id_equipo = equipos.id GROUP BY equipos.nombre;
    CURSOR cDatos4 IS
        SELECT COUNT(futbolistas.id) AS total FROM futbolistas;    
BEGIN
    FOR fila IN cDatos
        LOOP
            IF fila.altura > vMasAlto THEN
                vMasAlto := fila.altura;
                vNombreEquipo := fila.nombre;
            END IF;
        END LOOP;
    dbms_output.put_line(vMasAlto ||' '|| vNombreEquipo);
    FOR fila2 IN cDatos2
        LOOP
            IF fila2.peso < vMasFlaco THEN
                vMasFlaco := fila2.peso;
                vNombreEquipo := fila2.nombre;
            END IF;
        END LOOP;
    dbms_output.put_line(vMasFlaco ||' '|| vNombreEquipo);
    FOR fila3 IN cDatos3
        LOOP
            dbms_output.put_line(fila3.equiNombre ||' '|| fila3.cantidad);
        END LOOP;
    FOR fila4 IN cDatos4
        LOOP
            dbms_output.put_line(fila4.total);
        END LOOP;
END;
/

BEGIN
    listarDatosCuriosoFutbolistas;
END;
/

/* ### EJERCICIO 5 */
CREATE OR REPLACE PACKAGE libFutbolistas
IS
    PROCEDURE introduceEquipos(
    vNombreEquipo equipos.nombre%TYPE, 
    vNombreEstadio equipos.estadio%TYPE,
    vPresupuesto equipos.presupuesto%TYPE
    );
    
    PROCEDURE borrarEquipo(vIdEquipo equipos.id%TYPE);
    
    FUNCTION obtenerDiaSemanaNacimientoFutbolista(vIdFutbolista futbolistas.id%TYPE) RETURN VARCHAR2;
    
    PROCEDURE listarDatosCuriosoFutbolistas;    
END;
/
CREATE OR REPLACE PACKAGE BODY libFutbolistas
IS
    PROCEDURE introduceEquipos(
        vNombreEquipo equipos.nombre%TYPE, 
        vNombreEstadio equipos.estadio%TYPE,
        vPresupuesto equipos.presupuesto%TYPE
        )
    IS
        vExiste equipos.nombre%TYPE;
        vIdNuevo equipos.id%TYPE;
        presupuestoNoValido EXCEPTION;
    BEGIN
        SELECT equipos.nombre INTO vExiste FROM equipos WHERE equipos.estadio = vNombreEstadio;
        dbms_output.put_line('Ese equipo ya existe');
    EXCEPTION
        WHEN no_data_found THEN
            IF vPresupuesto = 0 THEN
                RAISE presupuestoNoValido;
            END IF;
            SELECT MAX(equipos.id) INTO vIdNuevo FROM equipos;
            vIdNuevo := vIdNuevo + 1;
            INSERT INTO equipos VALUES (vIdNuevo, vNombreEquipo, vNombreEstadio,
                    vPresupuesto);
                    dbms_output.put_line('Se ha introducido correctamente un nuevo equipo');
        WHEN presupuestoNoValido THEN
            dbms_output.put_line('El presupuesto debe ser mayor que cero');
    END;
    
    PROCEDURE borrarEquipo(vIdEquipo equipos.id%TYPE)
    IS
        vExiste equipos.id%TYPE;
    BEGIN
        SELECT equipos.id INTO vExiste FROM equipos WHERE equipos.id = vIdEquipo;
        dbms_output.put_line('');
        /*IF (SELECT DISTINCT(futbolistas.id_equipo) FROM futbolistas WHERE futbolistas.id_equipo = vIdEquipo) = vIdEquipo THEN
        END IF;*/ --no he conseguido realizar esta condicion... :(
        DELETE FROM equipos WHERE equipos.id = vIdEquipo;   
    
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('No existe ese equipo para borrar');
    END;
    
    FUNCTION obtenerDiaSemanaNacimientoFutbolista(vIdFutbolista futbolistas.id%TYPE) RETURN VARCHAR2
    IS
        vExiste futbolistas.id%TYPE;
        vDia VARCHAR2(100);
    BEGIN
        SELECT futbolistas.id INTO vExiste FROM futbolistas WHERE futbolistas.id = vIdFutbolista;    
        SELECT TO_CHAR(fecha_nacimiento, 'DAY') INTO vDia FROM futbolistas WHERE futbolistas.id = vIdFutbolista;     
        RETURN vDia;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('El futbolista no está registrado');
    END;
    
    PROCEDURE listarDatosCuriosoFutbolistas
    IS
        vNombreEquipo equipos.nombre%TYPE;
        vMasAlto futbolistas.altura%TYPE := 0;
        vMasFlaco futbolistas.peso%TYPE := 500;
        CURSOR cDatos IS
            SELECT MAX(futbolistas.altura) as ALTURA, equipos.nombre FROM futbolistas 
            JOIN equipos ON equipos.id = futbolistas.id_equipo GROUP BY equipos.nombre;
        CURSOR cDatos2 IS
            SELECT MIN(futbolistas.peso) as PESO, equipos.nombre FROM futbolistas 
            JOIN equipos ON equipos.id = futbolistas.id_equipo GROUP BY equipos.nombre;
        CURSOR cDatos3 IS
            SELECT equipos.nombre AS equiNombre, count(futbolistas.nombre) AS cantidad FROM equipos 
            JOIN futbolistas ON futbolistas.id_equipo = equipos.id GROUP BY equipos.nombre;
        CURSOR cDatos4 IS
            SELECT COUNT(futbolistas.id) AS total FROM futbolistas;    
    BEGIN
        FOR fila IN cDatos
            LOOP
                IF fila.altura > vMasAlto THEN
                    vMasAlto := fila.altura;
                    vNombreEquipo := fila.nombre;
                END IF;
            END LOOP;
        dbms_output.put_line(vMasAlto ||' '|| vNombreEquipo);
        FOR fila2 IN cDatos2
            LOOP
                IF fila2.peso < vMasFlaco THEN
                    vMasFlaco := fila2.peso;
                    vNombreEquipo := fila2.nombre;
                END IF;
            END LOOP;
        dbms_output.put_line(vMasFlaco ||' '|| vNombreEquipo);
        FOR fila3 IN cDatos3
            LOOP
                dbms_output.put_line(fila3.equiNombre ||' '|| fila3.cantidad);
            END LOOP;
        FOR fila4 IN cDatos4
            LOOP
                dbms_output.put_line(fila4.total);
            END LOOP;
    END;
END;
/
/* ### EJERCICIO 6 */
BEGIN
    libFutbolistas.introduceEquipos('CEU TEAM', 'Bormujos Stadium', 10);
    libFutbolistas.listarDatosCuriosoFutbolistas;
    libFutbolistas.borrarEquipo(4);
    dbms_output.put_line(libFutbolistas.obtenerDiaSemanaNacimientoFutbolista('F00320'));
END;
/

/* ### EJERCICIO 7 */
CREATE OR REPLACE FUNCTION golesEquipo(vNombreEquipo equipos.nombre%TYPE) RETURN INT
IS
    vExiste equipos.id%TYPE;
BEGIN
    SELECT equipos.id INTO vExiste FROM equipos WHERE equipos.nombre = vNombreEquipo;
    dbms_output.put_line('');
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No existe equipo');
        RETURN -1;
END;
/











