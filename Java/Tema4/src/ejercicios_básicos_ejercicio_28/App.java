/* EJERCICIO 28
Buscando en internet, nos encontramos este trozo de código que asegura validar un DNI que
no sea null:

String ejemploDni = "00000000T";
Pattern patron = Pattern.compile("[0-9]{7,8}[A-Z a-z]");
Matcher match = patron.matcher(ejemploDni);
if(match.matches()) {
 System.out.println("El dni es correcto");
}
else {
 System.out.println("El dni es incorrecto");
}

Cambia tu método validarDNI() para que realice la segunda parte de la validación (b) utilizando
el código que hemos encontrado. Tendrás que adaptarlo, ya que nosotros no queremos
imprimir nada. El método tiene que seguir devolviendo un Boolean. 
*/
package ejercicios_básicos_ejercicio_28;

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
		
		for (Alumno alumno : alumnos) {
			System.out.println(alumno);
		}
		
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
