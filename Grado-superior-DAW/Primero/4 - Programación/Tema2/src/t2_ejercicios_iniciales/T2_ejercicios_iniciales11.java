/* 11.- Dados tres números introducidos por teclado, determinar el mayor y el menor. */
package t2_ejercicios_iniciales;
import java.util.Scanner;
public class T2_ejercicios_iniciales11 {
public static void main(String[]args) {
	
	/* SE DECLARAN VARIABLES */
	Integer a = 0;
	Integer b = 0;
	Integer c = 0;
	
	/* GUARDAMOS LA INFORMACIÓN */
	Scanner sc = new Scanner (System.in);
	System.out.println("Dame un número: ");
	a = sc.nextInt();
	System.out.println("Otro número por favor: ");
	b = sc.nextInt();
	System.out.println("Introduce un número, el último lo prometo: ");
	c = sc.nextInt();
	
	/* REALIZAMOS LAS COMPARACIONES */
	if (a > b && a > c) {
		System.out.println("El número mayor es: " + a);
	}
	else if (a < b && a < c) {
		System.out.println("El menor es: " + a);
	}
	
	if (b > a && b > c) {
		System.out.println("El número mayor es: " + b);
	}
	else if (b < a && a < c) {
		System.out.println("El menor es: " + b);
	}
	
	if (c > b && c < a) {
		System.out.println("El mayor es: " + c);
	}
	else if (c < b && c < a) {
		System.out.println("El menor es: " + c);
	}

	sc.close();


}
}
