package ejercicio_refactorizacion;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario;
		String tramo = "";

		System.out.println("Introduce la cuantía a declarar: ");
		entradaUsuario = Integer.parseInt(sc.nextLine());		

		tramo = CalcularTramo.calcularTramo(entradaUsuario, tramo);

		System.out.println("Estás en el " + tramo);
		sc.close();

	}	

}
