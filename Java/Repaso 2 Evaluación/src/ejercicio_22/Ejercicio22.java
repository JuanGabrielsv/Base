package ejercicio_22;

import java.util.Scanner;

public class Ejercicio22 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		System.out.println("Dime el dni");
		String dni = sc.nextLine();
		Alumno alumno = new Alumno(dni);
		// System.out.println("Edad: " + alumno.getEdad());

		System.out.println("Dime el nombre");
		String nombre = sc.nextLine();
		alumno.setNombre(nombre);

		System.out.println("Dime la edad");
		Integer edad = sc.nextInt();
		alumno.setEdad(edad);
		System.out.println("Dime la nota");
		Double nota = sc.nextDouble();
		alumno.setNota(nota);
		sc.close();

		System.out.println("DNI: " + alumno.getDni());
		System.out.println("NOMBRE: " + alumno.getNombre());
		System.out.println("EDAD: " + alumno.getEdad());
		System.out.println("NOTA: " + alumno.getNota());

		alumno.aprobar();

		System.out.println("Nueva NOTA: " + alumno.getNota());

	}

}
