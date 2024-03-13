/* EJERCICIO 27
Crea un método validarDNI() en la clase Alumno que devuelva un Boolean indicando si el dni 
que tiene establecido el alumno es correcto o no. Para ello, tendrás que validar lo siguiente:

a) El dni no puede ser null ni vacío
b) El dni tiene que tener una longitud total de 9.

Modifica el programa del ejercicio 25 para validar el DNI de los alumnos que vas creando. Si alguno no es correcto, vuelve a solicitarlo. 
*/
package ejercicio_27;

import java.util.Scanner;

public class Ejercicio27 {

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

		for (Alumno alumno : alumnos) {
			System.out.println(alumno);
		}

		if (alumnos[0].equals(alumnos[1]) || alumnos[0].equals(alumnos[2]) || alumnos[1].equals(alumnos[2])) {
			System.err.println("*** ERROR: Hay alumnos iguales ***");
		} else {
			System.out.println("No hay alumnos iguales");
		}

		sc.close();

	}
}
