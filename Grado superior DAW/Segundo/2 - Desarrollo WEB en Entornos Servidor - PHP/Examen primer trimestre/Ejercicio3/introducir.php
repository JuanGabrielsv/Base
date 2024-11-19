<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Introducir en la BD un usuario</title>
</head>

<body>
    <h1>Nuevo Usuario</h1>
    <form enctype="multipart/form-data" method="POST" action="introducir.php">
        <label>Dni:</label>
        <input type="text" name="dni">
        <br>
        <label>Nombre:</label>
        <input type="text" name="nombre">
        <br>
        <label>Apellidos:</label>
        <input type="text" name="apellidos">
        <br>
        <label>Usuario:</label>
        <input type="text" name="usuario">
        <br>
        <label>Contraseña:</label>
        <input type="password" name="contrasena">
        <br>
        <input type="submit" value="Añadir" name="anadir">
    </form>
    <P> <A HREF='javascript:history.back()'>Volver</A> </P>;

    <?php

    // ESTABLECEMOS LA CONEXIÓN CON LA BBDD
    $conn = mysqli_connect("localhost", "root", "", "ejercicio3");

    // COMPROBAMOS QUE LA CONEXIÓN SE HA REALIZADO CORRECTAMENTE
    if (mysqli_connect_errno()) {
        echo "Fallo al conectar con la base de datos: " . mysqli_connect_error();
        exit();
    }

    // SI EL BOTON ES PRESIONADO RECOGEMOS LOS DATOS
    if (isset($_POST['anadir'])) {

        $dni = $_POST['dni'];
        $nombre = $_POST['nombre'];
        $apellidos = $_POST['apellidos'];
        $usuario = $_POST['usuario'];
        $password = $_POST['contrasena'];

        // COMPROBAMOS SI EL NOMBRE DE UAURIO EXISTE YA EN LA BASE DE DATOS
        function existe($usuario)
        {
            global $conn;
            $sql = "SELECT Usuario FROM usuarios WHERE Usuario = '$usuario'";
            $existe = mysqli_query($conn, $sql);
            return mysqli_num_rows($existe) > 0;
        }

        $sql = "INSERT INTO users (dni, nombre, apellidos, usuario, contrasena)
                VALUES ('$dni', '$nombre', '$apellidos', '$usuario', '$password')";

        if (mysqli_query($conn, $sql)) {
            echo "Creado nuevo usuario";
            exit();
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
    }
    mysqli_close($conn);
    ?>
</body>

</html>