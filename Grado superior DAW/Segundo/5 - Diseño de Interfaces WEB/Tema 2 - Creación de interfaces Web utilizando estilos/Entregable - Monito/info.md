# Entregable monito mira, no mira.

## Autor: <span style="color: #00a300;"> Juan Gabriel Sánchez - jsanchez8979 </span>

### Descargas

- [index.html](src/index.html)
- [style.css](src/css/style.css)


**Fichero HTML**

```
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Entregable - Mono</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/temblor_monito_aguantandose.js" defer></script>
</head>

<body>
    <main>
        <form action="#" method="post">
            <fieldset>
                <div>
                    <label for="nombre-usuario">Nombre de usuario:</label>
                    <input type="text" name="Nombreusuario" id="nombre-usuario">
                </div>
                <label for="contrasena">Contraseña:</label>
                <input class="input-mono" type="password" name="Contraseña" id="contrasena">
            </fieldset>
            <input class="boton-enviar" type="submit" value="Enviar" disabled>
        </form>
    </main>
</body>
</html>

```

**Fichero CSS**

```
@font-face {
    font-family: "inter-roman";
    src: url(../fonts/inter-roman-latin.woff2) format("woff2");
    font-weight: normal;
    font-style: normal;
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: "inter-roman";
}

body {
    background-color: #1b1b1f;
}

main {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

fieldset {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    background-color: #202127;
    width: 440px;
    border-radius: 0.5em;
    padding: 0.7em;
    border: 1px solid #77777c;
}

label {
    color: #dfdfd6;
    width: 38%;
}

input {
    border: none;
    outline: none;
    height: 40px;
    width: 62%;
    border-radius: 10px;
    padding: 0.5em;
    font-size: 16px;
}

div {
    display: flex;
    align-items: center;
    width: 100%;
    margin-bottom: 0.5em;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.boton-enviar {
    background-color: #a8b1ff;
    color: #000000;
    border-radius: 0.5em;
    margin-top: 1em;
    width: 100%;
    cursor: pointer;
}

.boton-enviar:hover {
    background-color: #ced3ff;
}

.input-mono {
    padding-left: 45px;
    background-image: url(../img/monkey_mira_icon.svg);
    background-repeat: no-repeat;
    background-position: 0.6em;
    background-size: 25px;
}

.input-mono:focus {
    background-image: url(../img/monkey_no_mira_icon.svg);
}

.temblor {
    animation: shake 0.5s;
    animation-iteration-count: infinite;
}

@keyframes shake {
    0% {
        transform: translate(1px, 1px) rotate(0deg);
    }

    10% {
        transform: translate(-1px, -2px) rotate(-1deg);
    }

    20% {
        transform: translate(-3px, 0px) rotate(1deg);
    }

    30% {
        transform: translate(3px, 2px) rotate(0deg);
    }

    40% {
        transform: translate(1px, -1px) rotate(1deg);
    }

    50% {
        transform: translate(-1px, 2px) rotate(-1deg);
    }

    60% {
        transform: translate(-3px, 1px) rotate(0deg);
    }

    70% {
        transform: translate(3px, 1px) rotate(-1deg);
    }

    80% {
        transform: translate(-1px, -1px) rotate(1deg);
    }

    90% {
        transform: translate(1px, 2px) rotate(0deg);
    }

    100% {
        transform: translate(1px, -2px) rotate(-1deg);
    }
}

```

