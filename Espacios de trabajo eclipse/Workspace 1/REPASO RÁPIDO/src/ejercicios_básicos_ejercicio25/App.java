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
		Profesor profesor1 = new Profesor();
		Alumno alumno1 = new Alumno();
		Curso curso = new Curso();		
		
		System.out.println("Introduce el nombre del profesor: ");
		profesor1.setNombre(sc.nextLine());
		System.out.println("Introduce la edad del Profesor: ");
		profesor1.setEdad(sc.nextInt());
		sc.nextLine();	
		
		System.out.println("Introduce el nombre del Alumno: ");
		alumno1.setNombre(sc.nextLine());
		//sc.next();
		System.out.println("Introduce la edad del Alumno: ");
		alumno1.setEdad(sc.nextInt());
		sc.nextLine();
		System.out.println("Introduce el DNI del Alumno: ");
		alumno1.setDni(sc.nextLine());
		System.out.println("Introduce la nota del Alumno: ");
		alumno1.setNota(sc.nextDouble());
		System.out.println("Introduce el identificacdor del curso del Alumno: ");
		curso.setIdentificador(sc.nextInt());
		sc.nextLine();
		System.out.println("Introduce la descripción del curso del Alumno: ");
		curso.setDescripcion(sc.nextLine());
		sc.close();
		
		alumno1.setCurso(curso);
		
		System.out.println(alumno1);
		System.out.println(profesor1);
		
	}
}
