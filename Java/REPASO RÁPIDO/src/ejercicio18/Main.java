/* EJERCICIO 18
Crea una clase llamada Alumno que tenga como atributos privados el dni, nombre, edad y
nota. Además, tendrá métodos get y set para todos los atributos. Luego crea un programa que
lea por consola los datos de un alumno y los registre en un objeto de la clase que acabas de
crear. */ 

package ejercicio18;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		String entradaUsuario;
		Alumno alumno1 = null;
		
		System.out.println("Introduce el dni del Alumno: ");
		entradaUsuario = sc.nextLine();
		alumno1.setDni(entradaUsuario);
		

	}

}
