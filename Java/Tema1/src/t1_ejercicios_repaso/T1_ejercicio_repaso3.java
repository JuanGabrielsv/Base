/* EJERCICIO 3
Repite el ejercicio anterior, pero con la restricción de que sólo podrás leer desde el teclado
datos de tipo String. Es decir, sólo podrás usar el método “nextLine()” del Scanner.
PISTA: Tendrás que aplicar una conversión de tipos. */

package t1_ejercicios_repaso;
import java.util.Scanner;

public class T1_ejercicio_repaso3 {
	public static void main(String[] args) {
		
/* DECLARACIÓN DE VARIABLES */
		String numero1;
		String numero2;
		Long multiplicacion;
		Long num1;
		Long num2;		
		
/* OBTENCIÓN DE INFORMACIÓN POR TECLADO */
		Scanner sc = new Scanner (System.in);
		System.out.println("Dame un número: ");
		numero1 = sc.nextLine();
		System.out.println("Dame otro número: ");
		numero2 = sc.nextLine();
		
/* CONVERSIÓN DE VARIABLES */
		num1 = Long.parseLong(numero1);
		num2 = Long.parseLong(numero2);
		
/* CÁLCULOS */
		multiplicacion = num1 * num2;
		
/* IMPRESIÓN DEL RESULTADO POR PANTALLA */
		System.out.println(multiplicacion);
		sc.close();
		
	}
}
