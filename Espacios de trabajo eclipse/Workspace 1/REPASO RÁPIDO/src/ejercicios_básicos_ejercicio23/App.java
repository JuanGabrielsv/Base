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
		Alumno alumno = new Alumno();
		Curso curso = new Curso();

		System.out.println("1/6 - Dime el nombre del Alumno: ");
		alumno.setNombre(sc.nextLine());
		System.out.println("2/6 - Introduce su DNI: ");
		alumno.setDni(sc.nextLine());
		System.out.println("3/6 - ¿Cuántos años tiene?");
		alumno.setEdad(sc.nextInt());
		System.out.println("4/6 - Dime la nota:");
		alumno.setNota(sc.nextDouble());
		System.out.println("5/6 - Dime la identificador del curso");
		curso.setIdentificador(sc.nextInt());
		sc.nextLine();
		System.out.println("6/6 - Introduce una descripción del curso");
		curso.setDescripcion(sc.nextLine());
		sc.close();

		alumno.setCurso(curso);

		System.out.println("\nLos datos introducidos son los siguientes: \n ");
		System.out.println("NOMBRE: " + alumno.getNombre());
		System.out.println("DNI: " + alumno.getDni());
		System.out.println("EDAD: " + alumno.getEdad());
		System.out.println("NOTA: " + alumno.getNota());
		System.out.println("CURSO IDENTIFICADOR: " + curso.getIdentificador());
		System.out.println("CURSO DESCRIPCION: " + curso.getDescripcion());

	}
}
