/* 8. Crear una página que pida el precio de un artículo y la cantidad de artículos que desea comprar. Escribir en
la página HTML el total que debe abonar. ( El precio debe ser un numero con decimales)
¿Cómo podemos fijar el número decimal sólo con 2 decimales? */

let precio = Number(prompt("Introduce el precio:"));
let cantidadArticulos = Number(prompt("Introduce la cantidad de artículos:"));

let precioFinal = precio * cantidadArticulos;
document.write(`El precio total que debes pagar es de: ${precioFinal}`);

//¿Cómo podemos fijar el número decimal sólo con 2 decimales?
document.write(`<br>El precio total que debes pagar es de: ${precioFinal.toFixed(2)}`);
