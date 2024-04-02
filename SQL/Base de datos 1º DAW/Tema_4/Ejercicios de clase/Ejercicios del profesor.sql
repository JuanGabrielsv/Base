select * from futbolistas;
--¿Cuántos futbolistas son delanteros?
select count(id) from futbolistas where posicion = 'DELANTERO';
--Dame una lista con el número de futbolistas que hay por cada posición
select posicion,count(*) from futbolistas group by posicion;

select count(*),posicion from futbolistas group by posicion having posicion like 'DE%';

--Quiero saber la suma total de los presupuestos de los equipos
select * from equipos;
select min(presupuesto) from equipos;
select max(presupuesto) from equipos;
select avg(presupuesto) from equipos;
select sum(presupuesto) from equipos;
select sum(presupuesto) from equipos where id in (1,2);
select count(id) from equipos;
select * from partidos;
select count(id) from partidos;--6
select count(arbitro) from partidos;--5
select count(*) from partidos;--6

ALTER TABLE FUTBOLISTAS
ADD ALTURA INT;
ALTER TABLE FUTBOLISTAS
ADD PESO NUMBER(4,1);

UPDATE FUTBOLISTAS SET ALTURA = 179, PESO = 76 WHERE NOMBRE LIKE 'PEDRO LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 174, PESO = 71.5 WHERE NOMBRE LIKE 'LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 169, PESO = 66 WHERE NOMBRE LIKE 'JESUS';
UPDATE FUTBOLISTAS SET ALTURA = 189, PESO = 82 WHERE NOMBRE LIKE 'DIEGO';
UPDATE FUTBOLISTAS SET ALTURA = 183, PESO = 84 WHERE NOMBRE LIKE 'PABLO';
UPDATE FUTBOLISTAS SET ALTURA = 180, PESO = 81.5 WHERE NOMBRE LIKE 'ESTEBAN';
UPDATE FUTBOLISTAS SET ALTURA = 162, PESO = 60 WHERE NOMBRE LIKE 'ENRIQUE';

select * from futbolistas;
