/* EJERCICIO 7
Mejorar el ejercicio anterior para que, en lugar de mostrar y sumar los múltiplos de 3, lo haga
con cualquier número natural que indique el usuario por teclado. Es decir, el programa
funcionará de este modo:
1. Solicitamos un número al usuario
2. Si está entre 1 y 10 (inclusive ambos), mostramos la suma como en el ejercicio
anterior. Luego volvemos a pedir otro número para repetir la operación (volvemos al
paso 1)
3. Si el número indicado es mayor a 10 o menor a 0, indicaremos que el número no es
correcto, y solicitaremos otro de nuevo.
4. Si el número indicado es 0, terminaremos el programa.  */
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso7 {
	
	public static final Scanner SC = new Scanner(System.in);

	public static void main(String[] args) {
		
		Integer entradaUsuario = 0;
		Boolean check = true;
		Integer suma = 0;
		
		do {
			System.out.println("Introduce un número entre 1 y 10: ");
			entradaUsuario = SC.nextInt();
			
			if (entradaUsuario <= 10 && entradaUsuario > 0) {
				for (int i = 1; i <= 10; i++) {
					
					if (i == 10) {
						System.out.print(i * entradaUsuario);
						suma += (i * entradaUsuario);
						break;
					}
					
					suma += i * entradaUsuario;
					System.out.print(i * entradaUsuario + " + ");
								
				}
				
				System.out.print(" = " + suma);
				check = false;
			}
			else if (entradaUsuario > 10 || entradaUsuario < 0) {
				System.out.println("El número no es correcto, vuelve a intentarlo: ");
			}
			else {
				System.out.println("Hasta luego");
				check = false;
			}
		} while (check);
	
	}

}
