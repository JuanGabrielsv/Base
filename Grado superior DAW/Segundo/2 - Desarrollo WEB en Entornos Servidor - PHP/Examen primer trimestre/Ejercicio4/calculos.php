<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EJERCICIO 4 - PHP ANTONIO</title>
</head>

<body>
    <h1>Tu imc</h1>
    <?php

    /* INVESTIGANDO POR INTERNET VOY A USAR ESTA FUNCIÓN DE RECOGIDA DE DATOS */

    function datos($key, $type = "")
    {
        if (!is_string($key) && !is_int($key) || $key == "") {
            trigger_error("Error1", E_USER_ERROR);
        } elseif ($type !== "" && $type !== []) {
            trigger_error("Error2", E_USER_ERROR);
        }

        $tmp = $type;
        if (isset($_REQUEST[$key])) {

            if (!is_array($_REQUEST[$key]) && !is_array($type)) {
                $tmp = trim(htmlspecialchars($_REQUEST[$key]));
            } elseif (is_array($_REQUEST[$key]) && is_array($type)) {
                $tmp = $_REQUEST[$key];

                array_walk_recursive($tmp, function (&$value) {
                    $value = trim(htmlspecialchars($value));
                });
            }
        }
        return $tmp;
    }

    $peso   = datos("peso");
    $altura = datos("altura");

    /* APLICAMOS LA FORMULA DE IMC */
    $imc = round($peso / ($altura / 100) ** 2);
    print "  <p>Con un peso de <strong>$peso kg</strong> y una altura de <strong>"
        . "$altura cm</strong>, su índice de masa corporal es <strong>$imc</strong>.</p>\n";
    ?>
    <p><a href="index.html">Página principal</a></p>


</body>

</html>

<!-- He tenido problemas con las validaciones por eso no las he puesto Antonio con la falta de tiempo lo he tenido que dejar así podía verlas copiado pero prefiero ahora cuando pase los exámenes y tenga mas tiempo revisarlas -->