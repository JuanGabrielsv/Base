/* EJERCICIO 5
Realizar un programa que muestre por consola todos los números del 1 al 20 en una única
línea de este modo:
1_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_17_18_19_20
(Utilizar un bucle) */
package t2_ejercicios_practicos_repaso;

public class T2_ejercicios_practicos_repaso5 {

	public static void main(String[] args) {
		
		for (int i = 1; i <= 20; i++) {
			if (i==20) {
				System.out.print(i);
			}
			else {
				System.out.print(i + "_");
			}		
		}
		
	}

}
