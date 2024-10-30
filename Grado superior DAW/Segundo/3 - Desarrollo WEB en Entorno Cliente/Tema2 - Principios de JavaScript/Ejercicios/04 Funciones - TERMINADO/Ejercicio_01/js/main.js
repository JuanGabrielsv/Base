/* 1. Crear una función que se llame cuadrado. Que reciba un parámetro y devuelva el cuadrado del número.
1. Con funciones tradicionales
2. Con función anónima
3. Con función flecha.
4. Invocar a las funciones con ejemplos */

//1. Con funciones tradicionales.
function cuadrado(numero) {
    return numero ** 2;
}

console.log(cuadrado(5));

//2. Con función anónima.
let cuadrado2 = function (numero = 0) {
    return numero ** 2;
}

console.log(cuadrado2(8));

//3. Con función flecha.
let funcionFlecha = (numero) => {
    return numero ** 2;
}

console.log(funcionFlecha(10));