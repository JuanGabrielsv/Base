/* 
EJERCICIO 25

• Realizar un programa que solicite al usuario su nombre completo. 
• Mostrarle por separado cuál es su nombre, su primer apellido y su segundo apellido. 
• Lo haremos separando por espacios en blanco (basta con que funcione con nombres y apellidos simples,
  por ejemplo, Abel Morillo Sánchez. No funcionaría con nombres como María del Carmen Ruiz
  de los Mozos Santos). 
*/

let check = Boolean;
let opcionMenuPrincipal;
let vNombreUsuario;
let vNombre;
let vPrimerApellido;
let vSegundoApellido;

do {
    opcionMenuPrincipal = prompt("Bienvenid@ al programa que te separa el nombre.\nElige una opción:\n\n(1) Iniciar el programa.\n(0) Salir.\n");
    if (opcionMenuPrincipal == 0) {
        check = false;        
    } else if (opcionMenuPrincipal == 1) {
        while (check) {
            vNombreUsuario = prompt("Introduce tu nombre completo, sin nombre compuesto:").trim();
            vNombre = vNombreUsuario.substring(0, vNombreUsuario.indexOf(" "));
            vPrimerApellido = vNombreUsuario.substring(vNombreUsuario.indexOf(" "), vNombreUsuario.lastIndexOf(" ")).trim();
            vSegundoApellido = vNombreUsuario.substring(vNombreUsuario.lastIndexOf(" ")).trim();
            alert("\nNOMBRE: " + vNombre + "\nPRIMER APELLIDO: " + vPrimerApellido + "\nSEGUNDO APELLIDO: " + vSegundoApellido + "\nTamaño nombre: "
                + vNombre.length + "\nTamaño primer apellido: " + vPrimerApellido.length + "\nTamaño segundo apellido: " + vSegundoApellido.length);
            check = confirm("¿Quieres introducir otro nombre?");
        }
        check = true;
    } else if (opcionMenuPrincipal != 1 && opcionMenuPrincipal !=0) {
        alert("ERROR - Lo que has introducido no corresponde con ninguna opción");        
    } else {
        alert("Algo no controlado ha pasado");
    }
} while (check);

alert("Programa finalizado");


