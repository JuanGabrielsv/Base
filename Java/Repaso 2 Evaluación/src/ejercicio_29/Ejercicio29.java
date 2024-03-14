/* EJERCICIO 29

Crea un método validar() en la clase Alumno que devuelva un Boolean indicando si todos los
datos del alumno son válidos o no. Para que los datos de un alumno sean correctos se deben
dar estas circunstancias:

	• El DNI debe ser válido de acuerdo con el método validarDni() que ya tenemos.
	• El curso no puede ser null
	• El nombre no puede ser null y tiene que tener una longitud mínima de 10 caracteres.
	• La edad no puede ser null y tendrá que estar comprendida entre 12 y 65 (ambas inclusive).
	
Modifica el programa del ejercicio 25 para que al final del todo recorra el array de alumnos y
compruebe uno a uno si son válidos. Si alguno no lo es, avisa al usuario por consola. 
*/
package ejercicio_29;

import java.util.Scanner;

public class Ejercicio29 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		Alumno[] alumnos = new Alumno[3];

		Curso curso = new Curso();
		curso.setIdentificador(1L);
		curso.setDescripcion("DAM/DAW");

		for (int i = 0; i < alumnos.length; i++) {

			Alumno alumno = new Alumno();
			Boolean check = false;

			System.out.print("NOMBRE: ");
			alumno.setNombre(sc.nextLine());

			do {

				System.out.print("DNI: ");
				alumno.setDni(sc.nextLine());

				if (!alumno.validarDNI()) {					
					System.err.println("\nDNI NO VALIDO INTRODÚZCALO DE NUEVO");					
				}
				else {
					check = true;
				}

			} while (!check);
			
			System.out.print("EDAD: ");
			alumno.setEdad(Integer.parseInt(sc.nextLine()));
			System.out.print("NOTA: ");
			alumno.setNota(Double.parseDouble(sc.nextLine()));
			alumno.setCurso(curso);
			alumnos[i] = alumno;
		}
		
		System.out.println("\n-- VALIDANDO LOS DATOS DE LOS ALUMNOS --");
		for (Alumno alumno : alumnos) {
			
			if (!alumno.validar()) {
				System.err.println("ESTE ALUMNO NO ES CORRECTO: " + alumno);
			}
			else {
				System.out.println("ESTE ALUMNO ES CORRECTO: " + alumno);
			}
			
		}
		
		System.out.println("\n-- ALUMNOS REGISTRADOS --");
		for (Alumno alumno : alumnos) {
			System.out.println(alumno);
		}
		
		System.out.println("\n-- COMPROBACIÓN DE ALUMNOS IGUALES EN EL ARRAY --");
		if (alumnos[0].equals(alumnos[1]) || alumnos[0].equals(alumnos[2]) || alumnos[1].equals(alumnos[2])) {
			System.err.println("*** ERROR: Hay alumnos iguales ***");
		} else {
			System.out.println("No hay alumnos iguales");
		}

		sc.close();

	}
}
