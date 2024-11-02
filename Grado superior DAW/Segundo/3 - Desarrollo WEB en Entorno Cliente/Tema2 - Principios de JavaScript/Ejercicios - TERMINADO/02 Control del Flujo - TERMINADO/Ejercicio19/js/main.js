/*
EJERCICIO19

Se ingresan por teclado tres números, si al menos uno de los valores ingresados es menor a 10, imprimir en 
la página la leyenda ‘Alguno de los números es menor a diez’
*/

window.addEventListener("DOMContentLoaded", () => {

function iniciarPrograma() {

  let numero1 = Number(prompt("Introduce el primer número: "));
  let numero2 = Number(prompt("Introduce el segundo número: "));
  let numero3 = Number(prompt("Introduce el tercer número: "));

  comprobarNumeros(numero1, numero2, numero3);

}

function comprobarNumeros(parametro1, parametro2, parametro3){

  if(parametro1 < 10 || parametro2 < 10 || parametro3 < 10 ){
    document.body.innerHTML = `Alguno de los números es menor a diez`;
  } else {
    document.body.innerHTML = `Todos los números son mayores a diez`;
  }

}

iniciarPrograma();

});
