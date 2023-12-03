/* EJERCICIO 24
Realizar un programa que solicite un número mayor a 0 al usuario. Si no es así, volver a
solicitarlo. A continuación, calcular la suma de todos los números impares que hay entre 1 y el
número indicado. Mostrarlo por consola.
(Un número impar es aquel que al dividirlo entre 2 el resto es 1) 
*/
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso24 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario = 0;
		Boolean check = true;
		Integer numero = 0;
		
		do {
			System.out.println("Introduce un número entero mayor que '0': ");
			entradaUsuario = sc.nextInt();
			
			if (entradaUsuario <= 0) {
				System.err.println("ERROR - EL NÚMERO DEBE SER MAYOR QUE '0'");
			} else {
				check = false;
			}
		} while (check);
		
		for (int i = 1; i <= entradaUsuario; i++) {
			
			numero = i % 2;
			
			if (numero != 0) {
				System.out.println(numero);
			}			
		}


	}

}
