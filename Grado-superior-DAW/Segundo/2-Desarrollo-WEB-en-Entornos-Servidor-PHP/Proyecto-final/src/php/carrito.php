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

?>

<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Carrito de Compras</title>
	<link rel="stylesheet" href="../css/plantilla_general.css">
	<link rel="stylesheet" href="../css/articulos.css">
</head>

<body>
	<header>
		<div>
			<img src="../img/logotipo.svg" alt="logotipo de una jarra de cerveza">
			<h1>Carrito de Compras</h1>
		</div>
		<div>
			<p>Perfil: <?php echo htmlspecialchars($_SESSION['perfil']); ?></p>
			<button onclick="window.location.href='logout.php'">Salir</button>
		</div>
	</header>

	<main>
		<h2>Artículos en tu carrito</h2>

		<?php if ($result->num_rows > 0) : ?>
			<table border="1">
				<thead>
					<tr>
						<th>Imagen</th>
						<th>Denominación</th>
						<th>Cantidad</th>
						<th>Precio</th>
						<th>Total</th>
						<th>Eliminar</th>
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
							<td>
								<!-- Aquí va un botón para eliminar el artículo del carrito -->
								<form action="eliminar_del_carrito.php" method="POST" style="display:inline;">
									<input type="hidden" name="id_carrito" value="<?php echo $row['id']; ?>">
									<button type="submit">Eliminar</button>
								</form>
							</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>

			<!-- Aquí podrías añadir un resumen de la compra -->
			<div>
				<h3>Total:
					<?php
					$sql_total = "SELECT SUM(c.cantidad * p.Precio) AS total
                                  FROM carrito c
                                  JOIN productos p ON c.id_producto = p.ID_PRODUCTO
                                  WHERE c.id_usuario = ?";
					$stmt_total = $conn->prepare($sql_total);
					$stmt_total->bind_param("i", $id_usuario);
					$stmt_total->execute();
					$result_total = $stmt_total->get_result();
					$total = $result_total->fetch_assoc();
					echo $total['total'] . "€";
					?>
				</h3>
			</div>

			<button onclick="window.location.href='pago.php'">Proceder al pago</button>

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
// Cerrar la conexión
$stmt->close();
$conn->close();
?>