/* EJERCICIO 19
Repetir el ejercicio 3 utilizando una estructura SWITCH. */

/* EJERCICIO 3
Realizar un programa que calcule el IVA de un producto. Para ello tendremos que solicitar dos
datos al usuario: el precio sin IVA y el tipo de IVA. El tipo de IVA puede ser de cuatro tipos:
 Normal: 21%
 Reducido: 10%
 Superreducido: 4%
 Exento: 0%  */

package t2_ejercicios_practicos;

import java.util.Scanner;

public class T2_ejercicios_practicos19 {
	
	public static final Double NORMAL = 1.21;
	public static final Double REDUCIDO = 1.10;
	public static final Double SUPERREDUCIDO = 1.04;
	public static final Double EXENTO = 0.0;

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Double precio;
		Integer entradaUsuario;
		
		System.out.println("Introduce el precio: ");
		precio = sc.nextDouble();
		
		System.out.println();
		System.out.println("Introduce el número de Opción: ");
		System.out.println();
		System.out.println("1 - Normal: 21% ");
		System.out.println("2 - Reducido: 10% ");
		System.out.println("3 - Superreducido: 4% ");
		System.out.println("4 - Exento: 0% ");
		entradaUsuario = sc.nextInt();
		
		switch (entradaUsuario) {
		case 1:
			System.out.println(precio * NORMAL);
			break;
		case 2:
			System.out.println(precio * REDUCIDO);
			break;
		case 3:
			System.out.println(precio * SUPERREDUCIDO);
			break;
		case 4:
			System.out.println(precio);
			break;
		}
		
		sc.close();
		
	}

}
