<!DOCTYPE html>
<!-- 
Ejercicio 1
Imprimir por pantalla usando variables, tu nombre, tu primer apellido, tu segundo apellido, el curso en el que estás y la foto de tu DNI. 
Creado por: Juan Gabriel Sánchez (jsanchez8979).
-->
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio_01</title>
</head>
<body>    
    <?php
        $nombre = "Juan Gabriel";
        $primerApellido = "Sánchez";
        $segundoApellido = "Vivero";
        $curso = "2º DAW";
        $imagenDni = "<img src='images\dni.jpg'>";

        echo "Nombre: ".$nombre;        
        echo "<br>Primer apellido: ".$primerApellido;
        echo "<br>Segundo apellido: ".$segundoApellido;
        echo "<br>Cursando: ".$curso;
        echo "<br>".$imagenDni;
    ?>    
</body>
</html>