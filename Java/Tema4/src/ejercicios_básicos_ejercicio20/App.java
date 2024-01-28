/*
EJERCICIO 20
Cambia el constructor de la clase para que reciba un parámetro String que sea el dni del
alumno. Es decir, cuando queramos crear un objeto Alumno, habrá que indicar
obligatoriamente su DNI. Modifica el programa que has creado para probar para que funcione
con este nuevo constructor.        
*/
package ejercicios_básicos_ejercicio20;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Alumno alumno = new Alumno("53279139F");

		System.out.println("1/4 - Dime el nombre del Alumno: ");
		alumno.setNombre(sc.nextLine());		
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
