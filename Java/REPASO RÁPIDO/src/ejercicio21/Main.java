/* EJERCICIO 21
Crea una clase Persona que tenga los atributos nombre y edad privados con sus get y set. Haz
que la clase Alumno herede de ella. Borra todo lo que sea duplicado. ¿Tienes que cambiar algo
en tu programa de pruebas? */

package ejercicio21;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		String entradaUsuario;
		Alumno alumno1 = new Alumno();

		System.out.println("1/4 Introduce el dni del Alumno: ");
		entradaUsuario = sc.nextLine();
		alumno1.setDni(entradaUsuario);

		System.out.println("2/4 Introduce el nombre del Alumno: ");
		entradaUsuario = sc.nextLine();
		alumno1.setNombre(entradaUsuario);

		System.out.println("3/4 Introduce la edad del Alumno: ");
		entradaUsuario = sc.nextLine();
		alumno1.setEdad(Integer.parseInt(entradaUsuario));

		System.out.println("4/4 Introduce la nota del Alumno: ");
		entradaUsuario = sc.nextLine();
		alumno1.setNota(Double.parseDouble(entradaUsuario));
		sc.close();

		System.out.println(alumno1.getDni());
		System.out.println(alumno1.getNombre());
		System.out.println(alumno1.getEdad());
		System.out.println(alumno1.getNota());

	}

}
