/* 
EJERCICIO 48

Realiza un programa que sea un juego de adivinanza. 
El programa generará de manera aleatoria un número del 0 al 9. 
Le preguntará al usuario que intente averiguarlo. 
Si no lo consigue, seguirá preguntando hasta que lo haga. 
Cuando el usuario adivine el número, el programa terminará mostrando la puntuación obtenida. 
La puntuación se obtiene restando a 10 el número de intentos que el usuario a necesitado. 
*/


let vNumeroRandom;
let vNumeroUsuario;
let vPuntuacion = 10;

vNumeroRandom = Math.floor(Math.random() * 10);
alert("Número aleatorio en el 0 y 9 generado correctamente");
while (vNumeroRandom != vNumeroUsuario) {
    
    vNumeroUsuario = prompt('Introduce un número del 0 al 9, para intentar averiguar que número salió.');
    console.log(typeof(vNumeroRandom));
    console.log(typeof(vNumeroUsuario));

    if (vNumeroUsuario == vNumeroRandom) {        
        alert('Acertaste puntuación restante total ' + vPuntuacion);
    } else {
        vPuntuacion--;
        alert('No has acertado el número, te quedan ' + vPuntuacion + ' puntos');        
    }
}
console.log(vNumeroRandom);