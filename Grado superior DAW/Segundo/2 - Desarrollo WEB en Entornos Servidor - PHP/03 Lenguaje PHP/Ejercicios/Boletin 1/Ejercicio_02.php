<!DOCTYPE html>
<!-- 
Ejercicio 2  
Aplicación para calcular el área del circulo y la circunferencia de un círculo de radio 4. 
Creado por: Juan Gabriel Sánchez (jsanchez8979).
-->
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio_02</title>
</head>
<body>    
    <?php
        $radio = 4;
        $pi = 3.1416;
        $areaCirculo = $pi * ($radio**2);
        $circunferenciaCirculo = 2 * $pi * $radio;

        echo $areaCirculo;
        echo "<br>".$circunferenciaCirculo;
    ?>    
</body>
</html>