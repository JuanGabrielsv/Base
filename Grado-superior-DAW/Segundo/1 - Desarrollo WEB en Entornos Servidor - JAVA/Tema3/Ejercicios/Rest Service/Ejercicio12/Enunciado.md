# Ejercicio 12. 

Crear una aplicación que gestione una lista de libros. Los endpoints permitirán realizar
las siguientes operaciones CRUD (Crear, Leer, Actualizar y Eliminar):

1 Mostrar todos los libros
2 Consultar un libro por su título
3 Crear un nuevo libro
4 Modificar la información de un libro de manera parcial.
4.1 Modificar la información de un libro de manera total.
5 Eliminar un libro por su ID
6 ObtenerNovelas: Devuelve una lista de los libros cuyo genero sea novela.
7 ObtenerPorGenero: Dado un atributo género que se pasa por URL, devolver el listado de libros que sean de dicho género.
8 ObtenerAutoresConMasDeXLibros: devuelve un mapa de <String,Integer>, donde la clave
  es el autor, y la clave el numero de libros que ha escrito a partir del atributo  numLibro que se pasará por la URL.
9 Los libros tendrán los siguientes atributos: id, titulo, autor, editorial, isbn, añoPublicacion y géneros. Donde géneros es una lista de String