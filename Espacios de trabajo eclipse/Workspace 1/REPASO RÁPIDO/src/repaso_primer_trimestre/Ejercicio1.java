package repaso_primer_trimestre;

import java.util.Scanner;

public class Ejercicio1 {
	

	public static void main(String[] args) {
		
		
		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario = 0;
		
		System.out.println("Introduce un número entero: ");
		entradaUsuario = sc.nextInt();
		
		for (int i = 1; i <= entradaUsuario; i++) {
			
			for (int j = 1; j <= entradaUsuario; j++) {
				
				if (i == 1)	{
					System.out.print("*");
				} 
				else {
					
					if (j == 1 || j == entradaUsuario) {
						System.out.print("*");
					}
					
					else {
						System.out.print(" ");
					}	
				}							
				
			}		
			
			System.out.println();			
		}
		
		
	}

}
