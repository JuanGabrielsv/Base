<?php
session_start();
array_push($_SESSION['arrayNumeros'], $_POST['numero']);

?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>numero-tres - Ejercicio05</title>
</head>

<body>
    
    <form action="numero-cuatro.php" method="post">
        <input type="text" name="numero" id="numero">
        <button type="submit">Enviar</button>
    </form>
    <p>
          
    </p>

</body>

</html>