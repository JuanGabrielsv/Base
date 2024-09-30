/* create table dept(
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
); */ 

/* 1. Obtener el nombre de todos los departamentos en minúsculas. */
SELECT LOWER(dname) FROM dept;

/* 2. Seleccionar todos los datos de la tabla empleados (todas las columnas). */
SELECT * FROM emp;

/* 3. Devuelve ename, job, sal y comm de los empleando usando los siguientes alias de columnas: nombre, puesto, salario y comisión. */
SELECT ename AS "nombre", job AS "puesto", sal AS "salario", comm AS "comisión" FROM emp;

/* 4. Calcula cuántas semanas completas (de lunes a domingo) ha trabajado cada empleado, y devuelve dicho valor y el nombre del empleado. El número de */
SELECT ename, ROUND((SYSDATE - hiredate)/7, 0) AS "semanas trabajadas" FROM emp;

/* 5. Calcular el sueldo neto de cada empleado, y la retencion iRPF mensual, sabiendo que la retención es del 19% para el sueldo y de un 10% de la comisión, (redondear a 2 decimales).
Si el empleado no tiene comisión, se debe mostrar el valor 0. */
SELECT ename, CONCAT(sal, ' €') AS "SALARIO MENSUAL",
    NVL(comm, 0) || ' €' AS "COMISIÓN",
    ROUND((sal * 1.19) - sal, 2) || ' €' AS "Retención de 19% mensual",
    NVL((comm * 1.10) - comm, 0) || ' €' AS "Retención del 10% a la comisión",
    ROUND(sal - ((sal * 1.19) - sal),2) || ' €' AS "SUELDO NETO = sueldo bruto menos 19% retención",
    nvl(comm - (comm * 1.10) + comm,0) || ' €' AS "COMISION NETO = comison bruto menos 10 %" FROM emp;

/* 6. Hacer un listado de empleados (nombre y salario) con sueldo superior a 1000. */
SELECT ename AS "NOMBRE", sal || ' €' AS "SALARIO" FROM emp WHERE sal > 1000;

/* 7. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto igual a CLERK. */
SELECT ename, job, CONCAT(sal,' €'), CONCAT(NVL(comm, 0), ' €') FROM emp WHERE job = 'CLERK';

/* 8. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK. */
SELECT ename, job, CONCAT(sal, ' €'), NVL(comm, 0) || ' €' AS "COMISIÓN" FROM emp WHERE job != 'CLERK';

/* 9. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK y sueldo superior a 1500. */
SELECT ename, job, sal, comm FROM emp WHERE job != 'CLERK' AND sal > 1500;

/* 10. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan asignada comisión. */
SELECT ename, job, sal, comm FROM emp WHERE comm IS NOT NULL AND comm > 0;

/* 11. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que NO tengan asignada comisión. */
SELECT ename, job, sal, comm FROM emp WHERE comm IS NULL OR comm <= 0;

/* 12. Seleccionar los empleados cuyo nombre empieza por 'A'. */
SELECT ename FROM emp WHERE ename LIKE 'A%';

/* 13. Seleccionar los empleados cuyo nombre tienen una A en cualquier posición. */
SELECT ename FROM emp WHERE ename LIKE '%A%';

/* 14. Seleccionar los empleados cuyo nombre no contiene ninguna 'A'. */
SELECT ename FROM emp WHERE ename NOT LIKE '%A%';

/* 15. Seleccionar los empleados cuyo nombre empieza por una vocal. */
SELECT ename FROM emp WHERE SUBSTR(ename,1,1) IN ('A','E','I','O','U');
SELECT ename FROM emp WHERE ename LIKE 'A%' OR ename LIKE 'E%' OR ename LIKE 'I%' OR ename LIKE 'O%' OR ename LIKE 'U%';

/* 16. Seleccionar los empleados con sueldo entre 1000 y 2000 (ambos inclusive). */
SELECT ename, sal FROM emp WHERE sal BETWEEN 1000 AND 2000;

/* 17. Seleccionar los empleados con sueldo igual a 1000, 2000, 3000, 4000 o 5000. */
SELECT ename, sal FROM emp WHERE sal = 1000 OR sal = 2000 OR sal = 3000 OR sal = 4000 OR sal = 5000;

/* 18. Seleccionar los empleados cuyo nombre comienza por A,B,C,J,K,M. */
SELECT ename FROM emp WHERE SUBSTR(ename,1,1) IN ('A','B','C','J','K','M');
SELECT ename FROM emp WHERE ename LIKE 'A%' OR ename LIKE 'B%' OR ename LIKE 'C%' OR ename LIKE 'J%' OR ename LIKE 'K%' OR ename LIKE 'M%';

/* 19. Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 o 5000-1000. */
SELECT ename, sal FROM emp WHERE sal IN ((5000 / 2) + 500) OR sal IN 5000-1000;
SELECT ename, sal FROM emp WHERE sal IN ((5000 / 2) + 500, 5000-1000);

/* 20. Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 ,5000-1000 o el salario máximo de todos los empleados. */
SELECT ename, (SELECT MAX(sal) FROM emp) FROM emp;
SELECT ename, sal FROM emp WHERE sal IN ((5000 / 2) + 500, 5000-1000, (SELECT MAX(sal) FROM emp));

/* 21. Seleccionar nombre, sueldo y sueldo formateado (ej.: 1,000.00) de todos los empleados. Se puede usar las máscaras de to_number en to_char. */
SELECT ename, sal, TO_CHAR(sal,'9,9999.99') FROM emp;

/* 22. Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'Dólar' (ej.: $1,000.00) de todos los empleados. Se puede usar las máscaras de to_number en to_char. */
SELECT ename, sal, TO_CHAR(sal, '9,9999.99$') FROM emp;

/* 23. Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'Euro' (ej.: 1,000.00€ de todos los empleados. Se puede usar las máscaras de to_number en to_char. */
SELECT ename, sal, TO_CHAR(sal, '9,9999.99L') FROM emp;

/* 24. Seleccionar la fecha del sistema (día, mes, año, horas (24):minutos:segundos). */
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY hh24:mi:ss') FROM dual;

/* 25. Seleccionar la fecha del sistema (nombre del día, día, nombre del mes, año, horas (24):minutos:segundos). No debe haber espacios sobrantes en el nombre del día o del mes. */
SELECT REPLACE(TO_CHAR(SYSDATE, 'DAY_DD_MONTH_ YYYY_HH24:MI:SS'),' ') FROM dual;
SELECT REPLACE(TO_CHAR(SYSDATE,'DAY'),' '), TO_NUMBER(TO_CHAR(SYSDATE,'dd')), REPLACE(TO_CHAR(SYSDATE,'MONTH'),' ',''), TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')), to_char(sysdate,'hh24:mi:ss') from dual;

/* 26. Seleccionar la fecha del día 1 de enero de 2005, medíante una tira de caracteres y su máscara de formato (ej.: 01012021). */
SELECT (TO_DATE('01012005')) FROM dual;

/* 27. Calcular el número de días vividos hasta hoy por una persona nacida el día 3 de julio de 1970. */
SELECT FLOOR(sysdate - TO_DATE('03071970')) FROM dual;

/* 28. Calcular el número de segundos transcurridos desde la última medianoche (máscara 'sssss' en to_char). */
SELECT TO_CHAR(SYSDATE,'sssss') FROM dual;

/* 29. Calcular el número horas completas transcurridas desde la última medianoche. */
SELECT TO_NUMBER(TO_CHAR(sysdate,'hh')) FROM dual;

/* 30. Calcular el número de meses transcurridos entre la fecha de contratación de cada empleado y hoy. */
SELECT ename, FLOOR(MONTHS_BETWEEN(sysdate, hiredate)) FROM emp;
 
