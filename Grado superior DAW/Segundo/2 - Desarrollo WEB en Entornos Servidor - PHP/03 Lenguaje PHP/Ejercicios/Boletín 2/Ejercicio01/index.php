<?php

$contadorIntentos = isset($_POST['intentos']) ? intval($_POST['intentos']) : 0;
$numeroAleatorio = isset($_POST['numero-aleatorio']) ? (int)$_POST['numero-aleatorio'] : rand(1, 50);

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['numero'])) {
    $numeroIngresado = (int)$_POST['numero'];
    $contadorIntentos++;

    if ($numeroIngresado === $numeroAleatorio) {
        print 'Has Acertado';
    } else if ($contadorIntentos === 0) {
        print 'Has perdido...';
    } else {
        print 'No has acertado<br/>';
        print 'Número de intentos contador: ' . $contadorIntentos;
    }
}

//print $numeroAleatorio;

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EJERCICIO01 - Boletín 2</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <h1>¡Adivina el número!</h1>
    <p>Reglas:</p>
    <ol>
        <li>El número a adivinar está entre el 1 y el 50.</li>
        <li>Tienes un máximo de 6 intentos.</li>
    </ol>
    <form action="index.php" method="post">
        <label for="numero">Creo que es el número...</label>
        <input type="text" name="numero" id="numero" maxlength="2" pattern="^(?:[1-9]|[1-4][0-9]|50)$" required>
        <input type="hidden" name="numero-aleatorio" value="<?= htmlspecialchars($numeroAleatorio) ?>">
        <input type="hidden" name="intentos" value="<?= htmlspecialchars($contadorIntentos) ?>">
        <input type="submit" value="Intentar">
    </form>
    <form action="index.php" method="post">
        <input type="submit" value="Reiniciar Juego">
    </form>

</body>

</html>