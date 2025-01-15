/* 2. Crear un array con 3 palabras que se introducirán por mensajes al usuario palabra a palabra (3 veces).
    • Si cancela, se insertará una cadena vacía en el array.
    • Escribir por consola y por pantalla, el array inicial y el array filtrando sólo las que comienzan por la letra C o c.
    • Mostrarlas las palabras separadas por coma.
    • Si no hay ninguna, escribir: “No hay ninguna palabra que comience por C.” */

let aPalabrasUsuario = [];

do {
    let palabra = prompt("Introduce una palabra");
    if (palabra === null) {
        aPalabrasUsuario.push("");
    } else {
        aPalabrasUsuario.push(palabra);
    }
} while (aPalabrasUsuario.length !== 3);

document.body.innerHTML += `Array inicial: ${aPalabrasUsuario.join(" | ")}<br>`;
console.log(aPalabrasUsuario);

let aFiltrado = aPalabrasUsuario.filter((palabra) => palabra.startsWith("C") || palabra.startsWith("c"));

if (aFiltrado.length == 0) {
    document.body.innerHTML += `No hay ninguna palabra que comience por C.`;
    console.log(aFiltrado);
} else {
    document.body.innerHTML += `Array filtrado: ${aFiltrado.join(" | ")}`;
    console.log(aFiltrado);
}

