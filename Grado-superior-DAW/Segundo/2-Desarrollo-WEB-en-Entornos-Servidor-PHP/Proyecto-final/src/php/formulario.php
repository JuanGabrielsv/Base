<?php
session_start();
$errores = [];
if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (isset($_POST['botonInsertarCerveza'])) {
		unset($_POST['botonInsertarCerveza']);
		if (empty($_POST['denominacion'])) {
			$errores['denominacion'] = "¡Se requiere el nombre de la Cerveza!";
		}
		if (empty($_POST['tipo'])) {
			$errores['tipo'] = "¡Has de elegir un tipo de cerveza!";
		}
		if (!isset($_POST['alergeno']) || !is_array($_POST['alergeno'])) {
			$errores['alergeno'] = "¡Has de elegir alérgeno!";
		}
		if (empty($_POST['fechaConsumo'])) {
			$errores['fechaConsumo'] = "¡Ha de tener una fecha de consumo máxima!";
		}
		if (empty($_POST['precio']) || !is_numeric($_POST['precio']) || $_POST['precio'] <= 0) {
			$errores['precio'] = "¡El precio debe ser un valor numérico!";
		}

		if (isset($_FILES['fotoProducto']) && $_FILES['fotoProducto']['error'] == 0) {
			$archivoImagen = $_FILES['fotoProducto'];
			$nombreArchivo = $archivoImagen['name'];
			$archivoTemporal = $archivoImagen['tmp_name'];

			// Definir la carpeta de destino
			$directorioDestino = '../img/image-producto/';

			// Intentar mover el archivo a la carpeta de destino
			if (!move_uploaded_file($archivoTemporal, $directorioDestino . $nombreArchivo)) {
				$errores['fotoProducto'] = "Error al subir la imagen.";
				$_SESSION['nombre_imagen'] = 'sin_imagen';
				$_POST['fotoProducto'] = 'sin_imagen';
			} else {
				// Guardar el nombre de la imagen en la sesión y en $_POST
				$_SESSION['nombre_imagen'] = $nombreArchivo;
				$_POST['fotoProducto'] = $nombreArchivo;
			}
		} else {
			// Si no se ha subido ninguna imagen, establecer el valor por defecto
			$_SESSION['nombre_imagen'] = 'sin_imagen';
			$_POST['fotoProducto'] = 'sin_imagen';
		}

		if (empty($errores)) {
			$_SESSION['datos-formulario'] = $_POST;
			header("Location: registro-completado.php");
			exit();
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
	<title>Formulario</title>
</head>

<body>
	<header>
		<div>
			<img src="../img/logotipo.svg" alt="logotipo de una jarra de cerveza">
			<h1>APP - Aquí no vendemos cruzcampo.</h1>
		</div>
		<button onclick="window.location.href='buscador.php'">Buscar Producto</button>
		<div>
			<p>Perfil: <?php echo isset($_SESSION['perfil']) ? $_SESSION['perfil'] : 'Perfil no disponible'; ?></p>
			<button onclick="window.location.href='logout.php'">Salir</button>
		</div>
	</header>
	<main>
		<section class="section1">
			<div class="titulos-form-insertar-cerveza">
				<h2>Inserción de Cervezas</h2>
				<p>Introduzca los datos de la Cerveza</p>
			</div>
			<form action="formulario.php" method="post" class="section-form" enctype="multipart/form-data">
				<div class="form-fila">
					<label for="denominacion">Denominación cerveza:</label>
					<input type="tel" name="denominacion" id="denominacion" class="denominacion">
					<?php if (!empty($errores['denominacion'])): ?>
						<p class="error"><?php echo $errores['denominacion']; ?></p>
					<?php endif; ?>
				</div>
				<div class="form-fila">
					<label for="marca">Marca:</label>
					<select name="marca" id="marca" class="form-select">
						<option value="alhambra" selected>Alhambra</option>
						<option value="heineken">Heineken</option>
						<option value="mahou">Mahou</option>
						<option value="dam">Dam</option>
						<option value="estrella Galicia">Estrella Galicia</option>
						<option value="cruzcampo">Cruzcampo</option>
						<option value="artesana">Artesana</option>
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
						<input type="radio" name="tipo" id="lager" value="lager">
						<label for="lager">Lager</label>
						<input type="radio" name="tipo" id="paleAle" value="Pale Ale">
						<label for="paleAle">Pale Ale</label>
						<input type="radio" name="tipo" id="cervezaNegra" value="Cerveza Negra">
						<label for="cervezaNegra">Cerveza Negra</label>
						<input type="radio" name="tipo" id="abadia" value="Abadia">
						<label for="abadia">Abadía</label>
						<input type="radio" name="tipo" id="rubia" value="Rubia">
						<label for="rubia">Rubia</label>
					</div>
				</fieldset>
				<div class="form-fila">
					<label for="formato">Formato:</label>
					<select name="formato" id="formato" class="form-select">
						<option value="lata" selected>Lata</option>
						<option value="botella">Botella</option>
						<option value="pack">Pack</option>
					</select>
				</div>
				<div class="form-fila">
					<label for="tamano">Tamaño:</label>
					<select name="tamano" id="tamano" class="form-select">
						<option value="botellin">Botellín</option>
						<option value="tercio">Tercio</option>
						<option value="media">Media</option>
						<option value="litrona" selected>Litrona</option>
						<option value="pack">Pack</option>
					</select>
				</div>
				<fieldset class="form-fila">
					<div>
						<legend>Alérgenos:</legend>
					</div>
					<div>
						<input type="checkbox" name="alergeno[]" id="gluten" value="gluten">
						<label for="gluten">Gluten</label>
						<input type="checkbox" name="alergeno[]" id="huevo" value="huevo">
						<label for="huevo">Huevo</label>
						<input type="checkbox" name="alergeno[]" id="cacahuete" value="cacahuete">
						<label for="cacahuete">Cacahuete</label>
						<input type="checkbox" name="alergeno[]" id="soja" value="soja">
						<label for="soja">Soja</label>
						<input type="checkbox" name="alergeno[]" id="lacteo" value="lacteo">
						<label for="lacteo">Lácteo</label>
						<input type="checkbox" name="alergeno[]" id="sulfitos" value="sulfitos">
						<label for="sulfitos">Sulfitos</label>
						<input type="checkbox" name="alergeno[]" id="sinalergenos" value="sinalergenos">
						<label for="sinalergenos">Sin alérgenos</label>
					</div>
					<?php if (!empty($errores['alergeno'])): ?>
						<p class="error"><?php echo $errores['alergeno']; ?></p>
					<?php endif; ?>
				</fieldset>
				<div class="form-fila">
					<label for="fechaConsumo">Fecha de consumo:</label>

					<input type="date" name="fechaConsumo" id="fechaConsumo" class="form-select" value="<?php echo isset($_POST['fechaConsumo']) ? $_POST['fechaConsumo'] : ''; ?>">
					<?php if (!empty($errores['fechaConsumo'])): ?>
						<p class="error"><?php echo $errores['fechaConsumo']; ?></p>
					<?php endif; ?>
				</div>
				<div class="form-fila">
					<label for="fotoProducto">Foto:</label>
					<input type="file" name="fotoProducto" id="fotoProducto">
				</div>
				<div class="form-fila">
					<label for="precio">Precio:</label>
					<div class="form-precio">
						<input type="number" name="precio" id="precio" class="form-select" value="<?php echo isset($_POST['precio']) ? $_POST['precio'] : ''; ?>">€
					</div>
					<?php if (!empty($errores['precio'])): ?>
						<p class="error"><?php echo $errores['precio']; ?></p>
					<?php endif; ?>
				</div>
				<div class="form-fila">
					<label for="observaciones">Observaciones:</label>
					<textarea name="observaciones" id="observaciones" cols="30" rows="5" class="form-textarea"></textarea>
				</div>
				<button name="botonInsertarCerveza" id="botonInsertarCerveza" type="submit">Insertar Cerveza</button>
			</form>
			<button onclick="window.location.href='articulos.php'">Administrar artículos</button>
		</section>
	</main>
	<footer>
		<p>Aplicación cervecería "Aquí no vendemos cruzcampo" - jsanchez8979 &#174 2025 </p>
	</footer>
</body>

</html>