/* EJERCICIO 1
Realizar un programa que guarde en un array todos los números pares entre 1 y 30. Después,
mostrar el contenido del array por consola. */

package t3_Ejercicios_Prácticos;

public class T3_ejercicios_practicos_1 {
	 
	public static void main(String[]args) {
		
		Integer[] pares = new Integer[15];
		Integer contador = 2;
			 
		 for (int i = 0; i < pares.length; i++) {
			pares[i] = contador;
			contador = contador + 2;
			}
		 for (int i = 0; i < pares.length; i++) {
			System.out.print(pares[i] + " ");
		}		 
	 }
	
}
