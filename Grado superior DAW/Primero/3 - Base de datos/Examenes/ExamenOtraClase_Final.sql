/*
1.1. Crea una función obtenerIngredientesPlato que reciba como parámetros el nombre de un plato (nombre 
de la tabla platos) y una categoría de ingrediente (campo categoria en la tabla ingredientes), muestre 
por la salida todos los ingredientes que tiene ese plato (solo el nombre del ingrediente) y al finalizar,
aparezca el mensaje 'De todos esos ingredientes, hay X de la categoría Y', debiendo sustituir X por el 
número total de ingredientes de ese plato que son de la categoría pasada como parámetro, e Y será el 
nombre de esa categoría. Para finalizar, se devolverá el número total de ingredientes que tiene ese plato. 
EXCEPCIONES: si se pasa un nombre de un plato que no existe, o bien una categoría que no exista en la base 
de datos (independientemente de que ese plato tenga ingredientes o no de esa categoría), debes mostrar un
mensaje indicando 'Error, ese plato o categoría no es válido' y devolver -1. Si existiera un plato válido
con categoría de ingrediente válido pero sin ingredientes, devuelve 0.
*/
select ingredientes.nombre, platos.nombre 
    from ingredientes 
    join ingredientes_platos on id_ingrediente = ingredientes.id
    join platos on platos.id = id_plato;
create or replace function obtenerIngredientesPlato(
    vplato platos.nombre%type, vcategoria ingredientes.categoria%type) return int
is
    total int := 0;
    contadorCategoria int := 0;
    cursor datos is 
    select ingredientes.nombre as nombreIngrediente, ingredientes.categoria
        from ingredientes 
        join ingredientes_platos on id_ingrediente = ingredientes.id
        join platos on platos.id = id_plato
        where platos.nombre = vplato;
    existePlato platos.id%type;
    existeCategoria ingredientes.categoria%type;
begin
    select id into existePlato from platos where nombre = vplato;
    select distinct categoria into existeCategoria from ingredientes where categoria = vcategoria;
    for fila in datos loop
        if fila.categoria = vcategoria then
            contadorCategoria := contadorCategoria + 1;
        end if;
        dbms_output.put_line(fila.nombreIngrediente);
        total := total + 1;
    end loop;   
    dbms_output.put_line('De todos esos ingredientes, hay ' || contadorCategoria || ' de la categoría ' || vcategoria);
    return total;
exception
    when no_data_found then
        dbms_output.put_line('Error, ese plato o categoría no es válido');
        return -1;
end;
/
begin
    dbms_output.put_line(obtenerIngredientesPlato('Plato Arroz caldoso','BEBIDA'));
end;
/

/*
1.4. Se quiere un procedimiento llamado comandasTotal, que tendrá un parámetro de entrada diaSemana que 
será un día de la semana con todas sus letras en minúsculas (Ej.: lunes, martes, miercoles, etc.), un 
parámetro de salida que llame total, y que realice lo siguiente:
 
A partir del día de la semana pasado por parámetro, obtener el número total de comandas realizadas en ese 
día de la semana (lunes, martes, etc.) y guardar ese valor en el parámetro de salida total.
Mostrar un mensaje por la salida de consola con el número total de comandas de ese día de la semana cuya 
hora tiene un valor par de minutos (ej.: 2, 4, 16, 44, etc. MINUTOS). NOTA: no calcules el valor total de 
minutos contando las horas, solo los minutos de ese valor. Ej.: 21:50 vale porque 50 es par.
Indicar en un mensaje por la salida el número total de comandas en ese día de la semana hechas por 'Pedro 
Juan'.
*/
select count(*) from comandas where lower(replace(to_char(fecha,'day'),' ')) = 'lunes';
create or replace procedure comandasTotal(diaSemana varchar,total out int)
is
    cursor datos is select hora from comandas where lower(replace(to_char(fecha,'day'),' ')) = diaSemana;
    contador int := 0;
    totalPedroJuan int := 0;
begin
    select count(*) into total from comandas where lower(replace(to_char(fecha,'day'),' ')) = diaSemana;
    for fila in datos loop
        if mod(to_number(substr(fila.hora,4,2)),2) = 0 then
            contador := contador + 1;
        end if;
    end loop;
    dbms_output.put_line('Total : ' || contador);
    select count(*) into totalPedroJuan 
        from comandas 
        join clientes on clientes.id = comandas.id_cliente
        where lower(replace(to_char(fecha,'day'),' ')) = diaSemana and clientes.nombre = 'Pedro Juan';
    dbms_output.put_line('Total Pedro Juan: ' || totalPedroJuan);
end;
/

declare
    total int;
begin
    comandasTotal('lunes',total);
    dbms_output.put_line(total);
end;
/

