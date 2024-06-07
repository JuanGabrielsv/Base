/* 
EJERCICIO 19

Realizar un programa que calcule el IVA de un producto. Para ello tendremos que solicitar dos
datos al usuario: 
el precio sin IVA y el tipo de IVA. El tipo de IVA puede ser de cuatro tipos:

      • Normal: 21%
      • Reducido: 10%
      • Superreducido: 4%
      • Exento: 0%  
*/
const NORMAL = Number(1.21);
const REDUCIDO = Number(1.10);
const SUPERREDUCIDO = Number(1.04);
const EXENTO = Number(0);

let check = Boolean(true);
let entradaUsuario;
let precioSinIva;
let opcionTipoIva;

do {
      entradaUsuario = Number(prompt("Bienvenido al calculador de IVA, por favor elije una opción:\n\n(1) Introducir el precio\n(0) Salir del programa\n"));
      if (entradaUsuario === 1) {
            precioSinIva = Number(prompt("Introduce el precio sin IVA por favor: "));            
            do {  
                  check = true;          
                  opcionTipoIva = Number(prompt("Elige el tipo de IVA que quieres:\n\n(1) Normal: 21%\n(2) Reducido: 10%\n(3) Superreducido: 4%\n(4) Exento\n\n(0) Menú Principal\n"));                  
                  if (opcionTipoIva === 1) {
                        let resultado = precioSinIva * NORMAL;
                        alert("El precio con el 21% de IVA es de: " + resultado + "€");
                        check = confirm("¿Quieres volver aplicarle otro tipo de IVA?")                                                
                  } else if (opcionTipoIva === 2) {
                        let resultado = precioSinIva * REDUCIDO;
                        alert("El precio con el 10% de IVA es de: " + resultado + "€");
                        check = confirm("¿Quieres volver aplicarle otro tipo de IVA?")                                               
                  } else if (opcionTipoIva === 3) {
                        let resultado = precioSinIva * SUPERREDUCIDO;
                        alert("El precio con el 4% de IVA es de: " + resultado + "€");
                        check = confirm("¿Quieres volver aplicarle otro tipo de IVA?")                                                
                  } else if (opcionTipoIva === 4) {                        
                        alert("El precio esta exento de IVA");
                        check = confirm("¿Quieres volver aplicarle otro tipo de IVA?")                                                
                  } else if (opcionTipoIva === 0) {
                        check = false;
                  } else {
                        alert("Has introducido un número que no coincide con las opciones... Elige una opción válida");                        
                  }                  
            } while (check);
            check = true;
      } else if (entradaUsuario === 0) {
            check = confirm("¿Seguro que quieres salir del programa?");
            if (check === false) {
                  check = true;
            } else {
                  check = false;
            }
      } else {
            alert("Has introducido una opción que no coincide con las opciones...Elige una opción válida")
      }
} while (check);