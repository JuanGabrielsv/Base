/*
EJERCICIO14

• Dado un array de objetos de libros, donde cada libro tiene un título y un número de páginas.
• Obtener los libros que tienen más de 300 páginas. 
• Luego, extraer solo los títulos de estos libros. 
• Finalmente, imprimir los títulos en la consola
*/

let arrayLibros = [
    { titulo: "Titulo1", numeroDePaginas: 278 },
    { titulo: "Titulo2", numeroDePaginas: 324 },
    { titulo: "Titulo3", numeroDePaginas: 654 },
    { titulo: "Titulo4", numeroDePaginas: 123 },
    { titulo: "Titulo5", numeroDePaginas: 78 }
];

function obtenerLibrosConMasDe300Paginas(aLibros){
    const arrayLibrosConMasDe300Paginas = arrayLibros.filter(arrayLibros => arrayLibros.numeroDePaginas > 300);
    const arrayTituloLibrosConMasDe300Paginas = arrayLibrosConMasDe300Paginas.map(libro => libro.titulo);

    for(let libro in arrayTituloLibrosConMasDe300Paginas){
        console.log(arrayTituloLibrosConMasDe300Paginas[libro]);
    }
}

obtenerLibrosConMasDe300Paginas(arrayLibros);

