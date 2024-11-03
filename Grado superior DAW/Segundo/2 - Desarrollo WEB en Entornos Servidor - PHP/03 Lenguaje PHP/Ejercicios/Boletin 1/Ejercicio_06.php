<!DOCTYPE html>
<!-- 
EJERCICIO 06:  

    Dadas las siguientes variables.  
        $cadena = "Harry"; 
        $entero = 123456789012345678; 
        $variable = NULL; 
    Pinta en pantalla el tipo de variable 

Creado por: Juan Gabriel Sánchez (jsanchez8979).
-->
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio_06</title>
</head>
<body>    
    <?php
    $cadena = "Harry"; 
    $entero = 123456789012345678; 
    $variable = NULL;

    echo gettype($cadena);
    echo "<br>".gettype($entero);
    echo "<br>".gettype($variable);    
    ?>    
</body>
</html>
