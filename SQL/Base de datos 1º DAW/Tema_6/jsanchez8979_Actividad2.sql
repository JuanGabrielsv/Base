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

CREATE OR REPLACE FUNCTION insertarEmpleado(empno NUMBER, ename VARCHAR2, 
    job VARCHAR2, mgr NUMBER, hiredate DATE, sal NUMBER, comm NUMBER,
    deptno NUMBER) RETURN VARCHAR2
IS
    total NUMBER := 0;
BEGIN
    IF empno THEN
    
END;
/

DECLARE
    TYPE tablaEmp IS TABLE OF emp%ROWTYPE INDEX BY BINARY_INTEGER;
    tabla1 := tablaEmp;
BEGIN
    SELECT * INTO tabla1 FROM emp WHERE emp.empno = 8585;
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