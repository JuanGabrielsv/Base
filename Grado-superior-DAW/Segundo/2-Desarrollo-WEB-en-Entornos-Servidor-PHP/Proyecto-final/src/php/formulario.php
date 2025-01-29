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
	</header>
	<main>
		<h2>Inserción de Cervezas</h2>
		<p>Introduzca los datos de la Cerveza:</p>
		<form action="registro.php" method="get">
			<div>
				<label for="denominacion">Denominación Cerveza:</label>
				<br>
				<label for="marca">Marca:</label>
				<br>
				<label for="tipo">Tipo de cerveza:</label>
				<br>
				<button type="submit">Guardar</button>
			</div>
			<div>
				<input type="text" name="denominacion" id="denominacion" required>
				<br>
				<select name="marca" id="marca">
					<option value="Heineken">Heineken</option>
					<option value="Mahou">Mahou</option>
					<option value="Dam">Dam</option>
					<option value="Estrella-Galicia">Estrella Galicia</option>
					<option value="Alhambra">Alhambra</option>
					<option value="Cruzcampo">Cruzcampo</option>
					<option value="Artesana">Artesana</option>
				</select>
				<br>
				<input type="radio" name="tipo" id="tipo" value="lager">
				<label for="tipo">Lager</label>
				<input type="radio" name="tipo" id="tipo" value="Pale ale">
				<label for="tipo">Pale ale</label>
				<input type="radio" name="tipo" id="tipo" value="Cerveza-negra">
				<label for="tipo">Cerveza Negra</label>
				<input type="radio" name="tipo" id="tipo" value="Abadia">
				<label for="tipo">Abadia</label>
				<input type="radio" name="tipo" id="tipo" value="Rubia">
				<label for="tipo">Rubia</label>
			</div>

		</form>

	</main>
	<footer>
		<p>Aplicación cervecería "Aquí no vendemos cruzcampo" - jsanches8979 &#174 2025 </p>
	</footer>
</body>

</html>