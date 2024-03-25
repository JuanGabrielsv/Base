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

--1
SELECT hora FROM comandas WHERE mesa = 2;

--2
SELECT MAX(COUNT(localidad)) FROM clientes c JOIN comandas co ON c.id = co.id_cliente GROUP BY localidad;

--3
SELECT DISTINCT(telefono) FROM clientes c JOIN comandas co ON c.id = co.id_cliente WHERE hora = '21:27' AND estado = 'SERVIDO';

--4
SELECT i.nombre, ip.cantidad FROM ingredientes i JOIN ingredientes_platos ip ON i.id = ip.id_ingrediente WHERE ip.cantidad BETWEEN 100 AND 200 ORDER BY cantidad DESC;

--5
SELECT SUBSTR(nombre, INSTR(nombre, ' ', 1), INSTR(nombre, ' ', 2)) FROM ingredientes;

--6
SELECT COUNT(nombre) FROM ingredientes WHERE LENGTH(nombre) > 10;

--7
SELECT LOWER(nombre) FROM platos WHERE REGEXP_LIKE(nombre, '^[PRAST]') AND precio < 10 AND tiempo_preparacion > 7;

--8
SELECT p.precio FROM comandas co JOIN platos p ON co.id_plato = p.id WHERE hora = '21:10' AND fecha = '01/03/21' AND mesa = 1;

--9
SELECT REPLACE(UPPER(nombre),' ','') FROM ingredientes WHERE estado = 'LIQUIDO';

--10


--11
SELECT ROUND(SUM(precio), 0) FROM comandas co JOIN platos p ON co.id_plato = p.id WHERE estado = 'COBRADO'; --FORMA UNA (YA QUE NO SE INDICA TIPO DE REDONDEO)
SELECT FLOOR(SUM(precio)) FROM comandas co JOIN platos p ON co.id_plato = p.id WHERE estado = 'COBRADO'; --FORMA DOS (YA QUE NO SE INDICA TIPO DE REDONDEO)

--12
SELECT 'El ingrediente con más letras es ' || UPPER(nombre), LENGTH(nombre) FROM ingredientes WHERE LENGTH(nombre) = (SELECT MAX(LENGTH(nombre)) FROM ingredientes);

--13
SELECT DISTINCT(p.nombre) FROM platos p JOIN ingredientes_platos ip ON p.id = ip.id_plato JOIN ingredientes i ON ip.id_ingrediente = i.id WHERE categoria = 'VERDURA';

--14
SELECT UPPER(c.nombre) FROM clientes c JOIN comandas co ON c.id = co.id_cliente WHERE co.estado = 'COCINA' AND co.fecha = '01/03/21' AND co.hora BETWEEN '21:20' AND '21:40';

--15
SELECT INITCAP(nombre) FROM platos WHERE precio BETWEEN 5 AND 8;

--16
SELECT DISTINCT(i.categoria) FROM ingredientes i JOIN ingredientes_platos ip ON i.id = ip.id_ingrediente JOIN platos p ON ip.id_plato = p.id WHERE LOWER(p.nombre) = 'plato calamares con patatas';

--17
SELECT LOWER(estado) FROM comandas GROUP BY estado ORDER BY estado DESC;

--18


--19
SELECT COUNT(*) FROM ingredientes WHERE categoria = 'VERDURA' AND nombre LIKE 'P%';

--20
SELECT p.nombre AS "Plato", ip.cantidad AS "Cant" FROM platos p JOIN ingredientes_platos ip ON p.id = ip.id_plato JOIN ingredientes i ON ip.id_ingrediente = i.id WHERE LOWER(i.nombre) = 'cebolla';

--21
SELECT COUNT(*) FROM comandas WHERE fecha = '01/03/21' AND hora BETWEEN '21:00' AND '21:10';

--22
SELECT MAX(p.precio) FROM comandas co JOIN platos p ON co.id_plato = p.id WHERE estado = 'SERVIDO' AND fecha = '01/03/21';

--23
SELECT p.nombre, COUNT(ip.id_ingrediente) FROM platos p JOIN ingredientes_platos ip ON p.id = ip.id_plato GROUP BY p.nombre ORDER BY COUNT(ip.id_ingrediente) DESC;

--24
SELECT ROUND(AVG(cantidad), 3) FROM ingredientes_platos;

--25

--26
SELECT tiempo_preparacion FROM platos WHERE precio = (SELECT MIN(precio) FROM platos);

--27
SELECT nombre, localidad FROM clientes WHERE nombre LIKE '%n';

--28
SELECT COUNT(*) FROM comandas WHERE TRIM(TO_CHAR(fecha, 'Day')) = 'Lunes';

--29
SELECT i.nombre FROM ingredientes i JOIN platos p ON i.id = p.id JOIN ingredientes_platos ip ON p.id = ip.id_plato WHERE LOWER(p.nombre) = 'entrante crema de zanahorias' AND ip.cantidad = 60;

--30
SELECT COUNT(DISTINCT(co.id_plato)) FROM comandas co JOIN clientes c ON co.id_cliente = c.id WHERE c.nombre = 'Jose Miguel';

--31
SELECT REPLACE(REPLACE(REPLACE(REPLACE(nombre, 'a', '-'), 'e', '_'), 'A', '-'), 'E', '_') FROM ingredientes WHERE categoria = 'CONDIMENTO';

--32
SELECT DECODE(INSTR(cantidad, 0),0,'NO',INSTR(cantidad, 0)) FROM ingredientes_platos;





