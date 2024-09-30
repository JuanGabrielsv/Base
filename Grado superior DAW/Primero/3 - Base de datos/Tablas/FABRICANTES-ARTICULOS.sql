//BORRADO DE TABLAS

/*BEGIN
FOR cur_rec IN (SELECT table_name FROM user_tables)
LOOP
EXECUTE IMMEDIATE 'DROP TABLE ' || cur_rec.table_name || ' CASCADE CONSTRAINTS';
END LOOP;
END;*/

create table fabricantes(
    codigo int primary key,
    nombre varchar(100)
);

create table articulos(
    codigo int primary key,
    nombre varchar(100),
    precio int,
    fabricante int
);

alter table articulos
    add constraint fk_fabricante_articulos 
    foreign key (fabricante)
    references fabricantes(codigo);
    
insert into fabricantes values (1,'LG');
insert into fabricantes values (2,'SAMSUNG');
insert into fabricantes values (3,'SIEMENS');
insert into fabricantes values (4,'SONY');

insert into articulos values (1, 'RADIO', 180, 1);
insert into articulos values (2, 'RADIO', 100, 2);
insert into articulos values (3, 'RADIO', 70, 3);
insert into articulos values (4, 'RADIO', 50, 4);
insert into articulos values (5, 'TELEVISION', 320, 1);
insert into articulos values (6, 'TELEVISION', 850, 2);
insert into articulos values (7, 'TELEVISION', 600, 3);
insert into articulos values (8, 'TELEVISION', 170, 4);