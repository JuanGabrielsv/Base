/* EJERCICIO 8
Realizar un programa que obtenga por teclado los siguientes datos:
 Un número, pero registradlo en una variable de tipo String llamada a.
 Un número decimal registrado en una variable de tipo Double llamada b.
 Un número entero registrado en una variable de tipo Float llamada c.
A continuación, haz las siguientes conversiones de tipo:
 Guarda el valor de “a” en una variable de tipo Long llamada “x1”
 Guarda el valor de “b” en una variable de tipo String llamada “x2”
 Guarda el valor de “b” en una variable de tipo Integer llamada “x3”
 Guarda el valor de “c” en una variable de tipo Long llamada “x4”
Imprime por consola el valor de todas las variables x1, x2, x3 y x4 */

package t1_ejercicios;
import java.util.Scanner;
public class T1_ejercicio8 {
	public static void main(String[] args) {
		
/* OBTENCIÓN DE DATOS POR TECLADO */		
		Scanner sc = new Scanner(System.in);
		System.out.println("Dame un número a: ");
		String a = sc.nextLine();
		System.out.println("Dame un número b que sea decimal: ");
		double b = sc.nextDouble();
		System.out.println("Dame un número c: ");
		float c = sc.nextFloat();
		
/* CONVERSIÓN DE VARIABLES */
		Long x1 = Long.parseLong(a);
		String x2 = String.valueOf(b);
		Integer x3 = (int) b;
		Long x4 = (long) c;
		
/* IMPRESIÓN DE RESULTADO */
		System.out.println("x1: " + x1 );
		System.out.println("x2: " + x2 );
		System.out.println("x3: " + x3 );
		System.out.println("x4: " + x4 );
		sc.close();
	}
}

/* package principal;
import java.util.Scanner;

public class Repaso_rápido {
	
	public static void main(String[]args) {
		
		Scanner sc = new Scanner (System.in);
		String a;
		Double b;
		Float c;
		
		System.out.println("Dime hola: ");
		a = sc.nextLine();
		System.out.println("Dame un número decimal: ");
		b = sc.nextDouble();
		System.out.println("¿Qué edad tienes?: ");
		c = sc.nextFloat();
		
		Long x1 = Long.parseLong(a);
		String x2 = b.toString();
		int x3 = b.intValue();
		long x4 = c.longValue();
		
		System.out.println("x1: " + x1);
		System.out.println("x2: " + x2);
		System.out.println("x3: " + x3);
		System.out.println("x4: " + x4);
		
		sc.close();
		
		
	}
}*/