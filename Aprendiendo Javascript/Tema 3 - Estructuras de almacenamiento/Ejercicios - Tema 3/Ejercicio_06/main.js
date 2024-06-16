/*
EJERCICIO 06

1. Crea un array de un tamaño que sea indicado por el usuario (lo solicitaremos primero). 
2. El tamaño tendrá que ser mayor a 2.
3. Llena el array con la serie de Fibonacci. 
    - Las dos primeras posiciones del array las puedes llenar a mano con un 0 y un 1 respectivamente. 
    - El resto de posiciones hasta completar el tamaño del array, las debes llenar con un bucle que vaya calculando el valor de la
      posición i a partir del valor de las posiciones anteriores.
4. Imprime el contenido del array para mostrarlo al usuario. 
*/

let tamanoArray;
let vNumeroAnterior = 0;
let vUltimoNumero = 1;
let vNuevoValor;

do {
    tamanoArray = prompt("Indica el tamaño del array:");
    if (tamanoArray !== null && tamanoArray !== "" && !isNaN(tamanoArray) && !tamanoArray.includes(" ") && tamanoArray > 2) {        
    } else {        
        alert("Los datos introducidos no son correctos");
    }
} while (tamanoArray === null || tamanoArray === "" || isNaN(tamanoArray) || tamanoArray.includes(" ") || tamanoArray <= 2);

const arrayFibo = new Array();

arrayFibo.push(0, 1);

for (let i = 2; i < tamanoArray; i++) {
    vNuevoValor = vNumeroAnterior + vUltimoNumero;
    arrayFibo.push(vNuevoValor);
    vNumeroAnterior = vUltimoNumero;
    vUltimoNumero = vNuevoValor;
}

console.log(arrayFibo);
