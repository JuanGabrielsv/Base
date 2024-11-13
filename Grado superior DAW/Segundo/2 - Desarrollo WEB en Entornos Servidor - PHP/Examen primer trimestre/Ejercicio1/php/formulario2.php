<?php
session_start();
$cantidadDeFilas = $_REQUEST['cantidad'];


session_destroy();
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EJERCICIO 1</title>
</head>

<body>
    <form action="php/formulario2.php" method="post">
        <h1>TABLA DE UNA FILA CON CASILLAS DE VERIFICACIÓN (FORMULARIO 2).</h1>
        <p>Marque las casillas de verificación que quiera y contaré cuántas ha marcado.</p>
        <?php
        for ($i=1; $i < $cantidadDeFilas+1; $i++) { 
            print '<input type="checkbox"><label>'.$i. '</label>';
        } ?>  
        <br>  
        <button type="submit">Contar</button>
        <button type="reset">Borrar</button>
        <br>
        <a href="../index.html">Volver al formulario</a>
    </form>
</body>

</html>

