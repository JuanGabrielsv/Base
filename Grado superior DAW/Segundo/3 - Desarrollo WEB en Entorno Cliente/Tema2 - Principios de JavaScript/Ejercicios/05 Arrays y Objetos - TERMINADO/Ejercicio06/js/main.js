/* Ejercicio06. Dado un array con los 7 días de la semana.
1. mostrar por pantalla la longitud de cada palabra, así como el día de la semana más largo. 
• Escribir un fichero js externo para javascript. Usar forEach */

const aDiasSemana = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"];
let palabraMasGrande = "0";

//1. mostrar por pantalla la longitud de cada palabra, así como el día de la semana más largo. 

aDiasSemana.forEach(element => {

    document.body.innerHTML += `${element} tiene: ${element.length} letras<br>`;
    if (element.length > palabraMasGrande.length) {
        palabraMasGrande = element;
    }
});

document.body.innerHTML += `<br>La palabra mas grande es: ${palabraMasGrande} con ${palabraMasGrande.length} letras.`;
console.log(aDiasSemana);

