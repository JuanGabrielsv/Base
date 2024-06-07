/* 
11. Dados tres números introducidos por teclado, determinar el mayor y el menor.
*/

let num1 = Number;
let num2 = Number;
let num3 = Number;

num1 = prompt("Introduce el primer número: ");
num2 = prompt("Introduce el segundo número: ");
num3 = prompt("Introduce el tercer núero: ");

if (num1 >= num2 && num2 >= num3) {
    console.log("El mayor: " + num1 + "\nEl mediano: " + num2 + "\nEl menor: " + num3);
} else if (num1 >= num3 && num3 >= num2) {
    console.log("El mayor: " + num1 + "\nEl mediano: " + num3 + "\nEl menor: " + num2);
} else if (num2 >= num1 && num1 >= num3) {
    console.log("El mayor: " + num2 + "\nEl mediano: " + num1 + "\nEl menor: " + num3);
} else if (num2 >= num3 && num3 >= num1) {
    console.log("El mayor: " + num2 + "\nEl mediano: " + num3 + "\nEl menor: " + num1);
} else if (num3 >= num1 && num1 >= num2) {
    console.log("El mayor: " + num3 + "\nEl mediano: " + num1 + "\nEl menor: " + num2);
} else {
    console.log("El mayor: " + num3 + "\nEl mediano: " + num2 + "\nEl menor: " + num1);
}
