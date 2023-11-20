/* EJERCICIO 5
Realizar un programa que muestre la suma de todos los números del 1 al 10000.
Es decir: 1 + 2 + 3 + 4 + 5 + … + 9999 + 10000 */

package tema2_ejerciciospracticos;




public class T2_Ejerciciospracticos_5 {

	public static void main(String[] args) {
		
		Integer suma = 0;
		
		for (int i = 0; i < 10000; i++) {
			System.out.println(suma += i);
		}
		
	}

}
