/* 3. Escribe un programa que pida por mensaje prompt un tipo de topping para comprar un helado. Los valores
serán: oreo/kitkat/brownie/lacasitos
Se tendrá que mostrar por pantalla el precio del helado de forma que:
1. El helado sin topping cuesta 1.90€.
2. El topping de oreo cuesta 1€.
3. El topping de kitkat cuesta 1.50€.
4. El topping de brownie cuesta 0.75€.
5. El topping de lacasitos cuesta 0.95€.
6. En caso de no disponer del topping solicitado por el usuario el programa escribirá por pantalla “No
tenemos este topping, lo sentimos” y a continuación informar del precio del helado sin ningun topping.
7. Si tiene el topping, el programa escribe por consola el precio del helado con el topping seleccionado */

let check;
let entradaUsuario = "";

do {
  entradaUsuario = prompt("¿Qué topping quieres?");
  if (entradaUsuario == "oreo") {
    document.write(`El topping de oreo cuesta 1€`);
    check = true;
  } else if (entradaUsuario == "kitkat") {
    document.write(`El topping de kitkat cuesta 1.50€`);
    check = true;
  } else if (entradaUsuario == "brownie") {
    document.write(`El topping de brownie cuesta 0.75€`);
    check = true;
  } else if (entradaUsuario == "lacasitos") {
    document.write(`El topping de lacasitos cuesta 0.95€`);
    check = true;
  } else if (entradaUsuario == "sin topping") {
    document.write(`El helado sin topping cuesta 1.90€`);
    check = true;
  } else {
    document.write(`No tenemos este topping, lo sentimos`);
    check = false;
  }
} while (check == false);
