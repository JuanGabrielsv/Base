/* GENERA NÚMERO RANDOM ENTRE 1 Y 6 */
export function tirarDado() {
    return Math.floor(Math.random() * 6) + 1;
}


/* GENERA NÚMERO RANDOM ENTRE DOS NÚMEROS QUE LE PASEMOS */
export function numeroRandomEntreDosNumeros(min, max) {
    if (min > max) {
        let nuevoMin = min;
        min = max;
        max = nuevoMin;
    }
    return Math.floor(Math.random() * (Number(max) - Number(min) + 1)) + Number(min);
}

/* REALIZA UNA COPIA DE UN ARRAY, PERO NO SABEMOS SI LO HACE PROFUNDAMENTE O SUPERFICIAL */
export function copiarArray(original) {
    const arrayCopia = new Array();
    for (let i = 0; i < original.length; i++) {
        arrayCopia.push(original[i]);
    }
    return arrayCopia;
}