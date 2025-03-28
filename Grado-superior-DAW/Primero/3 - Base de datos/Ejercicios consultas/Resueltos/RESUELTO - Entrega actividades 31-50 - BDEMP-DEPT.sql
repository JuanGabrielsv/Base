//BORRADO DE TABLAS
/*
BEGIN
FOR cur_rec IN (SELECT table_name FROM user_tables)
LOOP
EXECUTE IMMEDIATE 'DROP TABLE ' || cur_rec.table_name || ' CASCADE CONSTRAINTS';
END LOOP;
END;
*/
//BD EMP-DEPT

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

/* 31. Calcular el �ltimo dia del mes (fecha) del mes actual. */
SELECT LAST_DAY(SYSDATE) FROM dual;

/* 32. Calcular el �ltimo dia del mes (fecha) del mes actual, con horas, minutos y segundos. */
SELECT TO_CHAR(LAST_DAY(SYSDATE), 'dd/mm/yyyy HH24:MI:SS') FROM dual;

/* 33. Calcular en qu� MES (cifras) se ha contratado cada empleado. */
SELECT TO_CHAR(hiredate, 'FMMM'), TO_CHAR(hiredate, 'MONTH'), hiredate FROM emp;

/* 34. Calcular cuanto deber�a haber cobrado cada empleado en su primer a�o de trabajo (desde la fecha de contrato hasta el 31 de diciembre de ese a�o). */
SELECT TRUNC(MONTHS_BETWEEN(TO_DATE('31/12/' || TO_CHAR(hiredate,'YYYY')), hiredate)) * sal FROM EMP;
SELECT TO_DATE('31/12/' || TO_CHAR(hiredate,'YYYY')) FROM emp;

/* 35. Cuantos oficios distintos hay en la tabla de empleados. */
SELECT DISTINCT(job) FROM emp;

/* 36. Calcular el IRPF de cada empleado, teniendo en cuenta que para los 'CLERK' se les retiene un 15%, y a los 'ANALYST" un 20%. Al resto se les retiene un 19%. */
SELECT sal, ename, job, DECODE(job, 'CLERK', sal * 0.15, 'ANALYST', sal * 0.20, sal * 0.19) FROM emp;

/* 37. Efectuar una propuesta de aumento salarial: Para los empleados del Dept. 10 un 5%, Dept. 20 un 7%, Dept 30 un 8% y al resto un 3% del salario. */
SELECT ename, deptno, sal, DECODE(deptno, 10, 'Propuesta de subida del 5% = '|| sal * 0.05 || ' euros', 20, 'Propuesta de subida del 7% = '|| sal * 0.07 || ' euros',
30, 'Propuesta de subida del 8% = '|| sal * 0.08 || ' euros', 'Propuesta de subida del 3% = '|| sal * 0.03 || ' euros') AS "Propuesta de subidad de sueldo" FROM emp ORDER BY deptno;

/* 38. Listar los nombres de los empleados, identificando como 'Vendedor' si cobra comisi�n, y 'No vendedor' si no la cobra. */
SELECT ename, DECODE(comm, null, 'No vendedor', 0, 'Vendedor pero su comisi�n est� a 0', 'Vendedor') FROM emp;

/* 39. Calcular cu�nto se paga mensualmente a todos los empleados. */
SELECT SUM(sal) FROM emp;

/* 40. Calcular cuantos empleados hay. */
SELECT COUNT(*) FROM emp;

/* 41. Calcular el sueldo medio de todos los empleados. */
SELECT ROUND(AVG(sal), 2) FROM emp;

/* 42. Calcular la comisi�n media de todos los empleados (teniendo en cuenta aquellos que no tienen comisi�n). */
SELECT ROUND(AVG(comm) / COUNT(*), 2) FROM emp;

/* 43. Calcular la comisi�n media de los empleados que s� tienen comisi�n. */
SELECT ROUND(AVG(comm), 2) FROM emp WHERE comm > 0;

/* 44. Calcular la suma de los sueldos de los empleados del Departamento 20. */
SELECT SUM(sal) FROM emp WHERE deptno = 20;

/* 45. Calcular el sueldo medio de los empleados que pertenezcan al Dept 10 o 30. */
SELECT ROUND(AVG(sal), 2) FROM emp WHERE deptno IN 10 OR deptno = 30;

/* 46. Calcular la suma de sueldos que se pagan en cada uno de los departamentos 10 y 30 (por separado). */
SELECT deptno, ROUND(AVG(sal), 2) FROM emp WHERE deptno = 10 OR deptno = 30 GROUP BY deptno;

/* 47. Calcular cuantos empleados se han contratado cada a�o. */
SELECT TO_CHAR(hiredate, 'yyyy'), COUNT(*) FROM emp GROUP BY TO_CHAR(hiredate, 'yyyy');

/* 48. Calcular el sueldo m�ximo y m�nimo de cada departamento. */
SELECT deptno, MAX(sal), MIN(sal) FROM emp GROUP BY deptno;

/* 49. Calcular cuanto se gana de media por cada oficio. Redondear a 2 decimales. */
SELECT job, ROUND(AVG(sal), 2) FROM emp GROUP BY job;

/* 50. Cu�ntos dias de vacaciones correspondieron a cada empleado el primer a�o de trabajo (contando 1 d�a por semana entera trabajada). */
SELECT FLOOR((TO_DATE('31/12/' || TO_CHAR(hiredate,'YYYY')) - hiredate) / 7) FROM emp;