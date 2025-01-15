/* EJERCICIO 2
Realizar un programa que solicite tres nombres de ciudades al usuario. Después, imprimir por
consola esos nombres ordenados según la longitud de cada nombre. Es decir, el que tenga
menos letras saldrá primero, luego el segundo que tenga menos letras, y por último el más
largo (el que tenga más letras). Si el usuario, por ejemplo, nos indicara estas ciudades:
Zaragoza, Vigo, Madrid
Deberíamos imprimir:
Vigo
Madrid
Zaragoza */ 

package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso2 {
	
	public static final Scanner SC = new Scanner(System.in);

	public static void main(String[] args) {
		
		String nombreCiudad1 = "";
		String nombreCiudad2 = "";
		String nombreCiudad3 = "";
		Integer longitudCiudad1 = 0;
		Integer longitudCiudad2 = 0;
		Integer longitudCiudad3 = 0;
		
		System.out.println("1/3 Introduce un nombre de ciudad: ");
		nombreCiudad1 = SC.nextLine();		
		longitudCiudad1 = nombreCiudad1.length();
		
		System.out.println("2/3 Introduce otro nombre de ciudad: ");
		nombreCiudad2 = SC.nextLine();		
		longitudCiudad2 = nombreCiudad2.length();
		
		System.out.println("3/3 Introduce un último nombre de ciudad: ");
		nombreCiudad3 = SC.nextLine();		
		longitudCiudad3 = nombreCiudad3.length();
		
		if (longitudCiudad1 <= longitudCiudad2 && longitudCiudad2 <= longitudCiudad3 && longitudCiudad1 <= longitudCiudad3) {
			System.out.println(nombreCiudad1 + " " + nombreCiudad2 + " " +  nombreCiudad3);
		}
		else if (longitudCiudad1 <= longitudCiudad2 && longitudCiudad3 <= longitudCiudad2 && longitudCiudad1 <= longitudCiudad3) {
			System.out.println(nombreCiudad1 + " " + nombreCiudad3 + " " + nombreCiudad2);
		}
		else if (longitudCiudad2 <= longitudCiudad1 && longitudCiudad1 <= longitudCiudad3 && longitudCiudad2 <= longitudCiudad3) {
			System.out.println(nombreCiudad2 + " " + nombreCiudad1 + " " + nombreCiudad3);
		}
		else if (longitudCiudad2 <= longitudCiudad1 && longitudCiudad3 <= longitudCiudad1 && longitudCiudad2 <= longitudCiudad3) {
			System.out.println(nombreCiudad2 + " " + nombreCiudad3 + " " + nombreCiudad1);
		}
		else if (longitudCiudad3 <= longitudCiudad1 && longitudCiudad1 <= longitudCiudad2 && longitudCiudad3 <= longitudCiudad2) {
			System.out.println(nombreCiudad3 + " " + nombreCiudad1 + " " + nombreCiudad2);
		}
		else if (longitudCiudad3 <= longitudCiudad1 && longitudCiudad2 <= longitudCiudad1 && longitudCiudad3 <= longitudCiudad2) {
			System.out.println(nombreCiudad3 + " " + nombreCiudad2 + " " + nombreCiudad1);
		}	

	}

}
