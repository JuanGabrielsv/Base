package tema2_depuracion_entregable;
import java.util.Scanner;

public class T2_depuracion_entregable {
	public static void main(String[]args) {
		
		Scanner sc = new Scanner (System.in);
		Integer numeroUsuario = 0;
		Integer numeroUsuario2 = 0;
		Integer x = 0;
		boolean check = true;
		String entradaUsuario = "";
		Integer mayor = 0;
		
		do {
			System.out.println("Escribe la palabra 'empezar' para iniciar el programa: ");
			entradaUsuario = sc.nextLine();
			
			if (entradaUsuario .equalsIgnoreCase("empezar")) { 
				check = false;
			}
			else {
				System.out.println("Datos incorrectos, vuelva a introducir la palabra 'empezar'");
				check = true;
			}
		}
		while (check == true);
		
		System.out.println("Introduce un número entero:");
		numeroUsuario = sc.nextInt();
		
		System.out.println("Introduce un segundo número entero:");
		numeroUsuario2 = sc.nextInt();
		
		if (numeroUsuario > numeroUsuario2) {
			System.out.println(numeroUsuario + " es el mayor");
			System.out.println();
			mayor = numeroUsuario;
			
		} 
		else if (numeroUsuario == numeroUsuario2) {
			System.out.println("Los números son iguales");
			System.out.println();
			mayor = numeroUsuario;
			
		}
		else {
			System.out.println(numeroUsuario2 + " es el mayor");
			System.out.println();
			mayor = numeroUsuario2;
		}
		
		for (x = 1; x <= 10; x++) {
			System.out.println(mayor + " X " + x + " = " + (mayor * x)); 
			sc.close();
		}
	
	}

}
