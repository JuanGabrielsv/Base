/* EJERCICIO 15
Repetir el ejercicio anterior con una estructura FOR. */

/* EJERCICIO 14
Realiza un programa que solicite un número entero al usuario y muestre su tabla de multiplicar
completa del 0 al 10 por consola. Por ejemplo, si indicamos el número 3, el programa debería
imprimir:
3 x 0 = 0
3 x 1 = 3
3 x 2 = 6
3 x 3 = 9
3 x 4 = 12
3 x 5 = 15
3 x 6 = 18
3 x 7 = 21
3 x 8 = 24
3 x 9 = 27
3 x 10 = 30 */

package t2_ejercicios_practicos;

import java.util.Scanner;

public class T2_ejercicios_practicos15 {
	
	public static final Scanner SC = new Scanner(System.in);

	public static void main(String[] args) {
		
		Integer entradaUsuario = 0;
				
		System.out.println("Introduce un número y te daré su tabla de multiplicar: ");
		entradaUsuario = SC.nextInt();
		
		for (int i = 0; i <= 10; i++) {
			System.out.println(entradaUsuario + " x " + i + " = " + (entradaUsuario * i) );
		}
		
		SC.close();
	}

}