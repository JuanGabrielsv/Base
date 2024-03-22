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

/* Examen T4 2ºEVAL SEMANA VERDE DAW */

/* 1. Muestra la hora de todas las comandas que se hayan SERVIDO en la mesa 2. */
/* 2. ¿Cuál es la localidad de los clientes que más comandas han pedido? */
/* 3. Necesitamos una lista con el teléfono del cliente, sin repetir, al que se le haya SERVIDO una comanda a las 21:27 horas. */
/* 4. Indica la lista de ingredientes (NOMBRE) que se usan (suma de sus cantidades) entre 100 y 200 ordenados de mayor a menor suma de cantidades. */
/* 5. Se quiere saber la segunda palabra de los ingredientes. En caso de que no tengan, no debe aparecer el registro (no muestres null).
      Si tiene más de dos palabras, se quiere solo la segunda, el resto de palabras no deben aparecer. Ej.: De Aceite de oliva virgen extra debería mostrarse la palabra "de". */
/* 6. ¿Cuántos ingredientes tienen en su nombre más de 10 letras?. */
/* 7. Se quiere mostrar el nombre de los platos que empiecen por una de las siguientes letras: P, R, A, S o T. 
      El resultado debe mostrarse con todas las letras en minúsculas, y deben ser los platos cuyo precio sea inferior a 10 euros y el tiempo de preparación mayor de 7. */
/* 8. Indica el precio del plato que se ha SERVIDO el 01-03-2021 a las 21:10 en la mesa 1. */
/* 9. Se quiere mostrar el nombre de los ingredientes en mayúsculas y sin espacios entre las palabras, pero solo de aquellos ingredientes que están en estado "LIQUIDO". */
/* 10. Se quiere saber los nombres de los clientes y los nombres de los platos que pidieron cuyas comandas han sido las más recientes (fecha más cercana a hoy en día y hora). */
/* 11. Se quiere saber cuánto se ha COBRADO en las comandas (suma de los importes de los platos). El resultado no debe tener decimales. */
/* 12. Se quiere mostrar el nombre del ingrediente que tiene más letras. Debes mostrar el siguiente mensaje sustituyendo el nombre del ingrediente
       por el que sea: "El ingrediente con más letras es NOMBREINGREDIENTE". En una segunda columna debes devolver el número de letras de dicho ingrediente. */
/* 13. Indica el nombre de los platos que usan ingredientes de la categoría 'VERDURA'. */
/* 14. ¿Qué nombres de clientes pidieron una comanda el 1 de marzo de 2021 entre las 21:20 y las 21:40 horas y el estado fue COCINA? Devuelve el nombre del cliente todo en mayúsculas. */
/* 15. Se quiere una lista de los nombres de los platos con la primera letra en mayúscula de cada palabra y que el precio esté entre 5 y 8. */
/* 16. Indica las categorías de los ingredientes, sin repetir, que se usan en el plato "Plato Calamares con patatas". */
/* 17. Se quiere saber todos los estados, sin repetir, de las comandas. Debes devolver todas las letras en minúsculas y que el orden de los resultados sea por dicho estado de la z a la a. */
/* 18. Indica el nombre de los ingredientes que empiezan por "G" o "P" sin usar LIKE. */
/* 19. Se quiere saber cuántos ingredientes son de la categoría VERDURA y el nombre del ingrediente empieza por P. */
/* 20. Indica los nombres de los platos en los que está el ingrediente "Cebolla" y la cantidad que llevan del ingrediente.
       El nombre de los platos debe tener el alias "Plato" y la cantidad debe tener el alias "Cant". */
/* 21. Indica cuántas comandas se han hecho entre las 21:00 y las 21:10 del día 01-03-2021. */
/* 22. ¿Cuál es el precio de plato más caro que se ha SERVIDO el 01-03-2021?. */
/* 23. Se quiere saber cuántos ingredientes tiene cada plato. Muestra una lista con todos los nombres de los platos y en otra columna el número de ingredientes que tiene.
       Ordena el resultado empezando por el plato que tiene más ingredientes y terminando por el que menos tiene. */
/* 24. Indica el valor medio de las cantidades de los ingredientes con redondeo de tres decimales. */
/* 25. ¿Cuál es el nombre del plato que entró por comanda en estado SERVIDO el 01/03/21 a las 21:25? Usa solo subconsultas. */
/* 26. Indica el tiempo de preparación del plato más barato. */
/* 27. Devuelve el NOMBRE y la localidad de los clientes cuyo nombre termine en "n". */
/* 28. ¿Cuántas comandas han sido en LUNES?. */
/* 29. ¿Cuál es el NOMBRE del ingrediente que se usa en el plato "Entrante Crema de zanahorias" cuya cantidad es 60?. */
/* 30. ¿Cuántas comandas ha hecho "Jose Miguel"?. */
/* 31. Indica el nombre de todos los ingredientes que sean de la categoría CONDIMENTO, sustituyendo la letra a por - y la letra e por _ estén en mayúsculas o en minúsculas. */
/* 32. Devuelve la posición del primer 0 en cantidad de los ingredientes en los platos. Si dicha cantidad no tiene 0, muestra la palabra 'no'. */



