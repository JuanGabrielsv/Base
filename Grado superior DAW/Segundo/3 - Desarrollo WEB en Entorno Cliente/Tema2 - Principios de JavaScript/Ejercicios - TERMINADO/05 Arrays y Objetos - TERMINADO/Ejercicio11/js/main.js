/*
EJERCICIO11.

    • Tienes un array de objetos que representan productos en un inventario. 
    • Cada objeto tiene las propiedades:
        
        nombre, cantidad y precio. 

    • Crear un nuevo array de objetos que contenga el nombre del producto y el valor total en stock (cantidad * precio , de  cada producto.).
    • Imprimir el nombre del producto y el valor total en la consola con dos decimales
*/

const arrayInvetario = [
    {nombre: "Objeto1", cantidad: 34, precio: 9.99},
    {nombre: "Objeto2", cantidad: 3, precio: 5.59},
    {nombre: "Objeto3", cantidad: 122, precio: 7.85}
]

const arrayValorTotal = arrayInvetario.map(element => {
    return {
        nombre: element.nombre,
        valorTotal: (element.cantidad * element.precio).toFixed(2)
    };
});

arrayValorTotal.forEach(element => {
    console.log(`Nombre: ${element.nombre} Valor total: ${element.valorTotal}€`);
});

