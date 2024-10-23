/*
EJERCICIO15. 
• Tienes un array de objetos que representan estudiantes. 
• Cada objeto de estudiante tiene un nombre y un array de calificaciones. 
• Utiliza las funciones de arrays para realizar las siguientes tareas:    
    1. Para cada estudiante, calcular su media. 
       Debe devolver un array con objetos con el nombre y la media. Imprimir.
    2. Del array obtenido en el punto 1, filtrar los estudiantes que tienen un promedio superior a 7.
    3. Imprimir el nombre de los estudiantes que cumplen con el criterio de promedio anterior.
*/

let arrayEstudiantes = [
    { nombre: "nombre1", arrayCalificaciones: [5, 0, 10, 8, 1] },
    { nombre: "nombre2", arrayCalificaciones: [3, 10, 9, 2, 2] },
    { nombre: "nombre3", arrayCalificaciones: [8, 6, 10, 5, 3] },
    { nombre: "nombre4", arrayCalificaciones: [10, 8, 8, 8, 4] },
    { nombre: "nombre5", arrayCalificaciones: [7, 5, 10, 9, 5] }
]

// 1. Para cada estudiante, calcular su media. Debe devolver un array con objetos con el nombre y la media. Imprimir.
function mediaCalificacionesEstudiante(arrayParametro) {

    let arrayMediaEstudiante = arrayParametro.map(estudiante => {
        let suma = 0;
        let media = 0;
        for (let i = 0; i < estudiante.arrayCalificaciones.length; i++) {
            suma += estudiante.arrayCalificaciones[i];
        }
        media = suma / estudiante.arrayCalificaciones.length;
        return {
            nombre: `${estudiante.nombre}`,
            mediaNotas: `${media}`
        }
    })

    return arrayMediaEstudiante;
}

console.log(mediaCalificacionesEstudiante(arrayEstudiantes));

//2. Del array obtenido en el punto 1, filtrar los estudiantes que tienen un promedio superior a 7.
function mediaSuperior7Estudiante(arrayParametro) {
    const arrayEstudiantesMediaSuperior7 = mediaCalificacionesEstudiante(arrayParametro).filter(estudiante => estudiante.mediaNotas > 7);
    return arrayEstudiantesMediaSuperior7;
}

//3. Imprimir el nombre de los estudiantes que cumplen con el criterio de promedio anterior.
mediaSuperior7Estudiante(arrayEstudiantes).forEach(element => {
    console.log(element.nombre);
});;
