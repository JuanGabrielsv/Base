/* BORRADO DE TABLAS */

/*BEGIN
FOR cur_rec IN (SELECT table_name FROM user_tables)
LOOP
EXECUTE IMMEDIATE 'DROP TABLE ' || cur_rec.table_name || ' CASCADE CONSTRAINTS';
END LOOP;
END;*/

/* BD RESTAURANTE */

create table platos (
    id int primary key,
    nombre varchar(100) not null,
    precio number(6,2),
    tiempo_preparacion int
);
create table ingredientes(
    id int primary key,
    nombre varchar(100) not null,
    categoria varchar(30) check(categoria in ('CARNE','PESCADO','CONDIMENTO','FRUTA','VERDURA','LACTEO','BEBIDA','LEGUMBRE','OTRO')),
    estado varchar(30) check( estado in ('SOLIDO','LIQUIDO'))
);
create table ingredientes_platos(
    id_ingrediente int,
    id_plato int,
    cantidad int
);
alter table ingredientes_platos
add foreign key (id_ingrediente) references ingredientes(id);
alter table ingredientes_platos
add foreign key (id_plato) references platos(id);
create table clientes(
    id int primary key,
    nombre varchar(100) not null,
    telefono varchar(10),
    localidad varchar(100) not null
);
create table comandas(
    id int primary key,
    mesa int,
    id_cliente int,
    id_plato int,
    estado varchar(30) check( estado in ('COCINA','SERVIDO','COBRADO','DEVUELTO')),
    fecha date,
    hora char(5)
);
alter table comandas
add foreign key (id_cliente) references clientes(id);
alter table comandas
add foreign key (id_plato) references platos(id);

alter session set nls_date_format='DD-MM-YYYY HH24:MI:SS';

insert into platos values (1,'Plato Arroz caldoso',12.50,25);
insert into platos values (2,'Plato Calamares con patatas',7.50,15);
insert into platos values (3,'Entrante bacalao en aceite',4.50,10);
insert into platos values (4,'Entrante Crema de zanahorias',3,10);
insert into platos values (5,'Tarta de queso',5.50,10);

insert into ingredientes values (1,'Ajo','VERDURA','SOLIDO');
insert into ingredientes values (2,'Aceite de oliva virgen extra','CONDIMENTO','LIQUIDO');
insert into ingredientes values (3,'Cebolla','VERDURA','SOLIDO');
insert into ingredientes values (4,'Calamar','PESCADO','SOLIDO');
insert into ingredientes values (5,'Patata','VERDURA','SOLIDO');
insert into ingredientes values (6,'Pimiento','VERDURA','SOLIDO');
insert into ingredientes values (7,'Vino blanco','BEBIDA','LIQUIDO');
insert into ingredientes values (8,'Sal','CONDIMENTO','SOLIDO');
insert into ingredientes values (9,'Pimienta','CONDIMENTO','SOLIDO');
insert into ingredientes values (10,'Costilla de cerdo','CARNE','SOLIDO');
insert into ingredientes values (11,'Guisante','VERDURA','SOLIDO');
insert into ingredientes values (12,'Tomate','VERDURA','SOLIDO');
insert into ingredientes values (13,'Pimenton dulce','CONDIMENTO','SOLIDO');
insert into ingredientes values (14,'Agua','BEBIDA','LIQUIDO');
insert into ingredientes values (15,'Caldo de ave','BEBIDA','LIQUIDO');
insert into ingredientes values (16,'Arroz','LEGUMBRE','SOLIDO');
insert into ingredientes values (17,'Bacalao','PESCADO','SOLIDO');
insert into ingredientes values (18,'Guindilla','CONDIMENTO','SOLIDO');
insert into ingredientes values (19,'Perejil','CONDIMENTO','SOLIDO');
insert into ingredientes values (20,'Zanahoria','VERDURA','SOLIDO');
insert into ingredientes values (21,'Caldo de verduras','CONDIMENTO','LIQUIDO');
insert into ingredientes values (22,'Nata liquida','LACTEO','LIQUIDO');
insert into ingredientes values (23,'Queso mascarpone','LACTEO','SOLIDO');
insert into ingredientes values (24,'Leche','LACTEO','SOLIDO');
insert into ingredientes values (25,'Esencia vainilla','CONDIMENTO','LIQUIDO');
insert into ingredientes values (26,'Huevo','OTRO','SOLIDO');
insert into ingredientes values (27,'Harina','OTRO','SOLIDO');
insert into ingredientes values (28,'Frutos rojos','FRUTA','SOLIDO');

insert into ingredientes_platos values (1,1,3);
insert into ingredientes_platos values (2,1,30);
insert into ingredientes_platos values (10,1,300);
insert into ingredientes_platos values (11,1,60);
insert into ingredientes_platos values (12,1,40);
insert into ingredientes_platos values (13,1,5);
insert into ingredientes_platos values (14,1,250);
insert into ingredientes_platos values (15,1,400);
insert into ingredientes_platos values (6,1,80);
insert into ingredientes_platos values (8,1,10);
insert into ingredientes_platos values (16,1,150);
insert into ingredientes_platos values (4,2,400);
insert into ingredientes_platos values (2,2,40);
insert into ingredientes_platos values (3,2,100);
insert into ingredientes_platos values (1,2,10);
insert into ingredientes_platos values (5,2,120);
insert into ingredientes_platos values (6,2,80);
insert into ingredientes_platos values (7,2,120);
insert into ingredientes_platos values (8,2,12);
insert into ingredientes_platos values (9,2,8);
insert into ingredientes_platos values (17,3,125);
insert into ingredientes_platos values (1,3,5);
insert into ingredientes_platos values (18,3,2);
insert into ingredientes_platos values (2,3,20);
insert into ingredientes_platos values (19,3,2);
insert into ingredientes_platos values (3,4,25);
insert into ingredientes_platos values (20,4,60);
insert into ingredientes_platos values (21,4,250);
insert into ingredientes_platos values (22,4,50);
insert into ingredientes_platos values (8,4,5);
insert into ingredientes_platos values (9,4,5);
insert into ingredientes_platos values (2,4,15);
insert into ingredientes_platos values (2,5,3);
insert into ingredientes_platos values (23,5,60);
insert into ingredientes_platos values (24,5,20);
insert into ingredientes_platos values (25,5,1);
insert into ingredientes_platos values (26,5,10);
insert into ingredientes_platos values (27,5,10);
insert into ingredientes_platos values (28,5,20);

insert into clientes values (1,'Pedro Juan','111222333','Bormujos');
insert into clientes values (2,'Jose Miguel','222333444','Bormujos');
insert into clientes values (3,'Maria','333444555','Gines');

insert into comandas values (1,1,1,3,'COCINA','01-03-2021','21:00');
insert into comandas values (2,1,1,1,'COCINA','01-03-2021','21:00');
insert into comandas values (3,2,2,3,'COCINA','01-03-2021','21:05');
insert into comandas values (4,2,2,4,'COCINA','01-03-2021','21:05');
insert into comandas values (5,1,1,3,'SERVIDO','01-03-2021','21:10');
insert into comandas values (6,2,2,3,'SERVIDO','01-03-2021','21:15');
insert into comandas values (7,2,2,4,'SERVIDO','01-03-2021','21:16');
insert into comandas values (8,2,2,2,'COCINA','01-03-2021','21:16');
insert into comandas values (9,1,1,1,'SERVIDO','01-03-2021','21:25');
insert into comandas values (10,1,1,5,'COCINA','01-03-2021','21:25');
insert into comandas values (11,2,2,5,'COCINA','01-03-2021','21:26');
insert into comandas values (12,2,2,2,'SERVIDO','01-03-2021','21:35');
insert into comandas values (13,1,1,5,'SERVIDO','01-03-2021','21:37');
insert into comandas values (14,2,2,5,'SERVIDO','01-03-2021','21:38');
insert into comandas values (15,1,1,3,'COBRADO','01-03-2021','21:50');
insert into comandas values (16,1,1,1,'COBRADO','01-03-2021','21:50');
insert into comandas values (17,1,1,5,'COBRADO','01-03-2021','21:50');
insert into comandas values (18,1,2,3,'COBRADO','01-03-2021','21:50');
insert into comandas values (19,1,2,4,'COBRADO','01-03-2021','21:50');
insert into comandas values (20,1,2,2,'COBRADO','01-03-2021','21:50');
insert into comandas values (21,1,2,5,'COBRADO','01-03-2021','21:50');
insert into comandas values (22,1,3,3,'COCINA','02-03-2021','21:05');
insert into comandas values (23,1,3,1,'COCINA','02-03-2021','21:10');
insert into comandas values (24,1,3,2,'COCINA','02-03-2021','21:12');
insert into comandas values (25,1,3,1,'DEVUELTO','02-03-2021','21:12');
insert into comandas values (26,1,3,3,'SERVIDO','02-03-2021','21:15');
insert into comandas values (27,1,3,2,'SERVIDO','02-03-2021','21:27');
insert into comandas values (28,1,3,5,'COCINA','02-03-2021','21:27');
insert into comandas values (29,1,3,5,'SERVIDO','02-03-2021','21:37');
insert into comandas values (30,1,3,3,'COBRADO','02-03-2021','21:55');
insert into comandas values (31,1,3,2,'COBRADO','02-03-2021','21:55');
insert into comandas values (32,1,3,5,'COBRADO','02-03-2021','21:55');

/* 1. ¿Cuál es la categoría de ingrediente [carne, pescado, etc.] que se usa en mayor cantidad en los platos del restaurante? */
SELECT ingredientes.categoria, SUM(cantidad) FROM ingredientes_platos JOIN ingredientes ON ingredientes.id = ingredientes_platos.id_ingrediente GROUP BY categoria ORDER BY SUM(cantidad) DESC;

--SOLUCIÓN PROFESOR
select categoria,sum(cantidad) from ingredientes_platos join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente group by categoria
    having sum(cantidad) = (select max(sum(cantidad)) from ingredientes_platos join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente group by categoria);

/* 2. Queremos el primer nombre de todos los clientes que tienen 333 en alguna parte de su teléfono. Debe ir completamente en mayúsculas.
      No deben haber espacio en blanco al principio o al final del nombre en el resultado final. */
SELECT TRIM(UPPER(SUBSTR(nombre, 1, INSTR(nombre || ' ', ' ')))) FROM clientes WHERE telefono LIKE '%333%';
--SOLUCIÓN PROFESOR
select upper(replace(substr(nombre,1,instr(nombre||' ',' ')),' ')) from clientes where telefono like '%333%'; 
      
/* 3. Se quiere mostrar todos los nombres de los ingredientes que empiecen por una letra consonante, con todas sus letras en mayúsculas y cuyo estado sea LÍQUIDO. */
SELECT UPPER(ingredientes.nombre) FROM ingredientes WHERE LOWER(ingredientes.estado) = 'liquido' AND NOT REGEXP_LIKE(ingredientes.nombre, '^[AEIOU]');
--SOLUCIÓN PROFESOR
select upper(nombre) from ingredientes where lower(substr(nombre,1,1)) not in ('a','e','i','o','u') and estado = 'LIQUIDO';

/* 4. ¿Cuál es la diferencia de cantidad que hay entre el ingrediente que se usa en mayor cantidad y el que se usa en menos? Expresa el valor añadiendo al final "gramos".
      Añade el alias de columna "Diferencia" al resultado. */
SELECT (SELECT MAX(SUM(cantidad)) FROM ingredientes_platos GROUP BY id_ingrediente) - (SELECT MIN(SUM(cantidad)) FROM ingredientes_platos GROUP BY id_ingrediente) || ' gramos' AS "Diferencia" FROM dual;
--SOLUCIÓN PROFESOR
select max(cantidad) - min(cantidad) || ' gramos' "Diferencia" from ingredientes_platos;
      
/* 5. Se quiere mostrar el nombre de los platos pero con un formato distinto. Se quiere quitar las palabras "Plato" y "Entrante", debe estar la primera letra en mayúsculas de cada palabra,
      y se debe incluir un punto y final al terminar de mostrar el nombre del plato. No debe quedar ningún espacio ni al principio ni al final del nombre del plato. */
SELECT INITCAP(TRIM(REPLACE(TRIM(REPLACE(nombre, 'Plato', '')), 'Entrante', ''))) || '.' FROM platos;
--SOLUCIÓN PROFESOR
select initcap(trim(replace(replace(nombre,'Entrante ',''),'Plato ',''))||'.') from platos;
      
/* 6. ¿Qué nombre de platos se sirvieron (estado SERVIDO en COMANDAS), sin repetir, el 1 de marzo de 2021 entre las 21 y las 21:30? */
SELECT DISTINCT(nombre) FROM platos JOIN comandas ON platos.id = comandas.id_plato WHERE comandas.estado = 'SERVIDO' AND comandas.fecha = '01/03/21' AND comandas.hora BETWEEN '21:00' AND '21:30';
--SOLUCIÓN PROFESOR
select distinct nombre from comandas join platos on platos.id = comandas.id_plato where estado = 'SERVIDO' and fecha = to_date('01-03-2021') and hora between '21:00' and '21:30';

/* 7. Se quiere una lista con el nombre en minúsculas de todos los ingredientes que sean CONDIMENTO y se encuentren en estado SOLIDO. */
SELECT LOWER(ingredientes.nombre) FROM ingredientes WHERE ingredientes.categoria = 'CONDIMENTO' AND ingredientes.estado = 'SOLIDO';
--SOLUCIÓN PROFESOR
select lower(nombre) from ingredientes where categoria = 'CONDIMENTO' and estado = 'SOLIDO';

/* 8. Se quiere saber todas las categorias (CATEGORIA) de ingredientes que haya sin repetir resultado ordenadas en orden de la z a la a. */
SELECT DISTINCT(ingredientes.categoria) FROM ingredientes ORDER BY ingredientes.categoria DESC;
--SOLUCIÓN PROFESOR
select distinct categoria from ingredientes order by categoria desc;

/* 9. Se quiere saber cuántas comandas se realizaron entre las 21:00 y las 21:10 horas (ambas inclusive) el día 01/03/21. */
SELECT COUNT(*) FROM comandas WHERE comandas.hora BETWEEN '21:00' AND '21:10' AND comandas.fecha = '01/03/21';
--SOLUCION PROFESOR
select count(*) from comandas where hora between '21:00' and '21:10' and fecha = '01-03-2021';

/* 10. Muestra el nombre, teléfono y localidad de los clientes que viva en Bormujos y su teléfono no empiece por 1. Debes usar alias para
       nombrar las tres columnas ,la primera será "Cliente", la segunda "Tfno" y la tercera "Loc". */
SELECT clientes.nombre "Cliente", clientes.telefono "Tfno", clientes.localidad "Loc" FROM clientes WHERE clientes.localidad = 'Bormujos' AND clientes.telefono NOT LIKE '1%';
--SOLUCIÓN PROFESOR
select nombre "Cliente",telefono "Tfno",localidad "Loc" from clientes where localidad = 'Bormujos' and telefono not like '1%';
       
/* 11. Muestra todos los datos de la tabla ingredientes en mayúsculas y que se encuentren en estado SOLIDO. */
SELECT id, UPPER(nombre), UPPER(categoria), UPPER(estado) FROM ingredientes WHERE estado = 'SOLIDO';
--SOLUCION PROFESOR
select id,upper(nombre),upper(categoria),upper(estado) from ingredientes where estado = 'SOLIDO';

/* 12. ¿Cuál es el ingrediente cuyo nombre tiene más carácteres? Pon en una única columna el nombre del ingrediente: número de caracteres. Ej: Guisante: 8. */
SELECT nombre || ': ' || LENGTH(nombre) FROM ingredientes WHERE LENGTH(nombre) = (SELECT MAX(LENGTH(nombre)) FROM ingredientes);
--SOLUCION PROFESOR
select nombre || ': ' || length(nombre) from ingredientes where length(nombre) = (select max(length(nombre)) from ingredientes);

/* 13. ¿Cuántas comandas se han hecho en MARTES? Debe dar 11. */
SELECT COUNT(*) FROM comandas WHERE TRIM(TO_CHAR(fecha, 'DAY')) = 'MARTES';
--SOLUCION PROFESOR
select count(*) from comandas where trim(to_char(fecha,'DAY')) = 'MARTES';

/* 14. Se quiere saber cuántos platos se preparan en 10 minutos, cuántos en 15 y cuantos en 25. Muestra una lista agrupada con el tiempo de preparación y el número de platos
       que tardan ese tiempo. El resultado debe estar ordenado por el tiempo de preparación de menor a mayor. */
SELECT tiempo_preparacion, COUNT(*) FROM platos GROUP BY tiempo_preparacion ORDER BY tiempo_preparacion;
--SOLUCION PROFESOR
select tiempo_preparacion,count(*) from platos group by tiempo_preparacion order by tiempo_preparacion;

/* 15. Necesitamos una lista con el NOMBRE y la LOCALIDAD de los clientes, pero el NOMBRE debe tener todas las letras en mayúsculas y que no haya ningún espacio
       entre nombres compuestos. Ej: PEDROJUAN. */
SELECT UPPER(REPLACE(nombre,' ','')) localidad FROM clientes;
--SOLUCION PROFESOR
select upper(replace(nombre,' ')),localidad from clientes;
       
/* 16. Indica el valor medio del PRECIO de los platos con REDONDEO de dos decimales. */
SELECT ROUND(AVG(precio), 2) FROM platos;
--SOLUCION PROFESOR
select round(avg(precio),2) from platos;

/* 17. Indica el NOMBRE del plato más caro. */
SELECT nombre, precio FROM platos WHERE precio = (SELECT MAX(precio) FROM platos);
--SOLUCION PROFESOR
select nombre from platos where precio = (select max(precio) from platos);

/* 18. Indica la lista de ingredientes (NOMBRE y CANTIDAD en 2 columnas diferentes) del plato "Entrante bacalao en aceite". */
SELECT i.nombre, ip.cantidad FROM ingredientes i JOIN ingredientes_platos ip ON i.id = ip.id_ingrediente JOIN platos p ON ip.id_plato = p.id WHERE p.nombre = 'Entrante bacalao en aceite';
--SOLUCION PROFESOR
select ingredientes.nombre, cantidad from ingredientes_platos join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente join platos on platos.id = ingredientes_platos.id_plato
    where platos.nombre = 'Entrante bacalao en aceite';

/* 19. Indica la lista de ingredientes (NOMBRE) del plato "Tarta de queso" */
SELECT i.nombre FROM ingredientes i JOIN ingredientes_platos ip ON i.id = ip.id_ingrediente JOIN platos p ON ip.id_plato = p.id WHERE p.nombre = 'Tarta de queso';
--SOLUCION PROFESOR
select ingredientes.nombre from ingredientes_platos join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente join platos on platos.id = ingredientes_platos.id_plato
    where platos.nombre = 'Tarta de queso';

/* 20. Devuelve el NOMBRE y la CATEGORIA de los ingredientes que empiezan por "Pi". */
SELECT * FROM ingredientes WHERE LOWER(nombre) LIKE 'pi%';
--SOLUCION PROFESOR
select nombre,categoria from ingredientes where nombre like 'Pi%';

/* 21. ¿Cuántos ingredientes pertenecen a la CATEGORIA de LACTEO? Indica tan solo el número. */
SELECT COUNT(*) FROM ingredientes WHERE LOWER(categoria) = 'lacteo';
--SOLUCION PROFESOR
select count(*) from ingredientes where categoria = 'LACTEO';

/* 22. ¿Cuánto dinero se ha obtenido del plato de ID = 5?. Indica solo una columna con el importe con dos decimales. Recuerda que para obtener dinero de un plato,
       los comensales han debido de pagar la comanda, es decir, tener un estado COBRADO. */
SELECT ROUND(SUM(precio), 2) FROM comandas c JOIN platos p ON c.id_plato = p.id WHERE c.id_plato = 5 AND c.estado = 'COBRADO';
--SOLUCION PROFESOR
select round(sum(precio),2) from comandas join platos on platos.id = comandas.id_plato where estado = 'COBRADO' and id_plato = 5;
       
/* 23. ¿Cuál es el NOMBRE del ingrediente que se usa en más platos? */
SELECT COUNT(*), i.nombre FROM ingredientes i JOIN ingredientes_platos ip ON i.id = ip.id_ingrediente GROUP BY i.nombre HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM ingredientes_platos GROUP BY id_ingrediente);
--SOLUCION PROFESOR
select nombre, count(*) from ingredientes_platos join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente group by nombre
    having count(*) = (select max(count(*)) from ingredientes_platos group by id_ingrediente);

/* 24. ¿En el NOMBRE de qué platos se usa el ingrediente "Aceite de oliva virgen extra"?. */
SELECT p.nombre FROM platos p JOIN ingredientes_platos ip ON p.id = ip.id_plato JOIN ingredientes i ON ip.id_ingrediente = i.id WHERE LOWER(i.nombre) = 'aceite de oliva virgen extra';
--SOLUCION PROFESOR
select platos.nombre from ingredientes_platos join platos on platos.id = ingredientes_platos.id_plato join ingredientes on ingredientes.id = ingredientes_platos.id_ingrediente
    where ingredientes.nombre = 'Aceite de oliva virgen extra';

/* 25. ¿Cuál es el nombre del plato que entró por comanda en COCINA el 01/03/21 a las 21:16?. */
SELECT platos.nombre FROM platos JOIN comandas ON platos.id = comandas.id_plato WHERE estado = 'COCINA' AND fecha = '01/03/21' AND hora = '21:16';
--SOLUCION PROFESOR
select platos.nombre from comandas join platos on platos.id = comandas.id_plato where estado = 'COCINA' and fecha = '01/03/2021' and hora = '21:16';

/* 26. ¿Cuántas comandas, independientemente del estado de la comanda, hay registradas hasta ahora del plato "Entrante Crema de zanahorias"?. */
SELECT COUNT(*) FROM comandas JOIN platos ON comandas.id_plato = platos.id WHERE platos.nombre = 'Entrante Crema de zanahorias';
--SOLUCION PROFESOR
select count(*) from comandas join platos on platos.id = comandas.id_plato where platos.nombre = 'Entrante Crema de zanahorias';
select count(*) from comandas where id_plato = (select id from platos where nombre = 'Entrante Crema de zanahorias');

/* 27. Indica el nombre de los platos cuyo precio sea superior a 4 euros pero se tarde menos de 15 minutos en prepararse. */
SELECT platos.nombre FROM platos WHERE platos.precio > 4 AND platos.tiempo_preparacion < 15;
--SOLUCION PROFESOR
select nombre from platos where precio > 4 and tiempo_preparacion < 15;

/* 28. Indica el nombre de cliente que ha DEVUELTO una comanda. */
SELECT clientes.nombre FROM clientes WHERE clientes.id = (SELECT comandas.id_cliente FROM comandas WHERE comandas.estado = 'DEVUELTO');
--SOLUCION PROFESOR
select clientes.nombre from comandas join clientes on clientes.id = comandas.id_cliente where estado = 'DEVUELTO';

/* 29. ¿Cuántas comandas se han SERVIDO a la mesa 1 entre las 21:20 y las 21:50?. */
SELECT COUNT(*) FROM comandas WHERE comandas.estado = 'SERVIDO' AND comandas.mesa = 1 AND comandas.hora BETWEEN '21:20' AND '21:50';
--SOLUCION PROFESOR
select count(*) from comandas where estado = 'SERVIDO' and mesa = 1 and hora between '21:20' and '21:50';

/* 30. Indica la CATEGORIA del ingrediente Perejil. Debes mostrar dicha categoria con el tamaño/número de caracteres que sea el tamaño de la categoría que tenga menos letras.
       En este caso, es OTRO, que tiene 4 caracteres, pero no puedes usar el número 4, debes calcular en tu query ese tamaño mínimo. */
SELECT ingredientes.categoria FROM ingredientes WHERE ingredientes.nombre = 'Perejil';
/* 31. Se quiere saber el nombre del cliente, el tiempo de preparación del plato que pidió, el nombre del ingrediente que se usa en mayor cantidad en dicho plato que pidió
       y la categoría de dicho ingrediente, para aquella comanda realizada en la mesa 1 que fue DEVUELTO. */      
/* 32. Se quiere mostrar una lista con todos los ingredientes en una columna, y en otra columna la suma de la cantidad empleada por cada ingrediente en los distintos platos. */








