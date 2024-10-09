/* 3. Escribir en una página web 500 números aleatorios del 1 al 10.000 y que al lado diga si es
par o no. Hacer una función flecha que dado un número devuelva “par” si es par o “impar” si es impar. */

let funcionFlechaImparPar = () => {
    for (let i = 0; i < 500; i++) {
        let aleatorio = Math.floor(Math.random() * (10000 - 1 + 1) + 1);
        if (aleatorio % 2 == 0) {
            console.log(aleatorio + " es par");
        } else {
            console.log(aleatorio + " es impar");
        }
    }
}

funcionFlechaImparPar();