<?php
session_start();

// Verificar si el usuario está logeado
if (!isset($_SESSION['id_usuario'])) {
	header("Location: login.php");
	exit();
}

// Obtener el id_usuario desde la sesión
$id_usuario = $_SESSION['id_usuario'];

// Conectar a la base de datos
$conn = new mysqli("localhost:3306", "root", "", "app_cerveceria");

if ($conn->connect_error) {
	die("Error de conexión: " . $conn->connect_error);
}

// Obtener los productos del carrito del usuario actual
$sql = "SELECT c.id, c.cantidad, p.Denominacion_Cerveza, p.Precio, p.Foto
        FROM carrito c
        JOIN productos p ON c.id_producto = p.ID_PRODUCTO
        WHERE c.id_usuario = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id_usuario);
$stmt->execute();
$result = $stmt->get_result();

// Obtener el total del carrito
$sql_total = "SELECT SUM(c.cantidad * p.Precio) AS total
              FROM carrito c
              JOIN productos p ON c.id_producto = p.ID_PRODUCTO
              WHERE c.id_usuario = ?";
$stmt_total = $conn->prepare($sql_total);
$stmt_total->bind_param("i", $id_usuario);
$stmt_total->execute();
$result_total = $stmt_total->get_result();
$total = $result_total->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Confirmación de Pago</title>
	<link rel="stylesheet" href="../css/plantilla_general.css">
	<link rel="stylesheet" href="../css/articulos.css">
</head>

<body>
	<header>
		<div>
			<img src="../img/logotipo.svg" alt="logotipo de una jarra de cerveza">
			<h1>Confirmación de Pago</h1>
		</div>
		<div>
			<p>Perfil: <?php echo htmlspecialchars($_SESSION['perfil']); ?></p>
			<button onclick="window.location.href='logout.php'">Salir</button>
		</div>
	</header>

	<main>
		<h2>Resumen de la Compra</h2>

		<?php if ($result->num_rows > 0) : ?>
			<table border="1">
				<thead>
					<tr>
						<th>Imagen</th>
						<th>Denominación</th>
						<th>Cantidad</th>
						<th>Precio</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
					<?php while ($row = $result->fetch_assoc()) : ?>
						<tr>
							<td><img src="../img/image-producto/<?php echo $row['Foto']; ?>" width="50" alt="Imagen de <?php echo htmlspecialchars($row['Denominacion_Cerveza']); ?>"></td>
							<td><?php echo htmlspecialchars($row['Denominacion_Cerveza']); ?></td>
							<td><?php echo $row['cantidad']; ?></td>
							<td><?php echo $row['Precio']; ?>€</td>
							<td><?php echo $row['cantidad'] * $row['Precio']; ?>€</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>

			<h3>Total a Pagar: <?php echo $total['total']; ?>€</h3>

			<!-- Formulario de pago -->
			<form action="procesar_pago.php" method="POST">
				<h3>Detalles del Pago</h3>
				<label for="direccion">Dirección de Envío:</label>
				<input type="text" name="direccion" id="direccion" required>
				<br><br>

				<label for="metodo_pago">Método de Pago:</label>
				<select name="metodo_pago" id="metodo_pago" required>
					<option value="tarjeta">Tarjeta de Crédito/Débito</option>
					<option value="paypal">PayPal</option>
					<option value="transferencia">Transferencia Bancaria</option>
				</select>
				<br><br>

				<input type="submit" value="Confirmar Pago" onclick="window.location.href='confirmarPago.php'; return false;">

			</form>

		<?php else : ?>
			<p>No tienes productos en el carrito.</p>
		<?php endif; ?>

	</main>

	<footer>
		<p>Aplicación cervecería "Aquí no vendemos cruzcampo" - jsanches8979 &#174 2025</p>
	</footer>
</body>

</html>

<?php
$stmt->close();
$stmt_total->close();
$conn->close();
?>