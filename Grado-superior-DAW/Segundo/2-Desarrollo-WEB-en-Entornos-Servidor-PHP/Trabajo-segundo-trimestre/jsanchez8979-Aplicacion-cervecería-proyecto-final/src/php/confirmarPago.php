<?php
session_start();

// Borrar las sesiones para cerrar la sesión
session_unset();
session_destroy();
?>

<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Gracias por tu compra</title>
	<link rel="stylesheet" href="../css/plantilla_general.css">
</head>

<body>
	<header>
		<div>
			<img src="../img/logotipo.svg" alt="logotipo de una jarra de cerveza">
			<h1>Gracias por tu compra</h1>
		</div>
	</header>

	<main>
		<h2>¡Tu compra ha sido procesada con éxito!</h2>
		<p>Gracias por confiar en nosotros. ¡Esperamos que disfrutes de tu compra!</p>

		<form action="../../index.php" method="get">
			<button type="submit">Salir</button>
		</form>
	</main>

	<footer>
		<p>Aplicación cervecería "Aquí no vendemos cruzcampo" - jsanches8979 &#174 2025</p>
	</footer>
</body>

</html>