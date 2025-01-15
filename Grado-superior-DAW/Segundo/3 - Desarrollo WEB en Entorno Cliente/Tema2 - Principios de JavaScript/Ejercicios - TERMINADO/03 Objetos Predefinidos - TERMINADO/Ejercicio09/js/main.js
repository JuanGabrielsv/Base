/* 9. Crea un programa que genere un número aleatorio entre 1 y 10 (incluido). Luego, pide al usuario que 
intente adivinar el número utilizando un cuadro de diálogo (prompt). Si el usuario adivina correctamente, 
muestra una alerta con el mensaje "¡Felicidades, adivinaste el número!". Si no adivina, muestra una alerta 
diciendo "Lo siento, el número era [número]". */

let ramdon = parseInt(Math.random() * (10 - 1 + 1) + 1);

let entradaUsuario = Number(prompt("Introduce un número del 1 al 10 para adivinar el número:"));

if (entradaUsuario === ramdon) {
    alert("¡Felicidades, adivinaste el número!");
} else {
    alert("Lo siento, el número era el: " + ramdon);
}