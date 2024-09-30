/* ACTIVAR SALIDA */
SET SERVEROUTPUT ON;

//BORRADO DE TABLAS

/*BEGIN
FOR cur_rec IN (SELECT table_name FROM user_tables)
LOOP
EXECUTE IMMEDIATE 'DROP TABLE ' || cur_rec.table_name || ' CASCADE CONSTRAINTS';
END LOOP;
END;*/

create table dept(
  deptno number(2,0),
  dname  varchar2(14),
  loc    varchar2(13),
  constraint pk_dept primary key (deptno)
);
 
create table emp(
  empno    number(4,0),
  ename    varchar2(10),
  job      varchar2(9),
  mgr      number(4,0),
  hiredate date,
  sal      number(7,2),
  comm     number(7,2),
  deptno   number(2,0),
  constraint pk_emp primary key (empno),
  constraint fk_deptno foreign key (deptno) references dept (deptno)
);

insert into dept
values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept
values(20, 'RESEARCH', 'DALLAS');
insert into dept
values(30, 'SALES', 'CHICAGO');
insert into dept
values(40, 'OPERATIONS', 'BOSTON');
 
insert into emp
values(
 7839, 'KING', 'PRESIDENT', null,
 to_date('17-11-1981','dd-mm-yyyy'),
 5000, null, 10
);
insert into emp
values(
 7698, 'BLAKE', 'MANAGER', 7839,
 to_date('1-5-1981','dd-mm-yyyy'),
 2850, null, 30
);
insert into emp
values(
 7782, 'CLARK', 'MANAGER', 7839,
 to_date('9-6-1981','dd-mm-yyyy'),
 2450, null, 10
);
insert into emp
values(
 7566, 'JONES', 'MANAGER', 7839,
 to_date('2-4-1981','dd-mm-yyyy'),
 2975, null, 20
);
insert into emp
values(
 7788, 'SCOTT', 'ANALYST', 7566,
 to_date('13-JUL-87','dd-mm-rr') - 85,
 3000, null, 20
);
insert into emp
values(
 7902, 'FORD', 'ANALYST', 7566,
 to_date('3-12-1981','dd-mm-yyyy'),
 3000, null, 20
);
insert into emp
values(
 7369, 'SMITH', 'CLERK', 7902,
 to_date('17-12-1980','dd-mm-yyyy'),
 800, null, 20
);
insert into emp
values(
 7499, 'ALLEN', 'SALESMAN', 7698,
 to_date('20-2-1981','dd-mm-yyyy'),
 1600, 300, 30
);
insert into emp
values(
 7521, 'WARD', 'SALESMAN', 7698,
 to_date('22-2-1981','dd-mm-yyyy'),
 1250, 500, 30
);
insert into emp
values(
 7654, 'MARTIN', 'SALESMAN', 7698,
 to_date('28-9-1981','dd-mm-yyyy'),
 1250, 1400, 30
);
insert into emp
values(
 7844, 'TURNER', 'SALESMAN', 7698,
 to_date('8-9-1981','dd-mm-yyyy'),
 1500, 0, 30
);
insert into emp
values(
 7876, 'ADAMS', 'CLERK', 7788,
 to_date('13-JUL-87', 'dd-mm-rr') - 51,
 1100, null, 20
);
insert into emp
values(
 7900, 'JAMES', 'CLERK', 7698,
 to_date('3-12-1981','dd-mm-yyyy'),
 950, null, 30
);
insert into emp
values(
 7934, 'MILLER', 'CLERK', 7782,
 to_date('23-1-1982','dd-mm-yyyy'),
 1300, null, 10
);

/* EJERCICIOS */

/* 1. Muestra por la salida el nombre de cada departamento junto al número de 
empleados que tiene. */

SELECT d.dname, COUNT(e.deptno) FROM dept d JOIN emp e ON d.deptno = e.deptno
    GROUP BY d.dname;

/* 2. Obtén el salario medio de los empleados y muestra por pantalla ese salario
medio junto al resultado del 21% de ese importe y para finalizar, poner la suma
del salario medio junto al 21% de dicho valor. Ej.: Importe de salario medio
1000, con 210 del 21% y total 1210. */

SELECT ROUND(AVG(sal), 0), 'con ' || ROUND(AVG(sal) * 1.21 - AVG(sal)) 
    ||' del 21% ','total ' || ROUND(AVG(sal) * 1.21) FROM emp;

/* 3. Muestra por la salida el nombre y salario de los empleados que hayan sido
contratados en septiembre.*/

SELECT emp.ename, emp.sal FROM emp WHERE TO_CHAR(hiredate, 'MM') = 09;

/* 4. Pide por la entrada de teclado un determinado mes y devuelve por la salida
el nombre del empleado que haya sido contratado en dicho mes. En el caso de que
no haya ninguno, mostrar el mensaje "No hay empleados que hayan sido contratados
en ese mes". */

DECLARE
    entradaUsuario VARCHAR(10);
    nombreEmpleado emp.ename%TYPE;
    noSeEncuentra EXCEPTION;
    CURSOR c_empleados IS
        SELECT emp.ename FROM emp WHERE to_char(HIREDATE, 'MM') = &entradaUsuario;
BEGIN
    OPEN c_empleados;
        LOOP
            FETCH c_empleados INTO nombreEmpleado;
            EXIT WHEN c_empleados%NOTFOUND;
            dbms_output.put_line(nombreEmpleado);
        END LOOP;
    CLOSE c_empleados; 
    IF nombreEmpleado IS NULL THEN
        RAISE noSeEncuentra;
    END IF;
EXCEPTION
    WHEN noSeEncuentra THEN
        dbms_output.put_line('No se encuentra');        
END;
/

/* 5. Se quiere hacer un bloque de código anónimo que pida todos los campos de
la tabla emp e introduzca dicho registro en la tabla. */

DECLARE
    r_datos emp%ROWTYPE;    
BEGIN
    r_datos.empno := &empno;
    r_datos.ename := '&ename';
    r_datos.job := '&job';
    r_datos.mgr := &mgr;
    r_datos.hiredate := '&hiredate';
    r_datos.sal := &sal;
    r_datos.comm := &comm;
    r_datos.deptno := &deptno;
    INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (r_datos.empno, r_datos.ename, r_datos.job, 
        r_datos.mgr, r_datos.hiredate, r_datos.sal, r_datos.comm, 
        r_datos.deptno);
END;
/

/* 6. Se quiere un código de bloque anónimo que borre registros de la tabla emp.
Para ello pedirá un código empno por teclado, y si una vez comprobado que
existe, se borrará de la tabla. Se debe mostrar un mensaje “No hay registros con
ese código” cuando no haya empleados con ese empno. Si se borra el registro,
debes indicarlo por la pantalla con el mensaje “Se haborrado adecuadamente el
empleado”. */

DECLARE
    entradaUsuario INT;
    empleado emp.ename%TYPE;
BEGIN    
    entradaUsuario := &empno;
    
    SELECT ename INTO empleado FROM emp WHERE empno = entradaUsuario;
    DELETE FROM emp WHERE empno = entradaUsuario;
    dbms_output.put_line(empleado ||' BORRADO');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line(' No se ha encontrado empleado ');
END;
/

/* 7. Se quiere saber el nombre de los empleados que hayan sido contratados en
un determinado mes. Para ello debes crear un bloque de código anónimo que pida
un mes por el teclado con letras. Con esa información debes obtener todos los
registros de la tabla emp cuyo hiredate haya sido en dicho mes, recuperar el
nombre y mostrarlo por la salida. */

DECLARE
    mes VARCHAR2(99);
    empleado emp.ename%TYPE;
    noEncontrado EXCEPTION;
    CURSOR c_empleados IS
        SELECT emp.ename FROM emp 
            WHERE UPPER(trim(to_char(hiredate, 'MONTH'))) = UPPER('&mes');
BEGIN    
    OPEN c_empleados;
        LOOP
            FETCH c_empleados INTO empleado;            
            EXIT WHEN c_empleados%NOTFOUND;
            dbms_output.put_line(empleado);            
        END LOOP;
    CLOSE c_empleados;
    IF empleado IS NULL THEN
        RAISE noEncontrado;
    END IF;
EXCEPTION
    WHEN noEncontrado THEN
        dbms_output.put_line( ' ' );
        dbms_output.put_line('NO SE HA ENCONTRADO REGISTROS PARA ESE MES');
END;
/

/* 8. Se quiere saber cuántos empleados hay en cada departamento. Para ello crea
un bloque de código anónimo que pida por teclado el código de departamento
deptno. Después, habrá que comprobar que dicho código existe o no en la tabla
dept mostrando un mensaje en caso positivo y otro en caso negativo.
Si hay departamentos con ese código, se comprobará que hay o no empleados de ese
departamento en la tabla emp, mostrando mensajes en ambos casos
(positivo y negativo). Para finalizar, sí y solo sí hay empleados de ese
departamento, debes calcular el número de empleados que hay de ese departamento
e indicarlo en un mensaje como el que sigue “Hay xx empleados en ese
departamento”, donde xx es el número obtenido del total de empleados de ese
departamento. */

DECLARE
    v_entradaUsuario dept.deptno%TYPE := &deptno_code;
    v_empno dept.deptno%TYPE;
    CURSOR c_empno IS
        SELECT d.dname, COUNT(*) FROM emp e JOIN dept d ON e.deptno = d.deptno 
        GROUP BY d.dname;
BEGIN
    OPEN c_empno;
        LOOP
            FETCH c_empno INTO v_empno;
            EXIT WHEN c_empno%NOTFOUND;            
        END LOOP;
        IF v_empno IS NULL THEN
            dbms_output.put_line('****** NO EXISTE ESE CÓDIGO DE DEPARTAMENTO 
            *******');
        ELSE
            dbms_output.put_line('***** EXISTE *****');
        END IF;
    dbms_output.put_line(v_entradaUsuario);
END;
/

/* 9. Se quiere saber el número de veces de cierta vocal que tienen los nombres
de los empleados. Para ello se pedirá al usuario por teclado una vocal, que
habrá que comprobar inicialmente si realmente lo es o no. Si es vocal, se 
contará cuantas veces aparece en cada nombre de cada empleado, indicando un 
mensaje como el que sigue: “KING tiene 1 vez la vocal i” donde se debe haber 
introducido inicialmente por teclado “i”. Deben mostrarse todos los empleados 
con el número de veces que aparece la vocal introducida. */

DECLARE
    v_entradaUsuario emp.ename%TYPE := UPPER(TRIM('&vocal'));
    v_contador INT := 0;
BEGIN
    IF v_entradaUsuario IN ('A', 'E', 'I', 'O', 'U') THEN
        FOR r_empEname IN (SELECT ename FROM emp) LOOP  
            v_contador := 0;
            FOR i IN 1..LENGTH(r_empEname.ename) LOOP
                IF UPPER(SUBSTR(r_empEname.ename, i, 1)) = v_entradaUsuario THEN
                    v_contador := v_contador + 1;
                END IF;
            END LOOP;
            dbms_output.put_line(r_empEname.ename ||' X '|| v_contador);            
        END LOOP;      
    ELSE
        dbms_output.put_line('####### INTRODUCE UN CARACTER #######');
    END IF;    
END;
/

/* 10. Se quiere un bloque de código anónimo que busque el empleado que tiene el 
nombre más largo y el que tiene el nombre más corto. En caso de coincidencia en 
el tamaño de los nombres, se pondrán todos. */

SELECT ename FROM emp WHERE LENGTH(ename) = 6 GROUP BY ename;
SELECT MIN(LENGTH(ename)), ename FROM emp GROUP BY ename;

DECLARE
    vMaxLength NUMBER;
    vMinLength NUMBER;
BEGIN
    SELECT MAX(LENGTH(ename)), MIN(LENGTH(ename))
        INTO vMaxLength, vMinLength FROM emp;
    FOR emp_record IN (SELECT * FROM emp WHERE LENGTH(ename) = vMaxLength)
        LOOP    
            dbms_output.put_line(emp_record.ename);
        END LOOP;
    dbms_output.put_line('#########################');
    FOR emp_record IN (SELECT * FROM emp WHERE LENGTH(ename) = vMinLength)
        LOOP
            dbms_output.put_line(emp_record.ename);
        END LOOP;
END;
/


