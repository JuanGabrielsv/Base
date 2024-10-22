/* EJERCICIO08. 
Crear una función flecha, que reciba un array y que se escriba por pantalla dos arrays:   
• uno con los números pares y otro con los impares. 

• Realizar las siguientes comprobaciones: 
    - que se reciba un array, que no esté vacío y que sólo contenga números.

Llamar a la función con  [1,3,2,5,7,4], [], [1,”3”,2] , “pepe”. */

const arrayNumeros1 = [1, 3, 2, 5, 7, 4];
const arrayNumeros2 = [];
const arrayNumeros3 = [1, "3", 2];
const arrayNumeros4 = ["pepe"];


let iniciarPrograma = (array) => {

    //MURO DE VALIDACIONES A PASAR.
    if (array instanceof Array == false) {
        return console.log(array + " No es Array");
    } else if (array.length == 0) {
        return console.log("El array está vacio");
    }

    array.forEach(element => {
        if (typeof (element) !== "number") {
            return console.log("La array no es 100% de datos tipo Number");
        }
    });

    //SI EL MURO SE HA PASADO SE EJECUTA LAS ACCIONES QUE SE PIDE A LA FUNCIÓN.
    let arrayNumeroPares = [];
    let arrayNumeroImpares = [];

    array.forEach(element => {
        if(element % 2 == 0) {
            arrayNumeroPares.push(element);
        } else {
            arrayNumeroImpares.push(element);
        }        
    });

    return document.body.innerHTML += `array de pares: ${arrayNumeroPares}<br>`;
    

}


iniciarPrograma(arrayNumeros1);
iniciarPrograma(arrayNumeros2);
iniciarPrograma(arrayNumeros3);
iniciarPrograma(arrayNumeros4);

/*console.log(arrayNumeros.forEach(element => {
    console.log(typeof (element));
}));*/





