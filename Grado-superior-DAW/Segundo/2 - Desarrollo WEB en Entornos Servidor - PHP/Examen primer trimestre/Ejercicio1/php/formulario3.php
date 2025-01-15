<?php
//INICIAMOS SESIÓN
session_name('ejercicio1');
session_start();

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
        <br>
        <p> has elegido <?php
                        print_r('<b>' . count($_REQUEST) . '</b> de un total de <b>' . $_SESSION['cantidadDeFilas'] . ': ');
                        foreach ($_REQUEST as $key => $value) {
                            if ($value === 'on') {
                                echo $key . ' ';
                            }
                        }
                        '</b>';
                        ?>
        </p>
        <br>
        <a href="formulario2.php">Volver a la tabla</a>
        <br>
        <a href="../index.html">Volver al formulario inicial</a>
    </form>
</body>

</html>