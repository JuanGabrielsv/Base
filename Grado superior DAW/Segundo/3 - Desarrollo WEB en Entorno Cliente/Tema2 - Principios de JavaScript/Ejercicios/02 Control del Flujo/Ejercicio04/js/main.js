/*
EJERCICIO04.
Escribe un programa que solicite por pantalla un tipo de motor: los valores permitidos son 1,2,3 y 4
    1. Si el tipo de motor es 0, mostrar un mensaje indicando “No hay establecido un valor definido para el 
       tipo de bomba”.
    2. Si el tipo de motor es 1, mostrar un mensaje indicando “La bomba es una bomba de agua”.
    3. Si el tipo de motor es 2, mostrar un mensaje indicando “La bomba es una bomba de gasolina”.
    4. Si el tipo de motor es 3, mostrar un mensaje indicando “La bomba es una bomba de hormigón”.
    5. Si el tipo de motor es 4,mostrar un mensaje indicando “La bomba es una bomba de pasta alimenticia”.
    6. Si no se cumple ninguno de los valores anteriores mostrar el mensaje “No existe un valor valido para 
       tipo de bomba”.
*/

do {
  let entradaUsuario;
  entradaUsuario = prompt(
    "Introduce el tipo de motor:\n\n[1] Motor1\n[2] Motor2\n[3] Motor3\n[4] Motor4"
  ).trim();
  if (
    entradaUsuario !== "1" &&
    entradaUsuario !== "2" &&
    entradaUsuario !== "3" &&
    entradaUsuario !== "4"
  ) {
    alert(`La opción: "${entradaUsuario}" no es correcta`);
  } else {
    switch (entradaUsuario) {
      case "1":
        alert("La bomba es una bomba de agua");
        break;
      case "2":
        alert("La bomba es una bomba de gasolina");
        break;
      case "3":
        alert("La bomba es una bomba de hormigón");
        break;
      case "4":
        alert("La bomba es una bomba de pasta alimenticia");
        break;
      default:
        console.log("no");
    }
  }
  break;
} while (condition);
