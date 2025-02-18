<?php
session_start(); // Iniciar sesión para acceder a los datos

// Verificar si los datos están en la sesión
if (isset($_SESSION['datos-formulario'])) {
	$datosFormulario = $_SESSION['datos-formulario']; // Obtener los datos de la sesión	
	$alergenos = implode(' ', $datosFormulario['alergeno']);
	// Conectar a la base de datos
	$conn = new mysqli("localhost:3306", "root", "", "app_cerveceria");

	// Verificar la conexión
	if ($conn->connect_error) {
		die("Error de conexión: " . $conn->connect_error);
	}

	// Recuperar los datos del formulario
	$denominacion = $datosFormulario['denominacion'];
	$marca = $datosFormulario['marca'];
	$tipo = $datosFormulario['tipo'];
	$formato = $datosFormulario['formato'];
	$tamano = $datosFormulario['tamano'];
	$alergenos = $alergenos;
	$fechaConsumo = $datosFormulario['fechaConsumo'];
	$fotoProducto = $datosFormulario['fotoProducto'];
	$precio = $datosFormulario['precio'];
	$observaciones = $datosFormulario['observaciones'];

	// Preparar la consulta SQL para insertar los datos
	$sql = "INSERT INTO productos (Denominacion_Cerveza, Marca, Tipo, Formato, Tamano, Alergenos, Fecha_Consumo, Foto, Precio, Observaciones)
				 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	// Preparar la sentencia
	$stmt = $conn->prepare($sql);

	// Vincular los parámetros
	$stmt->bind_param("ssssssssds", $denominacion, $marca, $tipo, $formato, $tamano, $alergenos, $fechaConsumo, $fotoProducto, $precio, $observaciones);

	// Ejecutar la consulta
	$stmt->execute();

	// Cerrar la sentencia y la conexión
	$stmt->close();
	$conn->close();

	// Limpiar los datos de la sesión para evitar que se repitan
	unset($_SESSION['datos-formulario']);
} else {
	echo "No se han enviado datos o ha ocurrido un error.";
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../css/registro_completado.css">
	<title>Producto Introducido</title>
</head>

<body>
	<header>
		<div>
			<img src="../img/logotipo.svg" alt="logotipo de una jarra de cerveza">
			<h1>APP - Aquí no vendemos cruzcampo.</h1>
		</div>
	</header>
	<main>
		<section>
			<div>
				<h2>INSERCIÓN DE CERVEZAS</h2>
				<p>Estos son los datos introducidos</p>
			</div>
			<ul>
				<li><span>Denominación cerveza:</span> <?php echo $datosFormulario['denominacion'] ?></li>
				<li><span>Marca:</span> <?php echo $datosFormulario['marca'] ?></li>
				<li><span>Tipo:</span> <?php echo $datosFormulario['tipo'] ?></li>
				<li><span>Formato:</span> <?php echo $datosFormulario['formato'] ?></li>
				<li><span>Tamaño:</span> <?php echo $datosFormulario['tamano'] ?></li>
				<li><span>Alérgenos:</span> <?php echo $alergenos ?></li>
				<li><span>Fecha de consumo:</span> <?php echo $datosFormulario['fechaConsumo'] ?></li>
				<li><span>Foto:</span> <?php echo $datosFormulario['fotoProducto'] ?></li>
				<li><span>Precio:</span> <?php echo $datosFormulario['precio'] ?></li>
				<li><span>Observaciones:</span> <?php echo $datosFormulario['observaciones'] ?></li>
			</ul>
		</section>
		<div class="form-fila">
			<a href="formulario.php">
				<button type="button">Insertar otra cerveza</button>
			</a>
		</div>
		<div class="form-fila">
			<button class="form-fila" onclick="window.location.href='articulos.php'">Administrar artículos</button>
		</div>

	</main>
	<footer>
		<p>Aplicación cervecería "Aquí no vendemos cruzcampo" - jsanchez8979 &#174 2025 </p>
	</footer>


</body>

</html>