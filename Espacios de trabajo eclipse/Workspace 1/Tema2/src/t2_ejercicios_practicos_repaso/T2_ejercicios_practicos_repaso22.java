/*
EJERCICIO 22
Realiza un programa que muestre por consola los números del 1 al 10. Pero lo hará a medida
que el usuario lo vaya solicitando. Es decir, se mostrará el 1 y parará. Cuando el usuario pulse
ENTER, se mostrará 2 y parará. Cuando el usuario pulse ENTER, se mostrará 3 y parará. Y así
continuamente hasta el 10. 
 */
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso22 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		String entradaUsuario = "";

		for (int i = 1; i <= 10; i++) {
			System.out.print(i);
			entradaUsuario = sc.nextLine();
		}
		sc.close();
	}

}
