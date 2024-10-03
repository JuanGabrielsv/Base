/* 8. Crea un programa que simule el lanzamiento de una moneda. Cada vez que se ejecute el programa, debe 
generar aleatoriamente "Cara" o "Cruz". Luego, muestra el resultado en una alerta, en la consola y en la 
página. */

let random = parseInt(Math.random() * (1 - 0 + 1));

if (random === 0) {
    document.write(`Cara`);

} else {
    document.write(`Cruz`);
}