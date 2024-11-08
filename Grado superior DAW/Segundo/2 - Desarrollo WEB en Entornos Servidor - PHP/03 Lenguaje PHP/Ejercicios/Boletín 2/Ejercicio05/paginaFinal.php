<?php
session_start();
array_push($_SESSION['arrayNumeros'], $_POST['numero']);
$arrayNumeros = $_SESSION['arrayNumeros'];
sort($arrayNumeros);

print 'menor: ' . $arrayNumeros[0] . '<br>';
print 'mayor: ' . $arrayNumeros[5] . '<br>';

print 'contenido del arrayNumeros recogido: ';
foreach ($arrayNumeros as $numero) {
    print $numero . ' ';
}

foreach ($arrayNumeros as $numero) {
    if ($numero <= 1) {
        continue;
    }

    $check = true;

    for ($i = 2; $i <= sqrt($numero); $i++) {
        if ($numero % $i == 0) {
            $check = false;
            break;
        }
    }

    if ($check == true) {
        $numerosPrimos[] = $numero;
    }
}

print '<br>Números primos: ';
foreach ($numerosPrimos as $primos) {
    print $primos . ' ';
}

session_destroy();
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina Final - Ejercicio05</title>
</head>

<body>
    <p>
    </p>
</body>

</html>