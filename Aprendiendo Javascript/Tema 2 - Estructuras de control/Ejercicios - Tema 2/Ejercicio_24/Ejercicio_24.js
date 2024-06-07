/* 
EJERCICIO 24

Repetir el ejercicio anterior, pero con cadenas. Además, cuando comparemos si son iguales, no
tendremos en cuenta ni los espacios que pueda haber al inicio o al final de cada cadena, ni
tampoco las mayúsculas o minúsculas. 
*/

let check = Boolean;
let cadena1;
let cadena2;
let opcionMenuPrincipal;

do {
      opcionMenuPrincipal = String(prompt("Bienvenido al programa que te compara cadenas...\nIntroduce la opción:\n\n(1) Comparar cadenas\n(0) Salir\n"));      
            if (opcionMenuPrincipal === "0") {
                  check = false;
            } else if(opcionMenuPrincipal === "1") {
                  while(check) {
                        cadena1 = String(prompt("Introduce la PRIMERA cadena")).trim().toLowerCase(); 
                        cadena2 = String(prompt("Introduce la SEGUNDA cadena")).trim().toLowerCase();
                        if (cadena1 === cadena2) {
                              alert("Las cadenas son iguales");
                              check = false;
                        } else {
                              alert("Las cadenas no son iguales");                              
                        }       
                  }     
            } else {
                  alert("ERROR - Lo que has introducido no se corresponde a ninguna opción\nVALOR INTRODUCIDO --> " + opcionMenuPrincipal);                  
            }      
} while (check);
alert("Programa cerrado");


