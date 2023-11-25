/* EJERCICIO 1
Haz un programa que cuente cuántos alumnos han suspendido (tienen menos de un 5). Imprime
la cantidad. El resultado debería ser:
Total alumnos suspensos: 7 */
package t3_ejercicios_repaso;

public class T3_ejercicios_repaso_1 {
	public static void main(String[]args) {
		
		Integer[] listaNotas = new Integer[] {7, 9, 8, 4, 0, 6, 3, 4, 1, 7, 3, 1, 9, 10};
		Integer suspensos = 0;
		Integer aprobados = 0;
		
		for (int i = 0; i < listaNotas.length; i++) {
			
			if (listaNotas[i] < 5) {
				suspensos++;				
			}
			else {
				aprobados++;
			}
		}
		System.out.println("Total alumnos suspensos: " + suspensos);
		
		suspensos = 0;
		aprobados = 0;
		
		for (Integer numero : listaNotas) {
			
			if (numero < 5) {				
				suspensos++;
			}
			else {				
				aprobados++;
			}		
		}
		System.out.println("Total alumnos suspensos: " + aprobados);
				
	}

}
