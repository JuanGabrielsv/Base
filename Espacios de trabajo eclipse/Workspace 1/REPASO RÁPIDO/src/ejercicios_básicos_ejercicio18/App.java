/*
EJERCICIO 18
Crea una clase llamada Alumno que tenga como atributos privados el dni, nombre, edad y
nota. Además, tendrá métodos get y set para todos los atributos. Luego crea un programa que
lea por consola los datos de un alumno y los registre en un objeto de la clase que acabas de
crear.       
*/
package ejercicios_básicos_ejercicio18;
import java.util.Scanner;

public class App {	
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Alumno alumno = new Alumno();
		
		System.out.println("Dime el nombre del Alumno: ");
		alumno.setNombre(sc.nextLine());
		
		
		

	}	
}
