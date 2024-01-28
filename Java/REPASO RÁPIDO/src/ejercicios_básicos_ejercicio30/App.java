/* EJERCICIO 30
Añade a la clase Curso un atributo llamado “alumnos” que sea un array de Alumno. Debe ser
privado. En el constructor de la clase Curso, haz que se reciba el número de alumnos totales
que va a tener, de ese modo podrás inicializar el array de alumnos en el Constructor.

Añade un método get() para el nuevo atributo, pero no un set().

Añade además otro método que sea addAlumno() que recibe por parámetro un alumno. El
método debe añadir el alumno al array en la siguiente posición libre.

Modifica el programa del ejercicio 25 para añadir todos los alumnos del array a la clase Curso.  
*/
package ejercicios_básicos_ejercicio30;

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
