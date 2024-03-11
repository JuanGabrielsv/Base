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

/* 51. Qué día de la semana se contrató a cada empleado. */
SELECT TO_CHAR(hiredate, 'day') FROM emp;

/* 52. Calcular la paga de beneficios que corresponde a cada empleado (3 salarios mensuales incrementados un: 10% para PRESIDENT, 20% para los MANAGER, 30% para el resto). */
SELECT ename, DECODE(job, 'PRESIDENT', (sal * 1.10) * 3, 'MANAGER', (sal * 1.20) * 3, (sal * 1.30) * 3 ) FROM emp;

/* 53. Cuantos días han pasado desde el 25 julio de 1992. */
SELECT ROUND(SYSDATE - TO_DATE('25/07/92')) FROM dual;

/* 54. Seleccionar el nombre de cada empleado junto al nombre del departamento en el que está. */
SELECT ename || ' ' || dname FROM emp JOIN dept ON dept.deptno = emp.deptno;

/* 55. Seleccionar el nombre y puesto de cada empleado junto al nombre del departamento al que pertenece y la localización del departamento. */
SELECT ename || ' ' || job || ' ' || dname || ' ' || loc FROM emp JOIN dept ON dept.deptno = emp.deptno;

/* 56. Seleccionar el nombre de cada empleado, el nombre del departamento al que pertenece, y el codigo de departamento del empleado. */
SELECT ename, dname, dept.deptno FROM emp JOIN dept ON dept.deptno = emp.deptno;

/* 57. Listar el nombre del empleado y el nombre de su jefe. */
SELECT a.ename, b.ename, b.mgr FROM emp a JOIN emp b ON b.mgr = a.empno ORDER BY b.mgr;

/* 58. Listar el nombre del empleado y el nombre de su jefe. Incluir empleados que no tengan jefe. */
SELECT a.ename, b.ename FROM emp a, emp b WHERE a.mgr = b.empno(+);
SELECT b.ename, a.ename FROM emp a JOIN emp b ON b.mgr = a.empno(+);

/* 59. Seleccionar nombre del empleado, nombre del jefe, fechas contrato del trabajador y del jefe, de forma que la fecha de contrato del empleado sea anterior a la de su jefe. */
SELECT a.ename, a.hiredate, b.ename, b.hiredate FROM emp a, emp b WHERE a.mgr = b.empno AND a.hiredate < b.hiredate;
SELECT a.ename, a.hiredate, b.ename, b.hiredate FROM emp a JOIN emp b ON a.mgr = b.empno WHERE a.hiredate < b.hiredate;

/* 60. Seleccionar nombre del empleado, nombre del jefe, salarios del trabajador y del jefe, de forma que el sueldo del empleado sea inferior a la mitad del salario de su jefe. */
SELECT a.ename, a.sal, b.ename, b.sal, b.sal / 2 FROM emp a, emp b WHERE a.mgr = b.empno AND a.sal < b.sal / 2;
SELECT a.ename, a.sal, b.ename, b.sal, b.sal / 2 FROM emp a JOIN emp b ON a.mgr = b.empno WHERE a.sal < b.sal / 2;
/* 61. Seleccionar las distintas ubicaciones de los departamentos. */
SELECT b.loc FROM emp a, dept b WHERE a.deptno = b.deptno GROUP BY b.loc;
SELECT a.loc FROM dept a JOIN emp b ON b.deptno = a.deptno GROUP BY loc;

/* 62. Seleccionar la ubicación y el nombre empleado. Incluir también las ubicaciones de departamentos sin empleados. */
SELECT a.loc, b.ename FROM dept a, emp b WHERE a.deptno = b.deptno(+);
SELECT a.loc, b.ename FROM dept a JOIN emp b ON a.deptno = b.deptno(+);

/* 63. Seleccionar el nombre de los empleados, y el departamento al que pertenecen, para los empleados que ganan menos de 1000$. */
SELECT a.ename, b.loc, a.sal FROM emp a, dept b WHERE a.deptno = b.deptno AND a.sal < 1000;
SELECT a.ename, b.loc, a.sal FROM emp a JOIN dept b ON a.deptno = b.deptno WHERE a.sal < 1000;

/* 64. Seleccionar el nombre del empleado, y el departamento al que pertenecen, para los empleados que ganan más de 1000$. */
SELECT a.ename, b.loc, a.sal FROM emp a, dept b WHERE a.deptno = b.deptno AND a.sal > 1000;
SELECT a.ename, b.loc, a.sal FROM emp a JOIN dept b ON a.deptno = b.deptno WHERE a.sal > 1000;

/* 65. Consultar todos los valores de la tabla emp. */
SELECT * FROM emp;

/* 66. Listar el nombre, el oficio y sueldo de los empleados. */
SELECT ename, job, sal FROM emp;

/* 67. Calcular el sueldo anual que percibe cada empleado. */
SELECT ename, sal * 12 FROM emp;

/* 68. Consultar los datos de la tabla DEPTS. */
SELECT * FROM dept;

/* 69. Listar los diferentes puestos de los empleados sin repetir. */
SELECT DISTINCT(job) FROM emp;

/* 70. Listar en una sola columna el nombre y el puesto de cada empleado. */
SELECT ename || ' es ' || job FROM emp;

/* 71. Listar todas las columnas de la tabla EMP en una única columna, separando cada campo por comas. */
SELECT empno || ',' || ename || ',' || job || ',' || mgr || ',' || hiredate || ',' || sal || ',' || comm || '' || deptno FROM emp; 

/* 72. Listar el nombre y sueldo de los empleados que ganan más de 2000$. */
SELECT ename, sal FROM emp WHERE sal > 2000;

/* 73. Listar el nombre y código de de departamento del empleado con id=30. */
SELECT ename, deptno FROM emp WHERE deptno = 30;

/* 74. Listar el nombre y sueldo de los empleados que NO ganan entre 5000 y 12000 dólares. Muestra el sueldo con el símbolo de $ delante de la cifra. */
SELECT ename, '$' || sal FROM emp WHERE sal NOT BETWEEN 5000 AND 12000;

/* 75. Listar el nombre, puesto y fecha contrato de los empleados contratados entre el 20 febrero 1981 y el 1 de mayo de 1981. Ordenar por fecha descendente. */
SELECT ename, job, hiredate FROM emp WHERE hiredate BETWEEN '20/02/81' AND '01/05/81';

/* 76. Listar el nombre y el cod departamento de los empleados pertenecientes a los departamentos 20 o 40. */
SELECT ename, deptno FROM emp WHERE deptno = 20 OR deptno = 40;

/* 77. Listar el nombre (alias: Empleado) y sueldo (alias: Salario mensual) de los empleados pertenecientes a los departamentos 20 o 40, que ganen entre 2000 y 4000 dólares. */
SELECT ename AS "Empleado", sal AS "Salario mensual" FROM emp WHERE deptno = 20 OR deptno = 40 AND sal BETWEEN 2000 AND 4000;

/* 78. Listar el nombre y fecha contrato de empleados contratados el año 1984. */
SELECT ename, hiredate FROM emp WHERE hiredate BETWEEN '01/01/84' AND '31/12/84';

/* 79. Listar el nombre y el puesto de los empleados que no tengan jefe asignado. */
SELECT ename, job FROM emp WHERE mgr IS NULL;

/* 80. Listar el nombre, sueldo y % comisión de los empleados que cobran comisión. Ordenar por salario y comisión, de forma que los más altos salgan primero. */
SELECT ename, sal, comm FROM emp WHERE comm IS NOT NULL ORDER BY sal DESC, comm DESC;

/* 81. Listar el nombre de los empleados que tengan una 'a' en la 3a letra del nombre. */
SELECT ename FROM emp WHERE ename LIKE '__A%';

/* 82. Listar el nombre de los empleados que tengan una 'a' y una 'e' en el nombre. */
SELECT ename FROM emp WHERE ename LIKE '%A%' AND ename LIKE '%E%';

/* 83. Listar el nombre, puesto y sueldo de los empleados 'CLERK' o 'SALESMAN', y con salario distinto de: 2500, 3500 y 7000. */
SELECT ename, job, sal FROM emp WHERE job = 'CLERK' OR job = 'SALESMAN' AND sal NOT IN (2500, 3500, 7000);

/* 84. Listar el nombre (alias: Empleado), sueldo (alias: Salario mensual) y nombre del departamento de todos los empleados cuya comisión sea mayor de 400. */
SELECT a.ename AS "Empleado", a.sal AS "Salario mensual", b.dname FROM emp a, dept b WHERE b.deptno = a.deptno AND a.comm > 400; 

/* 85. Listar el nombre y salario de los empleados, de forma que estén separados por una línea de puntos, y que de extremo a extremo haya 30 caracteres (por ejemplo: "KING......................5000"). */
SELECT RPAD(ename, 15, '*') || LPAD(sal, 15, '*') FROM emp;

/* 86. Listar los nombres de los empleados, reemplazando la letra 'a' por un '1'. */
SELECT REPLACE(ename, 'A', '1') FROM emp;

/* 87. Obtener la fecha del sistema (hoy) con alias: Fecha en el formato por defecto (sin tocar nada). */
SELECT SYSDATE AS "Fecha en el formato por defecto (sin tocar nada)" FROM dual;

/* 88. Listar el id, nombre, salario de los empleados, y además otra columna con el salario incrementado un 15% su valor y redondeado (alias: Nuevo salario). */
SELECT empno, ename, sal, ROUND(sal * 1.15) AS "Nuevo salario" FROM emp;

/* 89. Listar el id, nombre, salario de los empleados, el salario incrementado un 15% redondeado (alias: Nuevo salario) y además otra columna con la cuantía del incremento (alias: Incremento). */
SELECT empno, ename, sal, ROUND(sal * 1.15), (sal * 1.15) - sal AS "Incremento" FROM emp;

/* 90. Listar el nombre y longitud del nombre de los empleados que empiecen por A, o M. (Los nombres tendrán la inicial en mayúscula y el resto en minúsculas). */
SELECT INITCAP(ename), LENGTH(ename) FROM emp WHERE REGEXP_LIKE(ename, '^[AM]');

/* 91. Listar el nombre y número de meses trabajados, redondeando al entero superior. Ordenar por número de meses trabajados, de menor a mayor. */
SELECT ename, CEIL(MONTHS_BETWEEN(SYSDATE, hiredate)) FROM emp ORDER BY CEIL(MONTHS_BETWEEN(SYSDATE, hiredate)) DESC; 

/* 92. Componer una frase con el nombre, salario actual y el triple del salario de los empleados. Por ejemplo: "KING gana 5000 mensuales, pero querría ganar 15000" (alias: Sueldos soñados). */
SELECT ename || ' gana ' || sal || ' mensuales, pero querría ganar ' || sal * 3 FROM emp;

/* 93. Listar el nombre y salario de los empleados, rellenando por la izquierda hasta 15 caracteres con el símbolo "$". */
SELECT ename || LPAD('$', 15, '$') || sal FROM emp;

/* 94. Listar nombre, fecha contrato y fecha revisión contrato de los empleados, sabiendo que la revisión será el lunes siguiente a la fecha que cumple 6 meses de trabajo en la empresa. 
       Formatear esta fecha de acuerdo con el ejemplo: 'Lunes, 12th de noviembre de 2005'. */
SELECT ename, hiredate, TO_CHAR(NEXT_DAY(ADD_MONTHS(hiredate, 6), 'LUNES'), 'FMDAY, ddTH "de" MONTH "de" yyyy') FROM emp;
    
/* 95. Listar nombre, fecha contrato y día de la semana en que fueron contratados los empleados, ordenando por día de la semana, de forma que queden ordenados
       por lunes, martes, miércoles, jueves, viernes, sábado y domingo. */
SELECT ename, hiredate, TO_CHAR(hiredate, 'Day') FROM emp ORDER BY TO_CHAR(hiredate, 'D');

/* 96. Listar nombre y comisión de los empleados. En el caso de que no gane comisión, sacar la frase "Sin comisión". */
SELECT ename, DECODE(comm, null, 'Sin comisión', 0, 'Sin comisión', comm) FROM emp;

/* 97. Listar nombre de los empleados, y una tira de asteriscos, de forma que haya un asterisco por cada 1000$ (redondeada) que gana el empleado. Titula la columna 'Empleado y su salario'. Ordenar esta
       columna de forma que los que más ganan aparezcan primero. Los nombres deben quedar ajustados a la longitud del nombre más largo. Ej.: "KING..:  *****" */
SELECT RPAD(ename, (SELECT MAX(LENGTH(ename)) FROM emp), '.') || ': ' || LPAD('*', ROUND(sal / 1000), '*') FROM emp;
       
/* 98. Listar los distintos nombres de puestos de los empleados, de forma que : PRESIDENT se traduzca por A, MANAGER por B, ANALYST por C, CLERK por D y el resto por E. */
SELECT job, DECODE(job, 'PRESIDENT', 'A', 'MANAGER', 'B', 'ANALYST', 'C', 'CLERK', 'D', 'E') FROM EMP GROUP BY job;

/* 99. Listar todos los campos de la tabla DEPT. */
SELECT * FROM dept;

/* 100. Seleccionar el nombre de departamento, y el nombre de la ciudad donde está. */
SELECT dname, loc FROM dept;
