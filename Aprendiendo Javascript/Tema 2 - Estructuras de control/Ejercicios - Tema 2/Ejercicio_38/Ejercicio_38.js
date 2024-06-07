/* 
EJERCICIO 38

Realizar un programa que muestre por consola todos los números del 1 al 20 en una única
línea de este modo:

1_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_17_18_19_20

(Utilizar un bucle)
*/

const VEINTE = 20;

let vMensaje ='';


for (let i = 1; i <= VEINTE; i++) {

        if (i === 20) {
            vMensaje += i;

        } else {
            vMensaje += i + "_"
        }    
    
}

alert(vMensaje);