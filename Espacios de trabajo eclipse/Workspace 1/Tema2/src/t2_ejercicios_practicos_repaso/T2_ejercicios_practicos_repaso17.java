/* 
EJERCICIO 17
Realizar un programa que solicite un número N al usuario. N tiene que ser mayor a 2. Si no,
volver a solicitarlo.
A continuación, mostrar los primeros N números de la serie de Fibonacci. Esta serie se calcula
sumando los dos últimos números. Por ejemplo, los 13 primeros números de Fibonacci son:
0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144
 */
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso17 {

	public static void main(String[] args) {
		
		/*Scanner sc = new Scanner(System.in);		
		Integer entradaUsuario = 0;
		Integer suma = 0;
		
		do {
			System.out.println("Introduce un número entero: ");
			entradaUsuario = sc.nextInt();
		}
		while(entradaUsuario <= 2);		
		
		for (int i = 0; i <= entradaUsuario; i++) {
			System.out.print((suma = entradaUsuario + suma) + " ");						
		}*/
		
		Scanner scanner = new Scanner(System.in);
		Integer numeroSerie = 0;
		Integer anterior = 0;
		Integer ultimo = 1;
		Integer nuevoValor;
		
		do {
			System.out.println("Dame un nmero mayor a 2");
			numeroSerie = scanner.nextInt();
		}
		while(numeroSerie <= 2);
		System.out.print("La serie de fibonacci del nmero "+ numeroSerie + " es: ");
		System.out.print(anterior + ", " + ultimo);
		for(int serie=2;serie<numeroSerie;serie++)
		{
			nuevoValor = anterior + ultimo;
			anterior = ultimo;
			ultimo = nuevoValor;
			System.out.print( ", " + nuevoValor);
			
		}
		
		scanner.close();

		
		
		
	}

}
