/* 
EJERCICIO11.

• Crear una aplicación web en la que se pida el nombre, los apellidos, el salario (número con decimales) y la
  edad de una persona(un número entero). 
• Suponemos que los datos están correctamente.

La página indicará el nombre y apellidos, edad y el salario según lo siguiente:
  • Si el salario es mayor de 2000 euros, no cambiará  
  • Si el salario está entre 1000 y 2000:
      - Si es mayor de 45 años, se sube un 3%.
      - Si menor de 45 o igual, se sube un 10%
  • Si el salario es menor de 1000
      - Menores de 30 años cobrarán exactamente 1100 euros.      
      - Si la edad es de 30 a 45 años, el salario sube un 3%
      - A los mayores de 45 sube un 15%.
*/
function comenzarPrograma() {
  let nombre = prompt("Introduce sólo tu nombre: ");
  let apellidos = prompt("Introduce tus apellidos: ");
  let edad = prompt("Introduce tu edad: ");
  let salario = Number(prompt("Introduce tu salario"));

  if (salario > 2000) {
    document.body.innerHTML = `Nombre: ${nombre}<br>Apellidos: ${apellidos}<br>Edad: ${edad}<br>Salario: ${salario}€`;
  }

  if (salario >= 1000 && salario <= 2000) {
    if (edad > 45) {
      document.body.innerHTML = `Nombre: ${nombre}<br>Apellidos: ${apellidos}<br>Edad: ${edad}<br>Salario: ${
        salario * 1.03
      }€`;
    }
    if (edad <= 45) {
      document.body.innerHTML = `Nombre: ${nombre}<br>Apellidos: ${apellidos}<br>Edad: ${edad}<br>Salario: ${(
        salario * 1.1
      ).toFixed(2)}€`;
    }
  }

  if (salario < 1000) {
    if (edad < 30) {
      document.body.innerHTML = `Nombre: ${nombre}<br>Apellidos: ${apellidos}<br>Edad: ${edad}<br>Salario: 1100€`;
    }
    if (edad >= 30 && edad <= 45) {
      document.body.innerHTML = `Nombre: ${nombre}<br>Apellidos: ${apellidos}<br>Edad: ${edad}<br>Salario: ${(
        salario * 1.03
      ).toFixed(2)}€`;
    }
    if (edad > 45) {
      document.body.innerHTML = `Nombre: ${nombre}<br>Apellidos: ${apellidos}<br>Edad: ${edad}<br>Salario: ${(
        salario * 1.15
      ).toFixed(2)}€`;
    }
  }
}

comenzarPrograma();
