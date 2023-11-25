/* EJERCICIO 6
Realizar un programa que calcule el IVA de un artículo. Para ello:
1. Solicita por consola al usuario cuál es el precio sin IVA del artículo (puede llevar decimales)
2. Recoge el dato y calcula el IVA (21%)
3. Muestra como resultado en la consola el IVA calculado y el precio final (la suma del precio sin IVA más el IVA) */

package tema1_ejercicio6;
import java.util.Scanner;

public class T1_ejercicio6 {
	
	public static void main (String[] args) {
		
		Scanner scanner = new Scanner (System.in);
		
		System.out.println("¿Cuál es el precio sin IVA del producto?");
		Float precio = scanner.nextFloat();
		Integer iva = 21;
		Float preciototal = precio + precio * iva / 100;
		Float cantidadiva = precio * iva / 100;
		
		System.out.println("El precio con el " + iva + "% de IVA es " + preciototal + " por lo que estás pagando " + cantidadiva + "€ de iva.");
		
		scanner.close();
		
	}

}
