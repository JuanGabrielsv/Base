/*
EJERCICIO 35
Vuele a hacer el ejercicio 25 utilizando List en lugar de arrays.
*/

package ejercicios_básicos_ejercicio35;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);		
		Alumno alumno1 = new Alumno();
		Alumno alumno2 = new Alumno();
		Alumno alumno3 = new Alumno();
		Curso curso = new Curso(1,"DAM-DAW");
		List<Alumno> listaAlumnos = new ArrayList<>();
		//Alumno[] alumnos = new Alumno[3];
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
		listaAlumnos.add(alumno1);
		
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
		listaAlumnos.add(alumno2);
		
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
		listaAlumnos.add(alumno3);
		
		for (Alumno alumno : listaAlumnos) {
			System.out.println(alumno);
		}
		
		for (int i = 0; i < listaAlumnos.size(); i++) {
			for (int j = 0; j < listaAlumnos.size(); j++) {
				if (listaAlumnos.get(i).equals(listaAlumnos.get(j)) && listaAlumnos.get(i) != listaAlumnos.get(j) && posicion != i) {
					System.err.println("ERROR - Los alumnos de las posiciones " + i + " y " + j + " tienen el mismo DNI");
					posicion = j;
				}				
			}			
		}

	}
}
