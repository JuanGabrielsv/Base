##Ejercicio 1.
Crear una aplicación utilizando Spring Boot (incluye la dependencia Spring Web) que
permita a los usuarios verificar si una palabra ingresada es un palíndromo o no. Es decir, que se lee
igual de derecha a izquierda o de izquierda a derecha, por ejemplo: radar es palíndroma.
Crear un paquete controller con una clase java PalindromoController.
El endpoint será GET: validar-palindromo/’palabra’ ,donde ‘palabra’ es un parámetro que se pasa
por URL.
Debe devolver un mensaje indicando si la palabra es un palíndromo o no. Nombra adecuadamente
tus clases y métodos. Puedes comentar código cuando sea necesario.
Ejemplo de llamada:
localhost:8080/validar-palindromo/radar → La palabra radar es un palíndromo
localhost:8080/validar-palindromo/hola → La palabra hola no es un palíndromo