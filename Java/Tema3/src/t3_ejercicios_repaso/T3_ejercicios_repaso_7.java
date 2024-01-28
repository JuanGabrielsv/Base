/* EJERCICIO 7
Haz un programa que calcule el precio de un telegrama. Los telegramas se dictan normalmente,
pero cambiando los puntos por la palabra “STOP”.
El precio del telegrama se calcula multiplicando la cantidad total de palabras por un precio fijo
(0,24 €). Obviamente, la palabra “STOP” no se cuenta. Ejemplo de ejecución:
Escribe tu telegrama
SIN NOVEDADES EN EL FRENTE STOP VUELVO MAÑANA TARDE NOCHE STOP TENED PREPARADO
EL PUCHERO STOP
El precio es 3.12 */
package t3_ejercicios_repaso;

import java.util.Scanner;

public class T3_ejercicios_repaso_7 {
	
	public static final String STOP = "stop";
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);		
		System.out.println("Introduce tu mensaje: ");
		String telegrama = sc.nextLine();
		Integer contador = 0;
		
		String palabras[] = telegrama.split(" ");
		for(int i = 0; i < palabras.length; i++) {
			if (!palabras[i].equalsIgnoreCase(STOP)) {
				contador++;
			}
		}
		
		System.out.println(contador * 0.24);
		sc.close();
		
	}
}