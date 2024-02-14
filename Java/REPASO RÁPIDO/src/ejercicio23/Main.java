/* EJERCICIO 23
• Crea una clase Profesor vacía que herede de Persona. 
• Crea un programa que solicite por pantalla todos los datos de un profesor nuevo. 
• El programa tendrá que crear un objeto Profesor y meter todos esos datos que el usuario le proporciona. */

package ejercicio23;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		Alumno alumno1 = new Alumno();
		Curso curso = new Curso();
		Profesor profesor1 = new Profesor();

		System.out.println("1/8 Introduce el dni del Alumno: ");
		alumno1.setDni(sc.nextLine());

		System.out.println("2/8 Introduce el nombre del Alumno: ");
		alumno1.setNombre(sc.nextLine());

		System.out.println("3/8 Introduce la edad del Alumno: ");
		alumno1.setEdad(Integer.parseInt(sc.nextLine()));

		System.out.println("4/8 Introduce la nota del Alumno: ");
		alumno1.setNota(Double.parseDouble(sc.nextLine()));

		System.out.println("5/8 Introduce el identificador del curso del Alumno: ");
		curso.setIndentificador(Long.parseLong(sc.nextLine()));

		System.out.println("6/8 Introduce la descripción del curso del Alumno: ");
		curso.setDescripcion(sc.nextLine());
		
		System.out.println("7/8 Introduce el nombre del Profesor: ");
		profesor1.setNombre(sc.nextLine());
		
		System.out.println("8/8 Introduce la edad del Profesor: ");
		profesor1.setEdad(Integer.parseInt(sc.nextLine()));

		alumno1.setCurso(curso);

		System.out.println(alumno1.getDni());
		System.out.println(alumno1.getNombre());
		System.out.println(alumno1.getEdad());
		System.out.println(alumno1.getNota());
		System.out.println(curso.getDescripcion());
		System.out.println(curso.getIndentificador());
		System.out.println(profesor1.getNombre());
		System.out.println(profesor1.getEdad());

		sc.close();

	}

}
