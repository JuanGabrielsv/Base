<?php
$nombre = "";
$edad = "";
$email = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST["nombre"];
    $edad = $_POST["edad"];
    $email = $_POST["email"];
    $contador = 0;

    if (!preg_match("/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/", $nombre)) {
        print '<p style="color: red;">• El nombre no debe contener números o caracteres especiales.</p>';
        $contador++;
    }
    if (!filter_var($edad, FILTER_VALIDATE_INT, ["options" => ["min_range" => 3, "max_range" => 130]])) {
        print '<p style="color: red;">• La edad debe estar entre 3 y 130 años.</p>';
        $contador++;
    }
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        print '<p style="color: red;">• El formato del correo electrónico no es válido.</p>';
        $contador++;
    }
    if ($contador == 0) {
        print '<p style="color: lightgreen;">• Todo correcto.</p>';
    }
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>Ejercicio09 - Boletín 2</title>
</head>

<body>
    <main style="display: flex; flex-direction: column; width: 10rem;">
        <form action="index.php" method="post">
            <label for="nombre">Nombre</label>
            <input type="text" name="nombre" id="nombre" value="<?= htmlspecialchars($nombre) ?>" required>

            <label for="edad">Edad</label>
            <input type="number" name="edad" id="edad" value="<?= htmlspecialchars($edad) ?>" required>

            <label for="email">Email</label>
            <input type="email" name="email" id="email" value="<?= htmlspecialchars($email) ?>" required autocomplete="NULL">

            <button type="submit">Enviar</button>
        </form>
    </main>
</body>

</html>