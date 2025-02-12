<?php
session_start();

// Conectar a la base de datos
$conn = new mysqli("localhost:3306", "root", "", "app_cerveceria");

if ($conn->connect_error) {
	die("Error de conexión: " . $conn->connect_error);
}

// Obtener perfil del usuario
$perfil = isset($_SESSION['perfil']) ? $_SESSION['perfil'] : '';

// Consulta para obtener los artículos
$sql = "SELECT * FROM productos";
$stmt = $conn->prepare($sql);
$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../css/plantilla_general.css">
	<link rel="stylesheet" href="../css/articulos.css">
	<title>Listado de Cervezas</title>
</head>

<body>
	<header>
		<div>
			<img src="../img/logotipo.svg" alt="logotipo de una jarra de cerveza">
			<h1>APP - Aquí no vendemos cruzcampo.</h1>
		</div>
		<button onclick="window.location.href='buscador.php'">Buscar Producto</button>
		<div>
			<p>Perfil: <?php echo htmlspecialchars($perfil); ?></p>
			<button onclick="window.location.href='logout.php'">Salir</button>
		</div>
	</header>

	<main>
		<h2>Listado de Cervezas</h2>

		<?php if ($result->num_rows > 0) : ?>
			<table border="1">
				<thead>
					<tr>
						<th>ID</th>
						<th>Denominación</th>
						<th>Marca</th>
						<th>Tipo</th>
						<th>Formato</th>
						<th>Tamaño</th>
						<th>Alérgenos</th>
						<th>Fecha de Consumo</th>
						<th>Foto</th>
						<th>Precio</th>
						<th>Observaciones</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody>
					<?php while ($row = $result->fetch_assoc()) : ?>
						<tr>
							<td><?php echo $row['ID_PRODUCTO']; ?></td>
							<td><?php echo $row['Denominacion_Cerveza']; ?></td>
							<td><?php echo $row['Marca']; ?></td>
							<td><?php echo $row['Tipo']; ?></td>
							<td><?php echo $row['Formato']; ?></td>
							<td><?php echo $row['Tamano']; ?></td>
							<td><?php echo $row['Alergenos']; ?></td>
							<td><?php echo $row['Fecha_Consumo']; ?></td>
							<td><img src="../img/image-producto/<?php echo $row['Foto']; ?>" width="50"></td>
							<td><?php echo $row['Precio']; ?>€</td>
							<td><?php echo $row['Observaciones']; ?></td>
							<td>
								<?php if ($perfil === 'user') : ?>
									<!-- Si el perfil es "user", solo muestra "Añadir" -->
									<button onclick="window.location.href='añadir.php?id=<?php echo $row['ID_PRODUCTO']; ?>'">Añadir</button>
								<?php else : ?>
									<!-- Si es admin u otro perfil, muestra Eliminar y Actualizar -->
									<form action="eliminar.php" method="post" style="display:inline;">
										<input type="hidden" name="id" value="<?php echo $row['ID_PRODUCTO']; ?>">
										<button type="submit">Eliminar</button>
									</form>
									<a href="actualizar.php?id=<?php echo $row['ID_PRODUCTO']; ?>"><button>Actualizar</button></a>
								<?php endif; ?>
							</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		<?php else : ?>
			<p>No se encontraron cervezas.</p>
		<?php endif; ?>

		<br>
		<!-- Mostrar el botón "Insertar cerveza" solo si el perfil no es "user" -->
		<?php if ($perfil !== 'user') : ?>
			<div class="form-fila">
				<a href="formulario.php">
					<button type="button">Insertar cerveza</button>
				</a>
			</div>
		<?php endif; ?>
		<form action="añadir.php" method="GET">
			<input type="hidden" name="id_producto" value="<?php echo $row['ID_PRODUCTO']; ?>">
			<button type="submit">Añadir</button>
		</form>
	</main>
	<footer>
		<p>Aplicación cervecería "Aquí no vendemos cruzcampo" - jsanches8979 &#174 2025 </p>
	</footer>
</body>

</html>

<?php
$stmt->close();
$conn->close();
?>