/* EJERCICIO 19
Añade a la clase del ejercicio anterior un método público aprobar() que establecerá la nota en
un 5. Úsalo desde el programa que has creado para probar. */

package ejercicio19;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		String entradaUsuario;
		Alumno alumno1 = new Alumno();

		System.out.println("1/4 Introduce el dni del Alumno: ");
		entradaUsuario = sc.nextLine();
		alumno1.setDni(entradaUsuario);

		System.out.println("2/4 Introduce el nombre del Alumno: ");
		entradaUsuario = sc.nextLine();
		alumno1.setNombre(entradaUsuario);

		System.out.println("3/4 Introduce la edad del Alumno: ");
		entradaUsuario = sc.nextLine();
		alumno1.setEdad(Integer.parseInt(entradaUsuario));

		System.out.println("4/4 Introduce la nota del Alumno: ");
		entradaUsuario = sc.nextLine();
		alumno1.setNota(Double.parseDouble(entradaUsuario));
		sc.close();

		alumno1.aprobar();

		System.out.println(alumno1);

	}

}
