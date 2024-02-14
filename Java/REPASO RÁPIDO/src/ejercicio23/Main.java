/* EJERCICIO 22

• Crea una clase Curso que tenga los atributos privados identificador y descripción. 
• Añade los métodos get y set. 
• Haz que la clase Alumno tenga un atributo de tipo Curso. 
• Recuerda crear su get/set

Adapta el programa que has creado para probar para que también solicite el curso. */

package ejercicio23;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		Alumno alumno1 = new Alumno();
		Curso curso = new Curso();

		System.out.println("1/6 Introduce el dni del Alumno: ");
		alumno1.setDni(sc.nextLine());

		System.out.println("2/6 Introduce el nombre del Alumno: ");
		alumno1.setNombre(sc.nextLine());

		System.out.println("3/6 Introduce la edad del Alumno: ");
		alumno1.setEdad(Integer.parseInt(sc.nextLine()));

		System.out.println("4/6 Introduce la nota del Alumno: ");
		alumno1.setNota(Double.parseDouble(sc.nextLine()));

		System.out.println("5/6 Introduce el identificador de curso: ");
		curso.setIndentificador(Long.parseLong(sc.nextLine()));

		System.out.println("6/6 Introduce la descripción del curso: ");
		curso.setDescripcion(sc.nextLine());

		alumno1.setCurso(curso);

		System.out.println(alumno1.getDni());
		System.out.println(alumno1.getNombre());
		System.out.println(alumno1.getEdad());
		System.out.println(alumno1.getNota());
		System.out.println(curso.getDescripcion());
		System.out.println(curso.getIndentificador());

		sc.close();

	}

}
