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

/* 1. �Cu�l es la categor�a de ingrediente [carne, pescado, etc.] que se usa en mayor cantidad en los platos del restaurante? */
/* 2. Queremos el primer nombre de todos los clientes que tienen 333 en alguna parte de su tel�fono. Debe ir completamente en may�sculas.
      No deben haber espacio en blanco al principio o al final del nombre en el resultado final. */
/* 3. Se quiere mostrar todos los nombres de los ingredientes que empiecen por una letra consonante, con todas sus letras en may�sculas y cuyo estado sea L�QUIDO. */
/* 4. �Cu�l es la diferencia de cantidad que hay entre el ingrediente que se usa en mayor cantidad y el que se usa en menos? Expresa el valor a�adiendo al final "gramos".
      A�ade el alias de columna "Diferencia" al resultado. */
/* 5. Se quiere mostrar el nombre de los platos pero con un formato distinto. Se quiere quitar las palabras "Plato" y "Entrante", debe estar la primera letra en may�sculas de cada palabra,
      y se debe incluir un punto y final al terminar de mostrar el nombre del plato. No debe quedar ning�n espacio ni al principio ni al final del nombre del plato. */
/* 6. �Qu� nombre de platos se sirvieron (estado SERVIDO en COMANDAS), sin repetir, el 1 de marzo de 2021 entre las 21 y las 21:30? */
/* 7. Se quiere una lista con el nombre en min�sculas de todos los ingredientes que sean CONDIMENTO y se encuentren en estado SOLIDO. */
/* 8. Se quiere saber todas las categorias (CATEGORIA) de ingredientes que haya sin repetir resultado ordenadas en orden de la z a la a. */
/* 9. Se quiere saber cu�ntas comandas se realizaron entre las 21:00 y las 21:10 horas (ambas inclusive) el d�a 01/03/21. */
/* 10. Muestra el nombre, tel�fono y localidad de los clientes que viva en Bormujos y su tel�fono no empiece por 1. Debes usar alias para
       nombrar las tres columnas ,la primera ser� "Cliente", la segunda "Tfno" y la tercera "Loc". */
/* 11. Muestra todos los datos de la tabla ingredientes en may�sculas y que se encuentren en estado SOLIDO. */
/* 12. �Cu�l es el ingrediente cuyo nombre tiene m�s car�cteres? Pon en una �nica columna el nombre del ingrediente: n�mero de caracteres. Ej: Guisante: 8. */
/* 13. �Cu�ntas comandas se han hecho en MARTES? Debe dar 11. */
/* 14. Se quiere saber cu�ntos platos se preparan en 10 minutos, cu�ntos en 15 y cuantos en 25. Muestra una lista agrupada con el tiempo de preparaci�n y el n�mero de platos
       que tardan ese tiempo. El resultado debe estar ordenado por el tiempo de preparaci�n de menor a mayor. */
/* 15. Necesitamos una lista con el NOMBRE y la LOCALIDAD de los clientes, pero el NOMBRE debe tener todas las letras en may�sculas y que no haya ning�n espacio
       entre nombres compuestos. Ej: PEDROJUAN. */
/* 16. Indica el valor medio del PRECIO de los platos con REDONDEO de dos decimales. */
/* 17. Indica el NOMBRE del plato m�s caro. */
/* 18. Indica la lista de ingredientes (NOMBRE y CANTIDAD en 2 columnas diferentes) del plato "Entrante bacalao en aceite". */
/* 19. Indica la lista de ingredientes (NOMBRE) del plato "Tarta de queso" */
/* 20. Devuelve el NOMBRE y la CATEGORIA de los ingredientes que empiezan por "Pi". */
/* 21. �Cu�ntos ingredientes pertenecen a la CATEGORIA de LACTEO? Indica tan solo el n�mero. */
/* 22. �Cu�nto dinero se ha obtenido del plato de ID = 5?. Indica solo una columna con el importe con dos decimales. Recuerda que para obtener dinero de un plato,
       los comensales han debido de pagar la comanda, es decir, tener un estado COBRADO. */
/* 23. �Cu�l es el NOMBRE del ingrediente que se usa en m�s platos? */
/* 24. �En el NOMBRE de qu� platos se usa el ingrediente "Aceite de oliva virgen extra"?. */
/* 25. �Cu�l es el nombre del plato que entr� por comanda en COCINA el 01/03/21 a las 21:16?. */
/* 26. �Cu�ntas comandas, independientemente del estado de la comanda, hay registradas hasta ahora del plato "Entrante Crema de zanahorias"?. */
/* 27. Indica el nombre de los platos cuyo precio sea superior a 4 euros pero se tarde menos de 15 minutos en prepararse. */
/* 28. Indica el nombre de cliente que ha DEVUELTO una comanda. */
/* 29. �Cu�ntas comandas se han SERVIDO a la mesa 1 entre las 21:20 y las 21:50?. */
/* 30. Indica la CATEGORIA del ingrediente Perejil. Debes mostrar dicha categoria con el tama�o/n�mero de caracteres que sea el tama�o de la categor�a que tenga menos letras.
       En este caso, es OTRO, que tiene 4 caracteres, pero no puedes usar el n�mero 4, debes calcular en tu query ese tama�o m�nimo. */       
/* 31. Se quiere saber el nombre del cliente, el tiempo de preparaci�n del plato que pidi�, el nombre del ingrediente que se usa en mayor cantidad en dicho plato que pidi�
       y la categor�a de dicho ingrediente, para aquella comanda realizada en la mesa 1 que fue DEVUELTO. */      
/* 32. Se quiere mostrar una lista con todos los ingredientes en una columna, y en otra columna la suma de la cantidad empleada por cada ingrediente en los distintos platos. */








