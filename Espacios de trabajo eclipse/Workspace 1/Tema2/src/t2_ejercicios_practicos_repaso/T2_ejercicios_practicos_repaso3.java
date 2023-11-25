/* EJERCICIO 3
Realizar un programa que muestre por consola un menú de opciones al usuario como este:
*** MENÚ ***
1. Abrir
2. Guardar
3. Modificar
4. Salir
A continuación, nos quedaremos esperando la opción indicada mediante un número. En
función de lo que elija, haremos lo siguiente:
 Si elige una opción entre el 1 y el 3  Escribiremos en consola que se ha elegido la
opción que sea (Abrir, Guardar, Modificar) y volveremos a mostrar de nuevo el menú.
 Si elige la opción 4  Escribiremos “Bye Bye” y el programa terminará.
 Si elige otra opción cualquiera  Escribiremos que esa opción de menú no es correcta.
Y volveremos a mostrar el menú.  */
package t2_ejercicios_practicos_repaso;

import java.util.Scanner;

public class T2_ejercicios_practicos_repaso3 {
	
	public static final Scanner SC = new Scanner(System.in);

	public static void main(String[] args) {
		
		Integer entradaUsuario = 0;
		Boolean check = true;
		
		do {			
			System.out.println("*** MENÚ ***");
			System.out.println("1. Abrir");
			System.out.println("2. Guardar");
			System.out.println("3. Modificar");
			System.out.println("4. Salir");
			entradaUsuario = SC.nextInt();
			
			switch (entradaUsuario) {
			case 1:
				System.out.println("Has elegido 'Abrir'");
				System.out.println();
				break;
			case 2:
				System.out.println("Has elegido 'Guardar'");
				System.out.println();
				break;
			case 3:
				System.out.println("Has elegido 'Modificar'");
				System.out.println();
			}
			
			
			
			
		}
		while (check);
		
		

	}

}
