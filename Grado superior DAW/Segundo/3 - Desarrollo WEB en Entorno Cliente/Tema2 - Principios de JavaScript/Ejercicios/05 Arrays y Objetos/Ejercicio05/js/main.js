/* 5. Realizar   programa   donde   el   usuario   introduce   una   palabra   y   devuelva   el   número   total   de   vocales
contenidas.Escribir por pantalla el resultado: “La palabra X tiene Y vocales”.
Utilizar la función forEach(PISTA: pasar de cadena a array.)*/

let entradaUsuario = prompt("Introduce un palabra");
let minusculas = entradaUsuario.toLocaleLowerCase();
let aPalabra = minusculas.split("");

console.log(aPalabra);

let vocalesPalabra = aPalabra.filter((persona) => persona == "a" || persona == "e" || persona == "i" || persona == "o" || persona == "u");

document.body.innerHTML = `Tu palabra ${entradaUsuario} tiene ${vocalesPalabra.length} vocales`;