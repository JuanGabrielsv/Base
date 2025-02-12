<?php
session_start();

// Verificar si el usuario está logeado
if (!isset($_SESSION['id_usuario'])) {
	header("Location: login.php");
	exit();
}

// Obtener el id_usuario desde la sesión
$id_usuario = $_SESSION['id_usuario'];

// Verificar que se ha recibido el id desde la URL
if (isset($_GET['id']) && is_numeric($_GET['id'])) {
	$id_producto = $_GET['id'];  // Usamos 'id' que es el parámetro que se pasa en la URL

	// Conectar a la base de datos
	$conn = new mysqli("localhost:3306", "root", "", "app_cerveceria");

	if ($conn->connect_error) {
		die("Error de conexión: " . $conn->connect_error);
	}

	// Verificar si el producto ya está en el carrito
	$sql = "SELECT * FROM carrito WHERE id_usuario = ? AND id_producto = ?";
	$stmt = $conn->prepare($sql);
	$stmt->bind_param("ii", $id_usuario, $id_producto);
	$stmt->execute();
	$result = $stmt->get_result();

	// Si el producto ya está en el carrito, aumentar la cantidad
	if ($result->num_rows > 0) {
		$sql_update = "UPDATE carrito SET cantidad = cantidad + 1 WHERE id_usuario = ? AND id_producto = ?";
		$stmt_update = $conn->prepare($sql_update);
		$stmt_update->bind_param("ii", $id_usuario, $id_producto);
		$stmt_update->execute();
	} else {
		// Si no está en el carrito, insertarlo
		$sql_insert = "INSERT INTO carrito (id_usuario, id_producto, cantidad) VALUES (?, ?, 1)";
		$stmt_insert = $conn->prepare($sql_insert);
		$stmt_insert->bind_param("ii", $id_usuario, $id_producto);
		$stmt_insert->execute();
	}

	// Redirigir al carrito o donde sea necesario después de agregar el producto
	header("Location: carrito.php");
	exit();
} else {
	echo "Producto no válido.";
}
