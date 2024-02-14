/* EJERCICIO 20
Cambia el constructor de la clase para que reciba un parámetro String que sea el dni del
alumno. Es decir, cuando queramos crear un objeto Alumno, habrá que indicar
obligatoriamente su DNI. Modifica el programa que has creado para probar para que funcione
con este nuevo constructor.  */

package ejercicio20;

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

		System.out.println(alumno1);

	}

}
