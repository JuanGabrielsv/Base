/* 10. Genera 10 números aleatorios entre 0 y 20 (incluido) y calcula la suma de ellos.
Debe mostrar por pantalla: “La suma de los numeros xxxxx es x” */

let suma = Number();
let mensaje = "La suma de los números: ";

for (i = 1; i <= 10; i++) {
    let random = parseInt(Math.random() * (20 - 0 + 1));
    mensaje += " " + random;
    suma += random;
}

suma = String(suma);

document.write(mensaje + " es " + suma);

