# Entregable - Actividad border.

## Autor: <span style="color: #00a300;"> Juan Gabriel Sánchez - jsanchez8979 </span>

### Descargas

- [index.html](src/index.html)
- [style.css](src/css/styles.css)


**Fichero HTML**

```
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Entregable - Bordes</title>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <header>
            <h1>Entregable 06 - Actividad border</h1>
        </header>
        <main>
            <div class="contenedor1">
                <h1>Tipografías</h1>
                <p>¡Qué empiecen los juegos!</p>
            </div>
            <div class="contenedor2">
                <h1>Tipografías</h1>
                <p>¡Qué empiecen los juegos!</p>
            </div>
        </main>
        <footer>Ejercicio realizado por Juan Gabriel Sánchez&reg - jsanchez8979
            - 2024</footer>
    </body>
</html>

```

**Fichero CSS**

```
body {
    display: grid;
    grid-template-rows: auto 1fr auto;
    height: 100vh;
    margin: 0;    
}

main {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

header {
    border-bottom: 1px solid black;
    text-align: center;
}

footer {
    padding: 0.5em;
    border-top: 1px solid black;
    text-align: center;
}

.contenedor1 {
    padding: 1em;
    width: 50%;    
    background-color: #009e08;
    border-bottom: 20px dashed #b1b1b1 ;
    border-right: 10px solid black;    
    margin-bottom: 2rem;
    color: white;
}

.contenedor2 {
    border-top: 15px solid #009e08;
    border-bottom: 15px solid #009e08;
    border-left: 15px solid black;
    padding: 1em;
    background-color: black;
    color: white;
    width: 80%;    
}

@media (max-width: 425px) {
    .contenedor1 {
        background-color: rgb(190, 190, 190);
        border: none;
        width: 100%;
        height: 30%;
        padding-left: 5rem;
        padding-bottom: 0;   
        margin-bottom: 1rem;     
    }

    .contenedor2 {
        width: 80.5%;
        border-right: 25px solid black;
        border-left: 25px solid black;
        border-bottom: 40px solid rgb(255, 255, 255);
    }
}

```

