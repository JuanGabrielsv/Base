<?php
session_start();

// Conectar a la base de datos
$conn = new mysqli("localhost:3306", "root", "", "app_cerveceria");

if ($conn->connect_error) {
	die("Error de conexión: " . $conn->connect_error);
}

// Consulta para obtener los artículos
$sql = "SELECT * FROM productos";
$result = $conn->query($sql);
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
		<div>
			<p>Perfil: <?php echo isset($_SESSION['perfil']) ? $_SESSION['perfil'] : 'Perfil no disponible'; ?></p>
			<button onclick="window.location.href='logout.php'">Salir</button>
		</div>
	</header>

	<main>
		<h2>Listado de Cervezas</h2>
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
				<?php
				if ($result->num_rows > 0) {
					while ($row = $result->fetch_assoc()) {
						echo "<tr>
                    <td>{$row['ID_PRODUCTO']}</td>
                    <td>{$row['Denominacion_Cerveza']}</td>
                    <td>{$row['Marca']}</td>
                    <td>{$row['Tipo']}</td>
                    <td>{$row['Formato']}</td>
                    <td>{$row['Tamano']}</td>
                    <td>{$row['Alergenos']}</td>
                    <td>{$row['Fecha_Consumo']}</td>
                    <td><img src='../img/image-producto/{$row['Foto']}' width='50'></td>
                    <td>{$row['Precio']}€</td>
                    <td>{$row['Observaciones']}</td>
                    <td>
                        <form action='eliminar.php' method='post' style='display:inline;'>
                            <input type='hidden' name='id' value='{$row['ID_PRODUCTO']}'>
                            <button type='submit'>Eliminar</button>
                        </form>
                        <a href='actualizar.php?id={$row['ID_PRODUCTO']}'><button>Actualizar</button></a>
                    </td>
                </tr>";
					}
				} else {
					echo "<tr><td colspan='12'>No hay cervezas registradas.</td></tr>";
				}
				?>
			</tbody>
		</table>
		<br>
		<div class="form-fila">
			<a href="formulario.php">
				<button type="button">Insertar cerveza</button>
			</a>
		</div>

	</main>
	<footer>
		<p>Aplicación cervecería "Aquí no vendemos cruzcampo" - jsanches8979 &#174 2025 </p>
	</footer>
</body>

</html>

<?php
$conn->close();
?>