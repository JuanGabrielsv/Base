<!DOCTYPE html>
<!-- 
Ejercicio 4 
Calcular la suma, resta, multiplicación, división y módulo de los siguientes números, 10 y 7 
Creado por: Juan Gabriel Sánchez (jsanchez8979).
-->
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio_04</title>
</head>
<body>    
    <?php
        $numDiez = 10;
        $numSiete = 7;
        $suma = $numDiez + $numSiete;
        $resta = $numDiez - $numSiete;
        $multiplicacion = $numDiez * $numSiete;
        $division = $numDiez / $numSiete;
        $modulo = $numDiez % $numSiete;

        echo "Suma: ".$suma;
        echo "<br>Resta: ".$resta;
        echo "<br>Multiplicación: ".$multiplicacion;
        echo "<br>División: ".$division;
        echo "<br>Módulo: ".$modulo;
    ?>    
</body>
</html>
