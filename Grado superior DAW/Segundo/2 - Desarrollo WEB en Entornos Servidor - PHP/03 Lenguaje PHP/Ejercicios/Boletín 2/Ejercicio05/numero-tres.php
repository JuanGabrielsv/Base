<?php
session_start();
$_SESSION['numero1'] += $_POST['numero'];

?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>numero-dos - Ejercicio05</title>
</head>

<body>
    
    <form action="#" method="post">
        <input type="text" name="numero" id="numero">
        <button type="submit">Enviar</button>
    </form>
    <p>
        <?php
        var_dump($_SESSION['numero1']);
        ?>
    
    </p>

</body>

</html>