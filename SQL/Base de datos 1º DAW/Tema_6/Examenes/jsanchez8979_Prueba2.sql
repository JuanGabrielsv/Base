/* 
1. Se necesita una funci�n llamada insertaEmpleado que reciba por par�metros
todos los campos de la tabla emp (empno, ename, job, etc.).
Esta funci�n comprobar� si existe alg�n empno en la tabla emp con el que se le
pasa por par�metro y, si no hay ninguno, crear� un registro en la tabla emp con
todos esos datos pasados por par�metro. Despu�s, devolver� en una variable el
mensaje "Registro insertado correctamente". En caso de que ese empno exista en
la tabla emp, se debe devolver en una variable el mensaje "No se puede crear,
ya existe".
*/
CREATE OR REPLACE FUNCTION insertaEmpleado(vempno emp.empno%TYPE, 
    vename emp.ename%TYPE, vjob emp.job%TYPE, vmgr emp.mgr%TYPE, 
    vhiredate emp.hiredate%TYPE, vsal emp.sal%TYPE, vcomm emp.comm%TYPE, 
    vdeptno emp.deptno%TYPE) RETURN VARCHAR
IS
    existe emp.empno%TYPE;
BEGIN
    SELECT empno INTO existe FROM emp WHERE empno = vempno;    
        return 'No se puede crear, ya existe';    
EXCEPTION
    WHEN no_data_found THEN
        INSERT INTO emp VALUES (vempno, vename, vjob, vmgr, vhiredate, vsal, 
            vcomm, vdeptno);
        RETURN 'Registro insertado correctamente';
END;
/

/*
2. Realiza un bloque de c�digo an�nimo que pida al usuario que meta por teclado
todos los campos de la tabla emp, gu�rdalos en sus variables correspondientes,
llama a la funci�n insertaEmpleado y muestra por consola el mensaje que devuelve
dicha funci�n. Haz un ejemplo con los siguientes datos:
- empno: 7999
- ename: STEVEN
- job: MANAGER
- mgr: 7839
- hiredate: 01/01/23
- sal: 3000
- comm: 0
- deptno: 10
*/
DECLARE
    vempno emp.empno%TYPE := &empno;
    vename emp.ename%TYPE := '&ename';
    vjob emp.job%TYPE := '&job';
    vmgr emp.mgr%TYPE := &mgr;
    vhiredate emp.hiredate%TYPE := '&hiredate';
    vsal emp.sal%TYPE := &sal;
    vcomm emp.comm%TYPE := &comm;
    vdeptno emp.deptno%TYPE := &deptno;
    mensaje VARCHAR(200);
BEGIN 
    mensaje := insertaEmpleado(vempno, vename, vjob, vmgr, vhiredate, vsal, 
        vcomm, vdeptno);
    dbms_output.put_line(mensaje);
END;
/
 
