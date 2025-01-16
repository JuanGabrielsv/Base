/*
EJERCICIO20

De un operario se conoce su sueldo y los años de antigüedad. Se pide confeccionar un programa que lea los
datos de entrada e informe:

a) Si el sueldo es inferior a 500 y su antigüedad es igual o superior a 10 años, otorgarle un aumento del 20 
   %, mostrar el sueldo a pagar.
b) Si el sueldo es inferior a 500 pero su antigüedad es menor a 10 años, otorgarle un aumento de 5 %.
c) Si el sueldo es mayor o igual a 500 mostrar el sueldo en la página sin cambios.
*/

window.addEventListener("DOMContentLoaded", () => {
  function iniciarPrograma() {
    let sueldo = Number(prompt("Introduce el sueldo"));
    let anosAntiguedad = Number(prompt("Introduce los años de antiguedad: "));

    calcularSueldo(sueldo, anosAntiguedad);
  }

  function calcularSueldo(sueldo, anosAntiguedad) {
    if (sueldo < 500 && anosAntiguedad >= 10) {
      document.body.innerHTML = `El sueldo a pagar es de: ${sueldo * 1.2}`;
    }else if (sueldo < 500 && anosAntiguedad < 10) {
        document.body.innerHTML = `El sueldo a pagar es de: ${sueldo * 1.05}`;
    } else {
        document.body.innerHTML = `El sueldo a pagar es de: ${sueldo}`;
    }
  }

  iniciarPrograma();
});
