<?php
session_start();

// Verificar si se envió un ID
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id'])) {
	$id = intval($_POST['id']);

	// Conectar a la base de datos
	$conn = new mysqli("localhost:3306", "root", "", "app_cerveceria");

	if ($conn->connect_error) {
		die("Error de conexión: " . $conn->connect_error);
	}

	// Eliminar la cerveza de la base de datos
	$sql = "DELETE FROM productos WHERE ID_PRODUCTO = ?";
	$stmt = $conn->prepare($sql);
	$stmt->bind_param("i", $id);

	if ($stmt->execute()) {
		echo "Cerveza eliminada correctamente.";
	} else {
		echo "Error al eliminar la cerveza: " . $conn->error;
	}

	$stmt->close();
	$conn->close();

	// Redirigir de vuelta a la lista de cervezas
	header("Location: articulos.php");
	exit();
} else {
	echo "Solicitud inválida.";
}
