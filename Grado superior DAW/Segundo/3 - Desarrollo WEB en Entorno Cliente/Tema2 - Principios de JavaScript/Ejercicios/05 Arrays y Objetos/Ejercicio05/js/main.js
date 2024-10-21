/* 5. Realizar   programa   donde   el   usuario   introduce   una   palabra   y   devuelva   el   número   total   de   vocales
contenidas.Escribir por pantalla el resultado: “La palabra X tiene Y vocales”.
Utilizar la función forEach(PISTA: pasar de cadena a array.)*/

let entradaUsuario = prompt("Introduce un palabra").toLocaleLowerCase();
let aPalabra = entradaUsuario.split("");

console.log(aPalabra);

let vocalesPalabra = aPalabra.filter((persona) => persona == "a" || persona == "e" || persona == "i" || persona == "o" || persona == "u");

console.log(vocalesPalabra.length);