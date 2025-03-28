/* EJERCICIO 9
Realizar un programa que solicite al usuario su nombre completo. A continuación, mostrarle
por separado cuál es su nombre, su primer apellido y su segundo apellido. Lo haremos
separando por espacios en blanco (basta con que funcione con nombres y apellidos simples,
por ejemplo, Abel Morillo Sánchez. No funcionaría con nombres como María del Carmen Ruiz
de los Mozos Santos).  */

/*
 1 PEDIR EL NOMBRE AL USUARIO.
 2 ALMACENAR NOMBRE AL USUARIO.
 3 SEPARAR POR ESPACIOS EL NOMBRE DADO POR EL USUARIO.
 4 IMPRIMIR CUAL ES NOMBRE Y APELLIDOS. 
*/

package t2_ejercicios_practicos;

import java.util.Scanner;

public class T2_Ejercicios_practicos9 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner (System.in);
		String entradaUsuario;
		
		System.out.println("Introduce tu nombre: ");
		entradaUsuario = sc.nextLine();
		
		Integer indexPrimerEspacio = entradaUsuario.indexOf(" ");
		Integer indexSegundoEspacio = entradaUsuario.lastIndexOf(" ");
		
		String nombre = entradaUsuario.substring(0, indexPrimerEspacio);
		String apellido1 = entradaUsuario.substring(indexPrimerEspacio+1, indexSegundoEspacio);
		String apellido2 = entradaUsuario.substring(indexSegundoEspacio+1);
		
		System.out.println("Nombre: " + nombre);
		System.out.println("Primer apellido: " + apellido1);
		System.out.println("Segundo apellido: " + apellido2);
		
		sc.close();
	}

}
