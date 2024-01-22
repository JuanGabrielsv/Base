/*
EJERCICIO 23
Crea una clase Profesor vacía que herede de Persona. Crea un programa que solicite por
pantalla todos los datos de un profesor nuevo. El programa tendrá que crear un objeto
Profesor y meter todos esos datos que el usuario le proporciona.
*/
package ejercicios_básicos_ejercicio23;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Profesor profesor1 = new Profesor();
		
		System.out.println("Introduce el nombre del profesor: ");
		profesor1.setNombre(sc.nextLine());
		System.out.println("Introduce la edad del Profesor: ");
		profesor1.setEdad(sc.nextInt());
		
		System.out.println(profesor1);
		
	}
}
