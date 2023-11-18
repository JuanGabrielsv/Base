/* 16.- Escribe un programa que lea 5 números y determine cuántos son positivos, y cuántos son negativos. */
package tema2;
import java.util.Scanner;

public class Ejercicios_iniciales_16 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario1;
		Integer entradaUsuario2;
		Integer entradaUsuario3;
		Integer entradaUsuario4;
		Integer entradaUsuario5;
		Integer positivo = 0;
		Integer negativo = 0;
		
		System.out.println("1/5 Introduce un número entero, negativo o positivo: ");
		entradaUsuario1 = sc.nextInt();
		System.out.println("2/5 Introduce un número entero, negativo o positivo: ");
		entradaUsuario2 = sc.nextInt();
		System.out.println("3/5 Introduce un número entero, negativo o positivo: ");
		entradaUsuario3 = sc.nextInt();
		System.out.println("4/5 Introduce un número entero, negativo o positivo: ");
		entradaUsuario4 = sc.nextInt();
		System.out.println("5/5 Introduce un número entero, negativo o positivo: ");
		entradaUsuario5 = sc.nextInt();
		
		if (entradaUsuario1 > 0) {
			System.out.println(entradaUsuario1 + " POSITIVO");
			positivo++;
		}
		else {
			System.out.println(entradaUsuario1 + " NEGATIVO");
			negativo++;
		}
		
		if (entradaUsuario2 > 0) {
			System.out.println(entradaUsuario2 + " POSITIVO");
			positivo++;
		}
		else {
			System.out.println(entradaUsuario2 + " NEGATIVO");
			negativo++;
		}
		
		if (entradaUsuario3 > 0) {
			System.out.println(entradaUsuario3 + " POSITIVO");
			positivo++;
		}
		else {
			System.out.println(entradaUsuario3 + " NEGATIVO");
			negativo++;
		}
		
		if (entradaUsuario4 > 0) {
			System.out.println(entradaUsuario4 + " POSITIVO");
			positivo++;
		}
		else {
			System.out.println(entradaUsuario4 + " NEGATIVO");
			negativo++;
		}
		
		if (entradaUsuario5 > 0) {
			System.out.println(entradaUsuario5 + " POSITIVO");
			positivo++;
		}
		else {
			System.out.println(entradaUsuario5 + " NEGATIVO");
			negativo++;
		}
		
		System.out.println("NEGATIVOS: " + negativo + " POSITIVOS: " + positivo);
		
		sc.close();
	}

}
