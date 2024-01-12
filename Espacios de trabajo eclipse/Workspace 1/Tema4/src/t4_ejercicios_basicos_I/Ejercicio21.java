/* EJERCICIO 21
Crea una clase Persona que tenga los atributos nombre y edad privados con sus get y set. Haz
que la clase Alumno herede de ella. Borra todo lo que sea duplicado. ¿Tienes que cambiar algo
en tu programa de pruebas? */

package t4_ejercicios_basicos_I;
import java.util.Scanner;
public class Ejercicio21 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Ejercicio21Alumno alumno = new Ejercicio21Alumno();

		// alumno.dni="987654G";
		// alumno.nombre="Manolo";

		alumno.setDni("53279139F");

		System.out.println("Dime el dni");
		String dni = sc.nextLine();
		alumno.setDni(dni);

		System.out.println("Dime el nombre");
		String nombre = sc.nextLine();
		alumno.setNombre(nombre);

		System.out.println("Dime la edad");
		Integer edad = sc.nextInt();
		alumno.setEdad(edad);

		System.out.println("Dime la nota");
		Double nota = sc.nextDouble();
		alumno.setNota(nota);

		System.out.println();

		Ejercicio21Alumno alumno2 = new Ejercicio21Alumno(dni,nombre,edad,nota);

		alumno.aprobar();
		alumno2.aprobar();

		System.out.println(alumno.getDni() + "\n" + alumno.getNombre() + "\n" + alumno.getEdad() + "\n" + alumno.getNota());
		System.out.println("\n" + alumno2.getDni() + "\n" + alumno2.getNombre() + "\n" + alumno2.getEdad() + "\n" + alumno2.getNota());

		sc.close();

	}

}
