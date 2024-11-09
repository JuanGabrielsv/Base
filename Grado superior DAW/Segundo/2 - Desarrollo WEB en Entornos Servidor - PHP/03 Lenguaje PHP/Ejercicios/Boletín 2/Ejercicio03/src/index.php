<?php
$edad = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $edad = $_POST["edad"];
    $contador = 0;

    if ($edad < 18) {
        print '<p style="color: red;">• Eres menor de edad tienes prohibido el acceso.</p>';
        $contador++;
    } else if ($edad > 65) {
        print '<p style="color: red;">• El contenido por desgracia no es para jubilados.</p>';
        $contador++;
    } else {
        print '<p style="color: lightgreen;">• Bienvenido a la Web <a href="https://www.srcodigofuente.es/adultos-no-jubilados">www.srcodigofuente.es/adultos-no-jubilados</a></p>';
    }
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio03 - Boletín 2</title>
</head>

<body>
    <main style="display: flex; flex-direction: column; width: 10rem;">
        <form action="index.php" method="post">
            <label for="edad">¿Cuántos años tienes?</label>
            <input type="number" name="edad" id="edad" value="<?= htmlspecialchars($edad) ?>" required>
            <button type="submit">Enviar</button>
        </form>
    </main>
</body>

</html>