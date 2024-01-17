/*
EJERCICIO 22
Crea una clase Curso que tenga los atributos privados identificador y descripción. Añade los
métodos get y set. Haz que la clase Alumno tenga un atributo de tipo Curso. Recuerda crear su
get/set
Adapta el programa que has creado para probar para que también solicite el curso.
*/
package ejercicios_básicos_ejercicio22;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Alumno alumno = new Alumno();
		Curso curso = new Curso();

		System.out.println("1/4 - Dime el nombre del Alumno: ");
		alumno.setNombre(sc.nextLine());
		System.out.println("2/4 - Introduce su DNI: ");
		alumno.setDni(sc.nextLine());
		System.out.println("3/4 - ¿Cuántos años tiene?");
		alumno.setEdad(sc.nextInt());
		System.out.println("4/4 - Dime la nota:");
		alumno.setNota(sc.nextDouble());
		System.out.println("5/6 - Dime la identificador del curso");
		curso.setIdentificador(sc.nextInt());
		System.out.println("6/6 - Introduce una descripción del curso");
		curso.setDescripcion(sc.nextLine());
		sc.close();

		System.out.println("\nLos datos introducidos son los siguientes: \n ");
		System.out.println("NOMBRE: " + alumno.getNombre());
		System.out.println("DNI: " + alumno.getDni());
		System.out.println("EDAD: " + alumno.getEdad());
		System.out.println("NOTA: " + alumno.getNota());
		System.err.println("CURSO IDENTIFICADOR: " + curso.getIdentificador());
		System.out.println("CURSO DESCRIPCION: " + curso.getDescripcion());

	}
}
