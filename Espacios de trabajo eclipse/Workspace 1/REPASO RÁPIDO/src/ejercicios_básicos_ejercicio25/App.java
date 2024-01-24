/*
EJERCICIO 25
Crea método equals() en la clase Alumno para definir que un alumno será igual a otro si tienen
el mismo DNI.
Desde tu programa, crea un array de 3 Alumnos. Todos los alumnos pertenecen al curso con
identificador = 1 y descripción “DAM-DAW”. El resto de datos de cada alumno, debes
solicitarlos al usuario.
Cuando tengas el array completo, comprueba si hay alumnos repetidos dentro del array (ten
en cuenta que dos alumnos estarán repetidos en función de lo que se haya implementado en
el método equals). Si hay alumnos repetidos, muestra un mensaje de error al usuario.
*/
package ejercicios_básicos_ejercicio25;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);		
		Alumno alumno1 = new Alumno();
		Alumno alumno2 = new Alumno();
		Alumno alumno3 = new Alumno();
		Curso curso = new Curso(1,"DAM-DAW");
		Alumno[] alumnos = new Alumno[3];
		
		System.out.println("Dime el nombre del Alumno1: ");
		alumno1.setNombre(sc.nextLine());
		
		System.out.println("Dime el DNI del Alumno1: ");
		alumno1.setDni(sc.nextLine());
		
		System.out.println("Dime la nota del Alumno1: ");
		alumno1.setNota(sc.nextDouble());
		
		System.out.println("Dime la edad del Alumno1: ");
		alumno1.setEdad(sc.nextInt());
		sc.nextLine();
		
		alumno1.setCurso(curso);
		alumnos[0] = alumno1;
		
		System.out.println("Dime el nombre del Alumno2: ");
		alumno2.setNombre(sc.nextLine());
		
		System.out.println("Dime el DNI del Alumno2: ");
		alumno2.setDni(sc.nextLine());
		
		System.out.println("Dime la nota del Alumno2: ");
		alumno2.setNota(sc.nextDouble());
		
		System.out.println("Dime la edad del Alumno2: ");
		alumno2.setEdad(sc.nextInt());
		sc.nextLine();
		
		alumno2.setCurso(curso);
		alumnos[1] = alumno1;
		
		System.out.println("Dime el nombre del Alumno3: ");
		alumno3.setNombre(sc.nextLine());
		
		System.out.println("Dime el DNI del Alumno3: ");
		alumno3.setDni(sc.nextLine());
		
		System.out.println("Dime la nota del Alumno3: ");
		alumno3.setNota(sc.nextDouble());
		
		System.out.println("Dime la edad del Alumno3: ");
		alumno3.setEdad(sc.nextInt());
		sc.nextLine();
		
		sc.close();
		
		alumno3.setCurso(curso);
		alumnos[2] = alumno3;
		
		for (Alumno alumno : alumnos) {
			System.out.println(alumno);
		}
		
		for (int i = 0; i < alumnos.length; i++) {
			for (int j = 0; j < alumnos.length; j++) {
				if (alumnos[i].equals(alumnos[j])) {
					System.err.println("ERROR");
					break; 
				}								
			}
		}
		
		
		
		
		
	}
}
