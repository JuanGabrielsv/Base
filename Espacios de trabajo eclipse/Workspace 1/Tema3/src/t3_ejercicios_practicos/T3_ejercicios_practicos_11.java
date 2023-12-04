/* EJERCICIO 11
Crea un array bidimensional de 5 x 10. Llénalo con todos los números del 1 al 50.
Después, una vez construido el array, en un método aparte, imprímelo de modo que en cada
línea aparezcan 10 números. 
*/
package t3_ejercicios_practicos;

public class T3_ejercicios_practicos_11 {

	public static void main(String[] args) {

		Integer[][] arrayMulti = new Integer[5][10];
		Integer contador = 1;

		for (int i = 0; i < arrayMulti.length; i++) {
			for (int j = 0; j < arrayMulti[i].length; j++) {
				arrayMulti[i][j] = contador;
				contador++;
			}
		}

		for (int i = 0; i < arrayMulti.length; i++) {
			for (int j = 0; j < arrayMulti[i].length; j++) {
				System.out.print(arrayMulti[i][j] + "\t");
			}
			System.out.println();
		}

	}

}
