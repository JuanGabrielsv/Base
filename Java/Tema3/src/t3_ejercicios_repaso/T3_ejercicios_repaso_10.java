/* EJERCICIO 10

Haz un programa que pueda calcular la nota media de los alumnos de clase.
Para ello, en primer lugar:
 
	1. El programa debe preguntar al usuario cuántos alumnos hay.
	2. Para cada alumno, solicitará su nombre y las notas de los 3 exámenes realizados. 
	3. Deberá mostrar un listado con las notas medias de cada alumno y la nota media de la clase.

Ejemplo de ejecución:

¿Cuántos alumnos hay en clase?
2
Cuál es el nombre el alumno 1
Laura
Cuál es la nota de Laura para el examen 1?
5
Cuál es la nota de Laura para el examen 2?
9
Cuál es la nota de Laura para el examen 3?
7
Cuál es el nombre el alumno 2
Antonio
Cuál es la nota de Antonio para el examen 1?
2
Cuál es la nota de Antonio para el examen 2?
4
Cuál es la nota de Antonio para el examen 3?
9
LISTADO DE NOTAS
 Alumno: Laura - Nota media: 7
 Alumno: Antonio - Nota media: 5
Media de los alumnos: 6 
*/
package t3_ejercicios_repaso;

import java.util.Scanner;

public class T3_ejercicios_repaso_10 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Integer arraySize;
		String nombreAlumnos[];
		Integer mediaNotas[];
		Integer mediaAlumnos = 0;
		Integer resultadoMedia = 0;

		System.out.println("CUÁNTOS ALUMNOS HAY EN CLASE: ");
		arraySize = Integer.parseInt(sc.nextLine());
		nombreAlumnos = new String[arraySize];
		mediaNotas = new Integer[arraySize];

		for (int i = 0; i < nombreAlumnos.length; i++) {
			Integer sumaNotas = 0;
			System.out.println("DIME EL NOMBRE DEL ALUMNO " + (i + 1));
			nombreAlumnos[i] = sc.nextLine();
			for (int j = 0; j < 3; j++) {
				System.out.println("¿Cuál es la nota de " + nombreAlumnos[i] + " para el examen " + (j + 1) + "?");
				sumaNotas += Integer.parseInt(sc.nextLine());
			}
			mediaNotas[i] = sumaNotas / 3;
		}

		System.out.println("\nLISTADO DE NOTAS");
		
		for (int i = 0; i < nombreAlumnos.length; i++) {
			System.out.print("\tAlumno: " + nombreAlumnos[i] + " - Nota media: " + mediaNotas[i] + "\n");			
			mediaAlumnos += mediaNotas[i];
		}
		
		resultadoMedia = mediaAlumnos / nombreAlumnos.length;
		System.out.println("Media de los Alumnos: " + resultadoMedia);
		sc.close();

	}

}
