/* EJERCICIO 4
Realizar un programa que trabaje del siguiente modo:
1. Mostrar un mensaje pidiendo el año de nacimiento del usuario
2. Esperar a que el usuario conteste
3. Mostrar un nuevo mensaje indicando la edad del usuario calculada restando el año
actual al año indicado por el usuario */ 

package t1_ejercicios;
import java.util.Scanner;

public class T1_ejercicio4 {
	
	public static final Integer PRUEBA = 2023;
		
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner (System.in);
		
		System.out.println("¿En que año naciste?");
		Integer age = scanner.nextInt();
		Integer edad = PRUEBA - age;
		
		System.out.println("Tienes " + edad + " años.");
		
		scanner.close();
		
	}

}
