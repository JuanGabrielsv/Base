/*
EJERCICIO 26
Modifica el método setDni() y el constructor de la clase Alumno() para que cada vez que se
establezca un DNI al alumno este se registre siempre en mayúsculas. jua
*/
package ejercicios_básicos_ejercicio26;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);		
		Alumno alumno1 = new Alumno();
		Alumno alumno2 = new Alumno();
		Alumno alumno3 = new Alumno();
		Curso curso = new Curso(1,"DAM-DAW");
		Alumno[] alumnos = new Alumno[3];
		Integer posicion = 65424546;
		
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
		alumnos[1] = alumno2;
		
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
				if (alumnos[i].equals(alumnos[j]) && alumnos[i] != alumnos[j] && posicion != i) {
					System.err.println("ERROR - Los alumnos de las posiciones " + i + " y " + j + " tienen el mismo DNI");
					posicion = j;
				}				
			}			
		}
		
	}
}
