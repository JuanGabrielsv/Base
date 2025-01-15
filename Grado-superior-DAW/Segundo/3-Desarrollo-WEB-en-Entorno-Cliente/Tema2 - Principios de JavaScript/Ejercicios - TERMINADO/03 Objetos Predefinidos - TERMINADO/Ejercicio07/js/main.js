/* 7. Escribir por pantalla los dos últimos dígitos del año de un objeto de tipo Date ( por ejemplo de la fecha 
actual). */
let fechaActual = String(new Date().getFullYear());

let anoDosDigitos = fechaActual.substring(2);

document.write(anoDosDigitos);

