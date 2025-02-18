<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Aplicación para comprar cervezas, menos cruzcampo...">
	<link rel="shortcut icon" href="src/img/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="src/css/index.css">
	<title>Cervecera - Aquí no vendemos cruzcampo</title>
</head>

<body>
	<header>
		<div>
			<img src="src/img/logotipo.svg" alt="logotipo de una jarra de cerveza">
			<h1>APP - Aquí no vendemos cruzcampo.</h1>
		</div>
	</header>
	<main>
		<form action="./src/php/login.php" method="post">
			<label for="nombre-usuario">Nombre usuario</label>
			<input type="text" id="nombre-usuario" name="nombre-usuario" required>
			<label for="contrasena">Contraseña</label>
			<input type="password" id="password" name="password" required>
			<button type="submit">Iniciar sesión</button>
		</form>
	</main>
	<footer>
		<p>Aplicación cervecería "Aquí no vendemos cruzcampo" - jsanches8979 &#174 2025 </p>
	</footer>
</body>

</html>

<?php
/*session_start();
$host = 'localhost:3306';
$user = 'root';
$password = '';
$dbname = 'app_cerveceria';

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
	die("Conexión fallida: " . $conn->connect_error);
}

$correo = 'admin@phpmola.com';
$password = '12345';
$edad = 42;
$perfil = 'admin';

$hashed_password = md5($password);

$query = "INSERT INTO usuario (correo, password, edad, perfil) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($query);

if ($stmt === false) {
	die("Error en la preparación de la consulta: " . $conn->error);
}

$stmt->bind_param("ssis", $correo, $hashed_password, $edad, $perfil);

if ($stmt->execute()) {
	echo "Usuario registrado exitosamente.";
} else {
	echo "Error al registrar el usuario: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
<?php
session_start();
$host = 'localhost:3306';
$user = 'root';
$password = '';
$dbname = 'app_cerveceria';

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
	die("Conexión fallida: " . $conn->connect_error);
}

$correo = 'usuario@phpmola.com';
$password = '12345';
$edad = 18;
$perfil = 'user';

$hashed_password = md5($password);

$query = "INSERT INTO usuario (correo, password, edad, perfil) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($query);

if ($stmt === false) {
	die("Error en la preparación de la consulta: " . $conn->error);
}

$stmt->bind_param("ssis", $correo, $hashed_password, $edad, $perfil);

if ($stmt->execute()) {
	echo "Usuario registrado exitosamente.";
} else {
	echo "Error al registrar el usuario: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>*/