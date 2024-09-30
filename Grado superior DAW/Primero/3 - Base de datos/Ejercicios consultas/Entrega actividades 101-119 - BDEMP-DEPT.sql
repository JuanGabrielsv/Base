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

/* 101. Listar las diferentes ciudades de la tabla sin repetición explícitamente (aunque no haya datos que se repitan). */
/* 102. Listar el nombre de departamento y nombre de ciudad para los departamentos ubicados en  en New York y Dallas. */
/* 103. Seleccionar el nombre de los empleados y el nombre de la ciudad donde está el departamento al que pertenecen. */
/* 104. Listar el nombre de los trabajadores, puesto, nombre del departamento y ciudad del departamento de aquellos que no son MANAGER. */
/* 105. Listar el nombre de los trabajadores, puesto, nombre del departamento y ciudad del departamento de aquellos que no son ni ANALYST ni CLERK. */
/* 106. Seleccionar el nombre del empleado, código y nombre del departamento al que pertenecen los empleados. */
/* 107. Seleccionar el nombre de los empleados que trabajan en el departamento cuyo código es el más bajo de todos los existentes (utiliza subconsultas). */
/* 108. Seleccionar nombre de empleado, nombre de departamento y ubicación del departamento para los empleados que tienen comisión. */
/* 109. Seleccionar nombre de empleado, nombre de departamento y localización, para los empleados que no tienen comisión (o esta vale cero). */
/* 110. Seleccionar nombre de empleado y nombre de departamento para los empleados que tengan una 'a' en su nombre. */
/* 111. Seleccionar nombre de empleado y nombre departamento para los empleados que tengan una vocal al menos (a, e, i, o, u) en su nombre. */
/* 112. Seleccionar nombre y puesto de empleado, código de departamento y nombre de departamento de los empleados cuyo departamento está ubicado en 'Chicago'. Todos los valores deben devolverse en minúsculas. */
/* 113. Seleccionar nombre, código de empleado, nombre de su jefe y código de empleado de su jefe para todos los empleados (no se deben mostrar los que no tienen jefe). */
/* 114. Seleccionar nombre, código de empleado, nombre de su jefe y código de empleado de su jefe para todos los empleados (se deben mostrar TODOS, incluso los que no tienen jefe). */
/* 115. Seleccionar código departamento, nombre de empleado y nombre de jefe de cada empleado del departamento que está en Boston. */
/* 116. Seleccionar nombre y fecha contrato de los empleados contratados posteriormente al empleado 'WARD'. */
/* 118. Seleccionar nombre y fecha de contrato de los empleados, además del nombre y fecha de contrato de su jefe,
        siempre y cuando la fecha del contrato del empleado fuera anterior a la fecha de contrato de su jefe. */
/* 119. Listar todos los nombres cuya longitud sea menor que la media de todas las longitudes de nombres de empleados redondeado al entero superior. */
/* 120. Seleccionar el nombre de los empleados y el nombre del departamento al que pertenecen, siempre y cuando el nombre del departamento comience por la letra 'S'. */