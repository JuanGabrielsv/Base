<!DOCTYPE html>
<!-- 
EJERCICIO 5 
    Dado el numero 8, calcular y presentar en pantalla: 
        Suma 2 
        Resta 2 
        Multiplica por 5 el ultimo valor 
        Divide por 3 el último valor 
        Incrementa en 1 el resultado 
        Decrementa el resultado en 1 
Creado por: Juan Gabriel Sánchez (jsanchez8979).
-->
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio_05</title>
</head>
<body>    
    <?php
    $numeroOcho = 8;
    $sumaDos = $numeroOcho + 2;
    $restaDos = $numeroOcho - 2;
    $multiplicaPorCinco = $restaDos * 5;
    $dividePorTres = $multiplicaPorCinco / 3;     

    echo "Número: ".$numeroOcho;
    echo "<br>Súmale 2: ".$sumaDos;
    echo "<br>Réstale 2: ".$restaDos;
    echo "<br>El resultado anterior multiplícalo por 5: ".$multiplicaPorCinco;
    echo "<br>El resultado anterior divídelo por 3: ".$dividePorTres;

    $incrementado = ++$dividePorTres;
    $decrementado = --$dividePorTres;

    echo "<br>El resultado anterior increméntale en 1: ".$incrementado;
    echo "<br>El resultado anterior decreméntalo en 1: ".$decrementado;
    ?>    
</body>
</html>
