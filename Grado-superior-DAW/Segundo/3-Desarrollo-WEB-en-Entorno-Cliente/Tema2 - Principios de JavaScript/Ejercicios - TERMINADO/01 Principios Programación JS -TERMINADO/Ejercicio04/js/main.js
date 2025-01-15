//4. Crear una página tal que:
//a. Devuelva y muestre por consola la primera coincidencia de “Mundo” en la variable txt=”HolaMundo”;
let txt = "HolaMundo";
console.log(txt.indexOf("Mundo"));

//b. Sustituya la palabra ‘Mundo’ por ‘Universo’ y muestre por consola: “Hola Universo”
let nuevaPalabra = txt.replace("Mundo", "Universo");
console.log(nuevaPalabra);

//c. Muestre por consola el texto en mayúsculas
console.log(nuevaPalabra.toUpperCase());

//d. Muestre por consola el texto en minúsculas
console.log(nuevaPalabra.toLowerCase());

//e. Dadas dos cadenas una con vuestro nombre y otra con vuestro apellido, escribir por consola el nombre completo utilizando el operador de concatenación.
let nombre = "Juan Gabriel";
let apellidos = "Sánchez";
console.log(nombre + " " + apellidos);

//f. Dada la palabra Cliente, recuperar la subcadena Cli y escibirla por consola.
let usuario = "Cliente";
console.log(usuario.substring(0, 3));

//g. Dada la palabra Cliente, recuperar la subcadena ente y escibirla por consola.
console.log(usuario.substring(3));
