/* EJERCICIO 20
Cambia el constructor de la clase para que reciba un parámetro String que sea el dni del
alumno. Es decir, cuando queramos crear un objeto Alumno, habrá que indicar
obligatoriamente su DNI. Modifica el programa que has creado para probar para que funcione
con este nuevo constructor. */

package t4_ejercicios_basicos_I;

import java.util.Scanner;

public class Ejercicio20 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Ejercicio20Alumno alumno = new Ejercicio20Alumno();

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

		Ejercicio20Alumno alumno2 = new Ejercicio20Alumno(dni, nombre, edad, nota);

		alumno.aprobar();
		alumno2.aprobar();

		System.out.println(
				alumno.getDni() + "\n" + alumno.getNombre() + "\n" + alumno.getEdad() + "\n" + alumno.getNota());
		System.out.println(
				alumno2.getDni() + "\n" + alumno2.getNombre() + "\n" + alumno2.getEdad() + "\n" + alumno2.getNota());

		sc.close();

	}

}
