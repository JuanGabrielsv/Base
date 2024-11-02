
// SABER SI UN AÑO ES BISIESTO, DEVUELVE UN BOOLEAN.
function anoBisiesto(parametroAno) {
    return (parametroAno % 400 == 0 || parametroAno % 4 == 0 && parametroAno % 100 != 0);
}