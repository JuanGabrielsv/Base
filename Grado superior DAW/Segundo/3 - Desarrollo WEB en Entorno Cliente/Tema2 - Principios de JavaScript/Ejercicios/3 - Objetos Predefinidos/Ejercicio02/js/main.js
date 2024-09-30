/* 2. Crear un programa que muestre por pantalla el número de días que quedan desde hoy hasta fin de curso (30
    de junio del año próximo).
    PISTA1: si restamos dos fechas nos da el resultado en milisegundos.
    PISTA2: ¿cómo pasamos de milisegundos a días?
    1 dia → 24 horas * 60minutos * 60segundos * 1000milisegundos. */
let fechaActual = new Date();
let fechaFinalCurso = new Date(2025, 5, 30);
let diasRestantes = ((((fechaFinalCurso - fechaActual) / 1000) / 60) / 60) / 24;

console.log(diasRestantes);