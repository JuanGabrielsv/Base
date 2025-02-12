<?php
session_start();

$conn = new mysqli("localhost:3306", "root", "", "app_cerveceria");

if ($conn->connect_error) {
	die("Error de conexión: " . $conn->connect_error);
}

$username = $_POST['nombre-usuario'];
$password = md5($_POST['password']);

$sql = "SELECT * FROM usuario WHERE CORREO = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
	$user = $result->fetch_assoc();

	var_dump($user);

	if (($password == $user['PASSWORD'])) {
		echo 'Inicio de sesión correcto';
		$_SESSION['perfil'] = $user['PERFIL'];

		if ($user['PERFIL'] == "admin") {
			header("Location: formulario.php");
		} else {
			// Después de verificar el usuario y la contraseña
			$_SESSION['id_usuario'] = $user['ID']; // Corrección aquí

			header("Location: articulos.php");
		}
		exit();
	} else {
		echo "Contraseña incorrecta";
	}
} else {
	echo "Usuario no encontrado";
}

$stmt->close();
$conn->close();
