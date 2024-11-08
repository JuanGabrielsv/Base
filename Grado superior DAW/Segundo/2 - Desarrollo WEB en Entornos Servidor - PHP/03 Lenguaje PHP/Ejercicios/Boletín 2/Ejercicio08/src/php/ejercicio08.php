<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio08 - Boletín 2</title>
</head>

<body style="font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;">
    <header>
        <h1>Curriculum Vitae</h1>
    </header>
    <main style="display: flex;">
        <section style="text-align: center; font-weight: bold; margin-right: 0.5rem;">
            <p>Nombre</p>
            <p>Apellidos</p>
            <p>Sexo</p>
            <p>E-mail</p>
            <p>Teléfono</p>
            <p>Experiencia Laboral</p>
            <p>Estudios realizados</p>
            <p>Jornada Laboral</p>
            <p>Idiomas</p>
        </section>
        <section>
            <p><?php print $_REQUEST['nombre'] ?></p>
            <p><?php print $_REQUEST['apellidos'] ?></p>
            <p><?php print $_REQUEST['sexo'] ?></p>
            <p><?php print $_REQUEST['email'] ?></p>
            <p><?php print $_REQUEST['numero-contacto'] ?></p>
            <p><?php print $_REQUEST['experiencia-laboral'] ?></p>
            <p><?php print $_REQUEST['estudios'] ?></p>
            <p><?php print $_REQUEST['jornada-laboral'] ?></p>
            <p><?php
                print '<ul>';
                foreach ($_REQUEST['idiomas'] as $idioma) {
                    print '<li>' . $idioma . '</li>';
                }
                print '</ul>';
                ?></p>
        </section>

    </main>
</body>

</html>