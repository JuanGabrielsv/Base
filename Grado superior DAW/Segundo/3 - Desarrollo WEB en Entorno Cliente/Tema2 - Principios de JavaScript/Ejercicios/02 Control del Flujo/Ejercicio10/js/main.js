/*
EJERCICIO10. 
Sacar por pantalla utilizando bucles:

54321
4321
321
21
1

*/

function imprimirTrianguloNumeros() {
  for (let i = 5; i > 0; i--) {
    for(let j = i; j > 0; j--){
        document.body.innerHTML += j;
    }
    document.body.innerHTML += `<br>`;
    
  }
}

imprimirTrianguloNumeros();


