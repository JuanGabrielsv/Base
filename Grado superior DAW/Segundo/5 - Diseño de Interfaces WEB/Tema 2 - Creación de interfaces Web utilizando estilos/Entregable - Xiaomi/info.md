# Entregable iconos responsive.

## Autor: <span style="color: #00a300;"> Juan Gabriel Sánchez - jsanchez8979 </span>

### Descargas

- [index.html](src/index.html)
- [style.css](src/css/style.css)


**Fichero HTML**

```
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Maquetación iconos cdn</title>
    <link rel="stylesheet" href="css/style.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
      integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
  </head>
  <body>
    <header>
      <h1>Tipografías</h1>
    </header>
    <main>
      <section class="libro-negro">
        <i class="fa-solid fa-book"></i>
        <p class="texto">¡Qué empiezen los juegos!</p>
      </section>
      <section class="globo">
        <i class="fa-solid fa-globe"></i>
        <p class="texto">¡Qué empiezen los juegos!</p>
      </section>
      <section class="libro-blanco">
        <i class="fa-regular fa-file-lines"></i>
        <p class="texto">¡Qué empiezen los juegos!</p>
      </section>
    </main>
  </body>
</html>

```

**Fichero CSS**

```
@font-face {
  font-family: "nunito-sans";
  src: url(../fonts/NunitoSans_10pt-Regular.ttf) format("truetype");
}

* {
  font-family: "nunito-sans";
}

header {
  text-align: center;
}

main {
  display: flex;
  justify-content: space-evenly;
}

section {
  display: flex;
  flex-direction: column;
  align-items: center;
}

@media (max-width: 1024px) {
  main {
    display: flex;
    flex-wrap: wrap;
  }

  .libro-negro {
    order: 1;
  }

  .globo {
    width: 100%;
    border: solid 2px black;
    order: 2;
    padding-top: 0.2em;
  }

  .globo p {
    margin-bottom: 1em;
  }

  .libro-negro,
  .libro-blanco {
    width: 50%;
  }
}

@media (max-width: 475px) {
  main {
    flex-direction: column;
  }

  .globo {
    order: 1;
    border: unset;
  }

  .libro-negro {
    width: 100%;
    margin-bottom: 0;
    order: 1;
    background-color: rgb(233, 233, 233);
  }

  .libro-blanco {
    width: 100%;
  }

  i {
    padding-top: 1em;
  }

  p {
    padding: 0.3em 0 1em 0;
  }
}

```

