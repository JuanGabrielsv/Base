/* EJERCICIO 1
Realizar un programa que solicite el nombre y el año de nacimiento del usuario. Luego
imprimirá por consola esto:
“Hola [nombre], en el año 2030 tendrás [N] años.”
Donde:
 Nombre: es el nombre indicado por el usuario
 N: es el número de años que tendrá ese usuario en el año 2030 en base a su año de
nacimiento */

package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso1 {
	
	public static final Scanner SC = new Scanner(System.in);

	public static void main(String[] args) {
		
		String entradaNombre = "";
		String entradaNacimiento = "";
		
		System.out.println("Introduce tu nombre: ");
		entradaNombre = SC.nextLine();
		
		System.out.println("Introduce tu año de nacimiento: ");
		entradaNacimiento =SC.nextLine();

	}

}
