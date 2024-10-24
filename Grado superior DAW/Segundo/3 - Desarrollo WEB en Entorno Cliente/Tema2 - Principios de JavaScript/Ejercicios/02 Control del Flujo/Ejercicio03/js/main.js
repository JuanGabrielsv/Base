/*3. Escribe un programa que pida por mensaje prompt un tipo de topping para comprar un helado. Los valores 
serán: oreo/kitkat/brownie/lacasitos
Se tendrá que mostrar por pantalla el precio del helado de forma que:
1. El helado sin topping cuesta 1.90€.
2. El topping de oreo cuesta 1€.
3. El topping de kitkat cuesta 1.50€.
4. El topping de brownie cuesta 0.75€.
5. El topping de lacasitos cuesta 0.95€.
6. En caso de no disponer del topping solicitado por el usuario el programa escribirá por pantalla “No 
tenemos este topping, lo sentimos” y a continuación informar del precio del helado sin ningun topping.
7. Si tiene el topping, el programa escribe por consola el precio del helado con el topping seleccionado.*/

const OREO = "oreo";
const KITKAT = "kitkat";
const BROWNIE = "brownie";
const LACASITOS = "lacasitos";
const PRECIOOREO = 1;
const PRECIOKITKAT = 1.50;
const PRECIOBROWNIE = 0.75;
const PRECIOLACASITOS = 0.95;
const PRECIOHELADO = 1.90;

let toppingUsuario = prompt("¿Qué topping quieres?").toLowerCase();

if (toppingUsuario === OREO) {
    document.write(`El precio del helado es de ${PRECIOHELADO + PRECIOOREO}€`);
} else if (toppingUsuario === KITKAT) {
    document.write(`El precio del helado es de ${PRECIOHELADO + PRECIOKITKAT}€`);
} else if (toppingUsuario === BROWNIE) {
    document.write(`El precio del helado es de ${PRECIOHELADO + PRECIOBROWNIE}€`);
} else if (toppingUsuario === LACASITOS) {
    document.write(`El precio del helado es de ${(PRECIOHELADO + PRECIOLACASITOS).toFixed(2)}€`);
} else {
    document.write(`Ningún topping seleccionado, el precio es de ${PRECIOHELADO}€`);
}