/*
EJERCICIO16. 
Tienes un array de objetos que representan productos en una tienda. 
Cada objeto tiene un nombre, un precio, y una propiedad categoria, que es otro objeto con un nombre y una descripción. 

Realiza las siguientes tareas:

    1. Crear un array de productos donde cada producto tiene una categoría con nombre y descripción.
    2. Obtener un array de nombres de productos pertenecientes a una categoría específica (por ejemplo,
    "Electrónica"). Imprimirlo
    3. Imprimir los detalles de los productos filtrados, incluyendo el nombre de la categoría y su
    descripción.
*/

//1. Crear un array de productos donde cada producto tiene una categoría con nombre y descripción.
let arrayProductos = [
  {
    nombre: "Producto1",
    precio: 9.99,
    categoria: { nombre: "Categoría1", descripcion: "Descripción1" },
  },
  {
    nombre: "Producto2",
    precio: 5.52,
    categoria: { nombre: "Electrónica", descripcion: "Descripción2" },
  },
  {
    nombre: "Producto3",
    precio: 3.99,
    categoria: { nombre: "Categoría3", descripcion: "Descripción3" },
  },
  {
    nombre: "Producto4",
    precio: 25.12,
    categoria: { nombre: "Electrónica", descripcion: "Descripción4" },
  },
  {
    nombre: "Producto5",
    precio: 16,
    categoria: { nombre: "Categoría5", descripcion: "Descripción5" },
  },
];

//2. Obtener un array de nombres de productos pertenecientes a una categoría específica (por ejemplo,"Electrónica"). Imprimirlo
function obtenerProductosCategoriaElectronica(parametro) {

    let arrayProductosCategoriaElectronica = parametro.filter(element => element.categoria.nombre === "Electrónica");
    return arrayProductosCategoriaElectronica;
        
}

obtenerProductosCategoriaElectronica(arrayProductos).forEach((element) => {
    console.log(`${element.nombre} ${element.categoria.nombre}`);
});

//3. Imprimir los detalles de los productos filtrados, incluyendo el nombre de la categoría y su descripción.

obtenerProductosCategoriaElectronica(arrayProductos).forEach((element) => {
    console.log(`${element.nombre} ${element.categoria.nombre} ${element.categoria.descripcion}`);
});