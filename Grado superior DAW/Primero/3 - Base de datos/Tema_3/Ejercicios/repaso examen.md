# Repaso examen tema 3 BBDD 1º DAW

## Problema tipo 3

**IMPORTANTE**: Realiza todos tus cambios utilizando los comandos ALTER TABLE... no lo hagas directamente sobre un nuevo CREATE TABLE que modifique las restricciones, nombres de campos o tipos de datos. Sí se permite borrar y crear en ALTER TABLE, en lugar de usar MODIFY.

1. Crea una tabla que se llame productos con los siguientes campos:
- id int
- nombre varchar2 tamaño 100
- tipo varchar2 tamaño 50

2. Crea una tabla que se llame clientes con los siguientes campos:
- codigo int
- nombre varchar2 tamaño 50
- fecha_nacimiento tipo date

3. Crea una tabla que se llame pedidos con los siguientes campos:
- id_producto int
- id_cliente int
- fecha_compra date

4. Tienes que hacer PK el campo id de la tabla productos, el campo codigo en la tabla clientes y la suma de id_producto e id_cliente en la tabla pedidos.

5. Haz FK del campo id_producto de la tabla pedidos respecto del campo id de la tabla productos. El nombre de esta FK tiene que ser fk_pedidos_productos.

6. Haz FK del campo id_cliente de la tabla pedidos respecto del campo codigo de la tabla clientes. El nombre de esta FK tiene que ser fk_pedidos_clientes.

7. Hay que cambiar el nombre de la tabla productos por products pero se quiere hacer siguiendo estos pasos:
- Borrar la FK de otras tablas que apunten al campo PK id de productos.
- Cambiar el nombre de la tabla.
- Volver a crear la FK correspondiente con el mismo nombre que tenía la restricción, pero ahora haciendo referencia a products.

8. Cambia el nombre de la restricción fk_pedidos_clientes por fk_ped_cli.

9. Añade un nuevo campo a la tabla clientes que sea:
- provincia varchar tamaño 50.

10. Cambia los siguientes datos del campo creado para la tabla clientes:
- Ahora se llamará id_provincia en lugar de provincia.
- El tipo de dato ahora será id.

11. Crea una tabla provincias que sea:
- id int.
- nombre varchar2 tamaño 50.

12. Haz que el campo id de la tabla provincias sea primary key con el siguiente nombre de la restricción: pk_provincias.

13. Haz que el campo id_provincia de la tabla clientes ahora sea FK, sin ponerle nombre a la restricción, y que se corresponda con la PK de la tabla provincias (campo id).

14. Añade una restricción del tipo check en el campo tipo de la tabla products que permita que su valor solo pueda ser uno de los siguientes:
- NUEVO
- SEGUNDAMANO
- RESTAURADO
- DETERIORADO

15. Añade un nuevo campo a la tabla pedidos que:
- Se llamará IMPORTE y será un number de 6 cifras, de las cuáles 2 serán decimales.
- Este campo importe debe tener una restricción que impida que importe pueda ser negativo, es decir, que debe comprobarse que vale mayor o igual a cero.

16. Crea un nuevo campo en clientes que:
- Se llamará referencia_socio y será char tamaño 5.
- Debe tener una restricción que oblique a que los valores del campo empiecen por la letra CO, luego siga un - y después haya dos número que vayan entre el 0 y el 9. Ej.: CO-01, CO-24, CO-97, etc.
