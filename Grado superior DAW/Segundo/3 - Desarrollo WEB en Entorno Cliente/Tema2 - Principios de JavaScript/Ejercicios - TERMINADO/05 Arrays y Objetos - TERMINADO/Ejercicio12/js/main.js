/*
EJERCICIO12. 
Tenemos un objeto que almacena los salarios de nuestro equipo:

    let salarios = {
        John: 100,
        Ann: 160,
        Peter: 130
    };

• Escribe el código para sumar todos los salarios y mostrar por pantalla el resultado de la suma. 
• En el ejemplo de arriba nos debería dar 390. 
• Si salarios está vacío entonces el resultado será 0.
*/

let salarios = {
    John: 100,
    Ann: 160,
    Laura: null,
    Peter: 130,
    Maria: null
};

let sumaSalarios = (objeto) => {
    let suma = 0;

    for (let key in objeto) {
        if(objeto[key] == null) {
            suma += 0;
        }
        suma += objeto[key]; 
    }

    return console.log(suma);
}

sumaSalarios(salarios);