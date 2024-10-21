/* 4. Crear un array de objetos que representan productos en una tienda.

• Donde cada objeto tiene las propiedades nombre, precio y categoria:
• Obtener un nuevo array que contenga sólo los nombres de los productos, transformando cada nombre en mayúsculas.
• Mostrar en consola el array de nombres transformados y en la página HTML separados por guión. */


let bebida = {
    nombre: "cocacola",
    precio: 2.25,
    categoria: "Bebidas Gaseosas"
}

let comida = {
    nombre: "Potage",
    precio: 1.50,
    categoria: "Guisos"
}

let snack = {
    nombre: "bocabit",
    precio: 1,
    categoria: "patatas"
}

let aObjetos = [bebida, comida, snack];


let aNombreObjetos = aObjetos.map(elemento => elemento.nombre.toUpperCase());
document.body.innerHTML = aNombreObjetos.join(" - ");


















