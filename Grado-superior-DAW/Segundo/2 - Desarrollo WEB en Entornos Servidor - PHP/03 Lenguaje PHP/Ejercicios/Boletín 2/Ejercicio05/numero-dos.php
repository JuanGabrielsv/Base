<?php
session_start();
$_SESSION['arrayNumeros'] = [];
array_push($_SESSION['arrayNumeros'], $_POST['numero']);


//$_SESSION['numero1'] = $_POST['numero'];

?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>numero-dos - Ejercicio05</title>
</head>

<body>   
    <form action="numero-tres.php" method="post">
        <input type="text" name="numero" id="numero">
        <button type="submit">Enviar</button>
    </form>
</body>

</html>