<?php

if (!isset($_REQUEST["tipoenvase"])) {
    print "<p>No se ha marcado el tipo de envase</p>";
    $check = false;    
} else {
    $tipoEnvase = $_REQUEST["tipoenvase"];
    $check = true;
}

if (($_REQUEST["marcaproducto"]) == "") {
    print "<p>Falta la marca del producto</p>";
    $check = false;    
} else {
    $marcaProducto = $_REQUEST["marcaproducto"];
    $check = true;
}

if (($_REQUEST["advertencia"]) == "") {
    print "<p>No se ha indicado si el producto lleva o no advertencia por el consumo</p>";
    $check = false;    
} else {
    $marcaProducto = $_REQUEST["advertencia"];
    $check = true;
}


print_r( $_REQUEST);
print "<br>";

while ($check == true) {
    print "<br>se ha entrado";
    break;
}

/*

$tipoCerveza = $_REQUEST["tipocerveza"];
$denominacionAlimento = $_REQUEST["denominacionalimento"];
//$tipoEnvase = $_REQUEST["tipoenvase"];
$cantidadNeta = $_REQUEST["cantidadneta"];
$marcaProducto = $_REQUEST["marcaproducto"];
$advertencia = $_REQUEST["advertencia"];
$fechaConsumo = $_REQUEST["fechaconsumo"];
$alergenos = $_REQUEST["alergenos"];
$observaciones = $_REQUEST["observaciones"];

*/

print "<br>Tipo de cerveza".$tipoCerveza;

?>