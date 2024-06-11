export function tirarDado() {
    return Math.floor(Math.random() * 6) + 1;
}


/* GENERA NÚMERO RANDOM ENTRE DOS NÚMEROS QUE LE PASEMOS */
export function generarNumeroRandomEntreDosNumeros(min, max) {
    if (min > max) {
        let nuevoMin = min;
        min = max;
        max = nuevoMin;
    }
    return Math.floor(Math.random() * (Number(max) - Number(min) + 1)) + Number(min);
}