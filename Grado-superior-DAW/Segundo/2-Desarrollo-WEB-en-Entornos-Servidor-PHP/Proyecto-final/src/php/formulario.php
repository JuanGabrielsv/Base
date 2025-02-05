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
		<section class="section1">
			<h2>Inserción de Cervezas</h2>
			<p>Introduzca los datos de la Cerveza</p>
			<form action="registro.php" method="get" class="section-form">
				<div class="form-fila">
					<label for="denominacion">Denominación cerveza:</label>
					<input type="tel" name="denominacion" id="denominacion">
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
				<div class="form-fila">
					<label for="tipo">Tipo de cerveza:</label>
					<div>
						<input type="checkbox" name="tipo" id="tipo" value="lager">
						<label for="tipo">Lager</label>
						<input type="checkbox" name="tipo" id="tipo" value="Pale Ale">
						<label for="tipo">Pale Ale</label>
						<input type="checkbox" name="tipo" id="tipo" value="Cerveza Negra">
						<label for="tipo">Cerveza Negra</label>
						<input type="checkbox" name="tipo" id="tipo" value="Abadia">
						<label for="tipo">Abadia</label>
						<input type="checkbox" name="tipo" id="tipo" value="Rubia">
						<label for="tipo">Rubia</label>
					</div>
				</div>
				<div class="form-fila">
					<label for="formato">Formato:</label>
					<select name="formato" id="formato" class="form-select">
						<option value="lata" selected>Lata</option>
						<option value="botella" selected>Botella</option>
						<option value="pack" selected>Pack</option>
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
				<button>Insertar Cerveza</button>
			</form>
		</section>
	</main>
	<footer>
		<p>Aplicación cervecería "Aquí no vendemos cruzcampo" - jsanchez8979 &#174 2025 </p>
	</footer>
</body>

</html>