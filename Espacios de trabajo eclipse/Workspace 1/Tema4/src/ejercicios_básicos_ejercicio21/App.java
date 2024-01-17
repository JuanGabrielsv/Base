/*
EJERCICIO 21
Crea una clase Persona que tenga los atributos nombre y edad privados con sus get y set. Haz
que la clase Alumno herede de ella. Borra todo lo que sea duplicado. ¿Tienes que cambiar algo
en tu programa de pruebas?
*/
package ejercicios_básicos_ejercicio21;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Alumno alumno = new Alumno();

		System.out.println("1/4 - Dime el nombre del Alumno: ");
		alumno.setNombre(sc.nextLine());
		System.out.println("2/4 - Introduce su DNI: ");
		alumno.setDni(sc.nextLine());
		System.out.println("3/4 - ¿Cuántos años tiene?");
		alumno.setEdad(sc.nextInt());
		System.out.println("4/4 - Dime la nota:");
		alumno.setNota(sc.nextDouble());
		sc.close();

		System.out.println("\nLos datos introducidos son los siguientes: \n ");
		System.out.println("NOMBRE: " + alumno.getNombre());
		System.out.println("DNI: " + alumno.getDni());
		System.out.println("EDAD: " + alumno.getEdad());
		System.out.println("NOTA: " + alumno.getNota());

	}
}
