<?php
session_start();

/* SI LA SECCIÓN NO TIENE AGENDA LA INICIALIZAMOS EN BLANCO */
if (!isset($_SESSION['agenda'])) {
    $_SESSION['agenda'] = [];
}

$aviso = "";

/* ANALISAMOS LOS DATOS INTRODUCIDOS Y EN FUNCIÓN MOSTRAMOS AVISO */

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $_POST['nombre'];
    $telefono = $_POST['telefono'];

    if ($nombre === '') {
        $aviso = "Introduce el contacto.";
    } else {
        if (isset($_SESSION['agenda'][$nombre])) {

            if ($telefono === '') {
                unset($_SESSION['agenda'][$nombre]);
                $aviso = "Entrada eliminada: $nombre.";
            } else {
                $_SESSION['agenda'][$nombre] = $telefono;
                $aviso = "Entrada actualizada: $nombre.";
            }
        } else {

            if ($telefono !== '') {
                $_SESSION['agenda'][$nombre] = $telefono;
                $aviso = "Entrada añadida: $nombre.";
            } else {
                $aviso =
                    "El teléfono no está registrado con ninguna entrada";
            }
        }
    }
}
?>

<!-- REALIZAMOS EL HTML -->

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EJERCICIO 2 - ASIGNATURA ANTONIO</title>
</head>

<body>
    <h1>Agenda</h1>

    <!-- SEGÚN QUE RESULTADOS TENEMOS DEL FORMULARIO MANDAMOS MENSAJE O LO IMPRIMIMOS -->

    <?php if (!empty($_SESSION['agenda'])): ?>
        <table>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Teléfono</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($_SESSION['agenda'] as $nombre => $telefono): ?>
                    <tr>
                        <td><?php print htmlspecialchars($nombre); ?></td>
                        <td><?php print htmlspecialchars($telefono); ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>La agenda está vacia</p>
    <?php endif; ?>
    <?php if ($aviso): ?>
        <div><?php echo htmlspecialchars($aviso); ?></div>
    <?php endif; ?>
    <div>
        <form method="post">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
            <br><br>
            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono">
            <br><br>
            <button type="submit">Aplicar cambios</button>
        </form>
    </div>
</body>

</html>