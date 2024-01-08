/* EJERCICIO 18
Crea una clase llamada Alumno que tenga como atributos privados el dni, nombre, edad y
nota. Además, tendrá métodos get y set para todos los atributos. Luego crea un programa que
lea por consola los datos de un alumno y los registre en un objeto de la clase que acabas de
crear. */

package t4_ejercicios_basicos_I;

import java.util.Scanner;

public class Ejercicio18 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Ejercicio18Alumno alumno = new Ejercicio18Alumno();
		//alumno.dni="987654G";
		//alumno.nombre="Manolo";
		
		alumno.setDni("53279139F");
		
		
		System.out.println("Dime el dni");
		String dni = sc.nextLine();
		alumno.setDni(dni);
		
		System.out.println("Dime el nombre");
		String nombre = sc.nextLine();
		alumno.setNombre(nombre);
		
		System.out.println("Dime la edad");
		Integer edad = sc.nextInt();
		alumno.setEdad(edad);
		
		System.out.println("Dime la nota");
		Double nota = sc.nextDouble();
		alumno.setNota(nota);
		

	}

}
