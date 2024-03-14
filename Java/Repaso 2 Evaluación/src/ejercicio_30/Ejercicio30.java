/*
EJERCICIO 30

• Añade a la clase Curso un atributo llamado “alumnos” que sea un array de Alumno. 
• Debe ser privado. 
• En el constructor de la clase Curso, haz que se reciba el número de alumnos totales
  que va a tener, de ese modo podrás inicializar el array de alumnos en el Constructor.
• Añade un método get() para el nuevo atributo, pero no un set().
• Añade además otro método que sea addAlumno() que recibe por parámetro un alumno. 
• El método debe añadir el alumno al array en la siguiente posición libre.
• Modifica el programa del ejercicio 25 para añadir todos los alumnos del array a la clase Curso. 
*/
package ejercicio_30;

import java.util.Scanner;

public class Ejercicio30 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Alumno[] alumnos = new Alumno[3];
		Curso curso = new Curso(3);
		
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
