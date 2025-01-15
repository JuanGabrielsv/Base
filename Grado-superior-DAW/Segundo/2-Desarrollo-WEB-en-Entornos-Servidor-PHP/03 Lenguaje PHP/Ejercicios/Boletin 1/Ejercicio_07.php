<!DOCTYPE html>
<!-- 
Ejercicio 7:

Dadas las siguientes variables:
    $valor = "qwert" 
    $valor = 12345678901234567890 
    $valor = true; 
    $valor = 1234; 
    $valor = NULL; 
Pinta en pantalla el tipo de variable
Creado por: Juan Gabriel Sánchez (jsanchez8979).
-->
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio_07</title>
</head>
<body>    
    <?php
       $valorUno = "qwert";
       $valorDos = 12345678901234567890;
       $valorTres = true; 
       $valorCuatro = 1234; 
       $valorCinco = NULL;

       echo getType($valorUno);
       echo "<br>".getType($valorDos);
       echo "<br>".getType($valorTres);
       echo "<br>".getType($valorCuatro);
       echo "<br>".getType($valorCinco);
    ?>    
</body>
</html>
