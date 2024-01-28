/* EJERCICIO 29
Crea un método validar() en la clase Alumno que devuelva un Boolean indicando si todos los
datos del alumno son válidos o no. Para que los datos de un alumno sean correctos se deben
dar estas circunstancias:

- El DNI debe ser válido de acuerdo con el método validarDni() que ya tenemos.
- El curso no puede ser null
- El nombre no puede ser null y tiene que tener una longitud mínima de 10 caracteres.
- La edad no puede ser null y tendrá que estar comprendida entre 12 y 65 (ambas inclusive).

Modifica el programa del ejercicio 25 para que al final del todo recorra el array de alumnos y
compruebe uno a uno si son válidos. Si alguno no lo es, avisa al usuario por consola.  
*/
package ejercicios_básicos_ejercicio29;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);		
		Curso curso = new Curso(1,"DAM-DAW");
		Alumno[] alumnos = new Alumno[3];
		Integer posicion = 99999999;
		Integer numAlumno = 1;
		
		for (int i = 0; i < alumnos.length; i++) {
			
			Alumno alumno = null;
			Boolean dniCorrecto = false;		
			
			do {
				System.out.println("Dime el DNI del Alumno" + numAlumno + ": ");
				String dni = sc.nextLine();
				alumno = new Alumno(dni);
				if (!alumno.validarDNI()) {
					System.err.println("Dni no válido");					
				}
				else {
					dniCorrecto = true;
				}				
			} while (!dniCorrecto);
			
			System.out.println("Dime el nombre del Alumno" + numAlumno + ": ");
			alumno.setNombre(sc.nextLine());					
			System.out.println("Dime la nota del Alumno" + numAlumno + ": ");
			alumno.setNota(sc.nextDouble());		
			System.out.println("Dime la edad del Alumno" + numAlumno + ": ");
			alumno.setEdad(sc.nextInt());
			sc.nextLine();
			numAlumno++;
			
			alumno.setCurso(curso);
			alumnos[i] = alumno;
		}
		sc.close();
		
		System.out.println();
		
		System.out.println("Recorremos los alumnos:");
		for (Alumno alumno : alumnos) {
			System.out.println(alumno);
			if (alumno.validar()) {
				System.out.println("Este alumno cumple las validaciones.");
			}
			else {
				System.out.println("Este alumno NO cumple las validaciones");
			}
		}
		
		System.out.println();
		
		for (Alumno alumno : alumnos) {
			System.out.println(alumno);
		}
		
		System.out.println();
		
		for (int i = 0; i < alumnos.length; i++) {
			for (int j = 0; j < alumnos.length; j++) {
				if (alumnos[i].equals(alumnos[j]) && alumnos[i] != alumnos[j] && posicion != i) {
					System.err.println("ERROR - Los alumnos de las posiciones " + i + " y " + j + " tienen el mismo DNI");
					posicion = j;
				}				
			}			
		}
		
	}
}
