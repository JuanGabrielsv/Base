<?php
session_start();

// Conectar a la base de datos
$conn = new mysqli("localhost:3306", "root", "", "app_cerveceria");

if ($conn->connect_error) {
	die("Error de conexión: " . $conn->connect_error);
}

// Verificar si se ha pasado un ID
if (isset($_GET['id'])) {
	$id_producto = $_GET['id'];

	// Consulta para obtener los datos del producto
	$sql = "SELECT * FROM productos WHERE ID_PRODUCTO = ?";
	$stmt = $conn->prepare($sql);
	$stmt->bind_param("i", $id_producto);
	$stmt->execute();
	$result = $stmt->get_result();

	if ($result->num_rows > 0) {
		$row = $result->fetch_assoc();
	} else {
		echo "Producto no encontrado.";
		exit;
	}
} else {
	echo "ID de producto no proporcionado.";
	exit;
}

// Manejar el envío del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
	// Recibir y sanitizar los datos del formulario
	$denominacion = $_POST['denominacion'];
	$marca = $_POST['marca'];
	$tipo = $_POST['tipo'];
	$formato = $_POST['formato'];
	$tamano = $_POST['tamano'];
	$alergenos = isset($_POST['alergeno']) ? implode(", ", $_POST['alergeno']) : '';
	$fechaConsumo = $_POST['fechaConsumo'];
	$precio = $_POST['precio'];
	$observaciones = $_POST['observaciones'];

	// Validar campos si es necesario
	$errores = [];
	if (empty($denominacion)) {
		$errores['denominacion'] = "La denominación es obligatoria.";
	}
	if (empty($marca)) {
		$errores['marca'] = "La marca es obligatoria.";
	}
	if (empty($tipo)) {
		$errores['tipo'] = "El tipo de cerveza es obligatorio.";
	}
	if (empty($formato)) {
		$errores['formato'] = "El formato es obligatorio.";
	}
	if (empty($tamano)) {
		$errores['tamano'] = "El tamaño es obligatorio.";
	}
	if (empty($fechaConsumo)) {
		$errores['fechaConsumo'] = "La fecha de consumo es obligatoria.";
	}
	if (empty($precio)) {
		$errores['precio'] = "El precio es obligatorio.";
	}

	// Si no hay errores, actualizar los datos
	if (empty($errores)) {
		// Consulta para actualizar los datos del producto
		$sql_update = "UPDATE productos SET Denominacion_Cerveza = ?, Marca = ?, Tipo = ?, Formato = ?, Tamano = ?, Alergenos = ?, Fecha_Consumo = ?, Precio = ?, Observaciones = ? WHERE ID_PRODUCTO = ?";
		$stmt_update = $conn->prepare($sql_update);
		$stmt_update->bind_param("sssssssssi", $denominacion, $marca, $tipo, $formato, $tamano, $alergenos, $fechaConsumo, $precio, $observaciones, $id_producto);

		if ($stmt_update->execute()) {
			echo "Producto actualizado con éxito.";
			header("Location: articulos.php"); // Redirigir al listado de productos
			exit();
		} else {
			echo "Error al actualizar el producto: " . $conn->error;
		}
	}
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../css/formulario.css">
	<title>Actualizar Cerveza</title>
</head>

<body>
	<header>

		<div>
			<img src="../img/logotipo.svg" alt="logotipo de una jarra de cerveza">
			<h1>APP - Aquí no vendemos cruzcampo.</h1>
		</div>
		<div>
			<p>Perfil: <?php echo isset($_SESSION['perfil']) ? $_SESSION['perfil'] : 'Perfil no disponible'; ?></p>
			<button onclick="window.location.href='logout.php'">Salir</button>
		</div>
	</header>
	<main>
		<section class="section1">
			<h1>Actualizar Cerveza</h1>
			<form action="actualizar.php?id=<?php echo $id_producto; ?>" method="POST" class="section-form" enctype="multipart/form-data">
				<div class="form-fila">
					<label for="denominacion">Denominación cerveza:</label>
					<input type="tel" name="denominacion" id="denominacion" class="denominacion" value="<?php echo $row['Denominacion_Cerveza']; ?>" required>
					<?php if (!empty($errores['denominacion'])): ?>
						<p class="error"><?php echo $errores['denominacion']; ?></p>
					<?php endif; ?>
				</div>

				<div class="form-fila">
					<label for="marca">Marca:</label>
					<select name="marca" id="marca" class="form-select">
						<option value="alhambra" <?php echo $row['Marca'] == 'alhambra' ? 'selected' : ''; ?>>Alhambra</option>
						<option value="heineken" <?php echo $row['Marca'] == 'heineken' ? 'selected' : ''; ?>>Heineken</option>
						<option value="mahou" <?php echo $row['Marca'] == 'mahou' ? 'selected' : ''; ?>>Mahou</option>
						<option value="dam" <?php echo $row['Marca'] == 'dam' ? 'selected' : ''; ?>>Dam</option>
						<option value="estrella Galicia" <?php echo $row['Marca'] == 'estrella Galicia' ? 'selected' : ''; ?>>Estrella Galicia</option>
						<option value="cruzcampo" <?php echo $row['Marca'] == 'cruzcampo' ? 'selected' : ''; ?>>Cruzcampo</option>
						<option value="artesana" <?php echo $row['Marca'] == 'artesana' ? 'selected' : ''; ?>>Artesana</option>
					</select>
				</div>

				<fieldset class="form-fila">
					<div>
						<legend>Tipo de cerveza:</legend>
						<?php if (!empty($errores['tipo'])): ?>
							<p class="error"><?php echo $errores['tipo']; ?></p>
						<?php endif; ?>
					</div>
					<div>
						<input type="radio" name="tipo" id="lager" value="lager" <?php echo $row['Tipo'] == 'lager' ? 'checked' : ''; ?>>
						<label for="lager">Lager</label>
						<input type="radio" name="tipo" id="paleAle" value="Pale Ale" <?php echo $row['Tipo'] == 'Pale Ale' ? 'checked' : ''; ?>>
						<label for="paleAle">Pale Ale</label>
						<input type="radio" name="tipo" id="cervezaNegra" value="Cerveza Negra" <?php echo $row['Tipo'] == 'Cerveza Negra' ? 'checked' : ''; ?>>
						<label for="cervezaNegra">Cerveza Negra</label>
						<input type="radio" name="tipo" id="abadia" value="Abadia" <?php echo $row['Tipo'] == 'Abadia' ? 'checked' : ''; ?>>
						<label for="abadia">Abadía</label>
						<input type="radio" name="tipo" id="rubia" value="Rubia" <?php echo $row['Tipo'] == 'Rubia' ? 'checked' : ''; ?>>
						<label for="rubia">Rubia</label>
					</div>
				</fieldset>

				<div class="form-fila">
					<label for="formato">Formato:</label>
					<select name="formato" id="formato" class="form-select">
						<option value="lata" <?php echo $row['Formato'] == 'lata' ? 'selected' : ''; ?>>Lata</option>
						<option value="botella" <?php echo $row['Formato'] == 'botella' ? 'selected' : ''; ?>>Botella</option>
						<option value="pack" <?php echo $row['Formato'] == 'pack' ? 'selected' : ''; ?>>Pack</option>
					</select>
				</div>

				<div class="form-fila">
					<label for="tamano">Tamaño:</label>
					<select name="tamano" id="tamano" class="form-select">
						<option value="botellin" <?php echo $row['Tamano'] == 'botellin' ? 'selected' : ''; ?>>Botellín</option>
						<option value="tercio" <?php echo $row['Tamano'] == 'tercio' ? 'selected' : ''; ?>>Tercio</option>
						<option value="media" <?php echo $row['Tamano'] == 'media' ? 'selected' : ''; ?>>Media</option>
						<option value="litrona" <?php echo $row['Tamano'] == 'litrona' ? 'selected' : ''; ?>>Litrona</option>
						<option value="pack" <?php echo $row['Tamano'] == 'pack' ? 'selected' : ''; ?>>Pack</option>
					</select>
				</div>

				<fieldset class="form-fila">
					<div>
						<legend>Alérgenos:</legend>
					</div>
					<div>

						<input type="checkbox" name="alergeno[]" value="gluten" <?php echo strpos($row['Alergenos'], 'gluten') !== false ? 'checked' : ''; ?>> Gluten
						<input type="checkbox" name="alergeno[]" value="huevo" <?php echo strpos($row['Alergenos'], 'huevo') !== false ? 'checked' : ''; ?>> Huevo
						<input type="checkbox" name="alergeno[]" value="cacahuete" <?php echo strpos($row['Alergenos'], 'cacahuete') !== false ? 'checked' : ''; ?>> Cacahuete
						<input type="checkbox" name="alergeno[]" value="soja" <?php echo strpos($row['Alergenos'], 'soja') !== false ? 'checked' : ''; ?>> Soja
						<input type="checkbox" name="alergeno[]" value="lacteo" <?php echo strpos($row['Alergenos'], 'lacteo') !== false ? 'checked' : ''; ?>> Lácteo
						<input type="checkbox" name="alergeno[]" value="sulfitos" <?php echo strpos($row['Alergenos'], 'sulfitos') !== false ? 'checked' : ''; ?>> Sulfitos
						<input type="checkbox" name="alergeno[]" value="sinalergenos" <?php echo strpos($row['Alergenos'], 'sinalergenos') !== false ? 'checked' : ''; ?>> Sin alérgenos
					</div>
				</fieldset>

				<div class="form-fila">
					<label for="fechaConsumo">Fecha de consumo:</label>
					<input type="date" name="fechaConsumo" id="fechaConsumo" class="form-select" value="<?php echo $row['Fecha_Consumo']; ?>">
				</div>

				<div class="form-fila">
					<label for="precio">Precio:</label>
					<div>
						<input type="number" name="precio" id="precio" class="form-select" value="<?php echo $row['Precio']; ?>">€
					</div>
				</div>

				<div class="form-fila">
					<label for="observaciones">Observaciones:</label>
					<textarea name="observaciones" id="observaciones" cols="30" rows="5" class="form-textarea"><?php echo $row['Observaciones']; ?></textarea>
				</div>
				<button type="submit" class="botonActualizar">Actualizar Cerveza</button>
				<button class="botonCancelar" onclick="window.location.href='articulos.php'">Cancelar</button>
			</form>
		</section>

	</main>

	<footer>
		<p>Aplicación cervecería "Aquí no vendemos cruzcampo" - jsanches8979 &#174 2025 </p>
	</footer>
</body>

</html>