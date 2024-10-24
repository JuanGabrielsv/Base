<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aquí no se vende cruzcampo</title>
    <link rel="stylesheet" href="../css/style.css">
</head>


<body>
<header>
    <h1>Inserción de Ceverzas</h1>
</header>
</body>
</html>
<?php

while (
    !isset($_REQUEST["tipoenvase"]) ||
    $_REQUEST["marcaproducto"] == "" ||
    $_REQUEST["advertencia"] == "" ||
    $_REQUEST["fechaconsumo"] == "" ||
    !isset($_REQUEST["alergenos"])
) {
    print "<p>No se ha podido realizar la inserción debido a los siguientes errores</p>";
    print ("<ul>");
    if (!isset($_REQUEST["tipoenvase"])) {
        print "<li>No se ha marcado el tipo de envase</li>";
    }

    if (($_REQUEST["marcaproducto"]) == "") {
        print "<li>Falta la marca del producto</li>";
    }

    if (($_REQUEST["advertencia"]) == "") {
        print "<li>No se ha indicado si el producto lleva o no advertencia por el consumo</li>";
    }

    if (($_REQUEST["fechaconsumo"]) == "") {
        print "<li>No se ha indicado fecha de consumo preferente.</li>";
    }

    if (!isset($_REQUEST["alergenos"])) {
        print "<li>No se ha indicado trazas de alergenos.</li>";
    }
    print "</ul>";
    print "<a href=" . "../index.html" . ">[Volver]</a>";
    break;
}

while (
    isset($_REQUEST["tipoenvase"]) &&
    $_REQUEST["marcaproducto"] !== "" &&
    $_REQUEST["advertencia"] !== "" &&
    $_REQUEST["fechaconsumo"] !== "" &&
    isset($_REQUEST["alergenos"])
) {
    $tipoCerveza = $_REQUEST["tipocerveza"];
    $denominacionAlimento = $_REQUEST["denominacionalimento"];
    $tipoEnvase = $_REQUEST["tipoenvase"];
    $cantidadNeta = $_REQUEST["cantidadneta"];
    $marcaProducto = $_REQUEST["marcaproducto"];
    $advertencia = $_REQUEST["advertencia"];
    $fechaConsumo = $_REQUEST["fechaconsumo"];
    $alergenos = $_REQUEST["alergenos"];
    $observaciones = $_REQUEST["observaciones"];
    $alergenosString = "";

    for ($i = 0; $i < count($alergenos); $i++) {
        if ($i == 0) {
            $alergenosString .= $alergenos[$i];
        } else {
            $alergenosString .= ", " . $alergenos[$i];
        }
    }

    print "<h2><span class=" . "exito" . ">EXITO</span> - Cerveza registrada correctamente.</h2>";
    print "<p>Tipo de cerveza: <span class=" . "nobold" . ">$tipoCerveza</p>";
    print "<p>Denominación del alimento: <span class=" . "nobold" . ">$denominacionAlimento</p>";
    print "<p>Tipo de envase: <span class=" . "nobold" . ">$tipoEnvase</p>";
    print "<p>Cantidad Neta: <span class=" . "nobold" . ">$cantidadNeta</p>";
    print "<p>Marca del producto: <span class=" . "nobold" . ">$marcaProducto</p>";
    print "<p>Advertencia sobre el abuso: <span class=" . "nobold" . ">$advertencia</p>";
    print "<p>Fecha de consumo: <span class=" . "nobold" . ">$fechaConsumo</p>";
    print "<p>Alergenos: <span class=" . "nobold" . ">$alergenosString</p>";
    print "<p>Observaciones: <span class=" . "nobold" . ">$observaciones</p>";

    print "<br><a href=" . "../index.html" . ">[Volver]</a>";
    break;
}
?>