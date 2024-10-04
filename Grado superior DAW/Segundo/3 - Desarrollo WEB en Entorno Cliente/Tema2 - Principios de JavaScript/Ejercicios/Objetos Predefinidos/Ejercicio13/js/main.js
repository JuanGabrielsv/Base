/* 13. Crea un programa que pida al usuario su nombre y apellidos (de una vez) y muestre por pantalla:
● El tamaño del nombre mas los apellidos( sin contar espacios)
● La cadena en minúsculas y en mayúsculas
● Que divida el nombre y los apellidos y los muestre en 3 líneas
● Que devuelva una cadena compuesta por la inicial del nombre, el primer apellido y la
inicial del segundo apellido. EJ: Para Belén Tudó Ramírez→ btudor
● Que devuelva una cadena compuesta por las tres primeras letras del nombre y de los
dos apellidos. EJ: beltudram */

let vEntradaUsuario = prompt("Introduce tu nombre y apellidos:");
let aNombreApellidos = vEntradaUsuario.split(" ");
let vNombre = aNombreApellidos[0];
let vPrimerApellido = aNombreApellidos[1];
let vSegundoApellido = aNombreApellidos[2];
let vCadenaEntera = aNombreApellidos[0] + aNombreApellidos[1] + aNombreApellidos[2];
let vTamano = vCadenaEntera.length;
let vIniciales = vNombre.substring(0, 1) + vPrimerApellido + vSegundoApellido.substring(0, 1);
let vInicialesTres = vNombre.substring(0, 3) + vPrimerApellido.substring(0, 3) + vSegundoApellido.substring(0, 3);

document.write(vCadenaEntera);
document.write('<br>' + vTamano);
document.write('<br>' + vEntradaUsuario.toUpperCase());
document.write('<br>' + vEntradaUsuario.toLowerCase());
document.write('<br>' + vNombre + `<br>` + vPrimerApellido + `<br>` + vSegundoApellido);
document.write('<br>' + vIniciales);
document.write('<br>' + vInicialesTres);