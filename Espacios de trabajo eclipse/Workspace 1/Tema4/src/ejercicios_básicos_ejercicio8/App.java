/*
EJERCICIO 8
Crea un nuevo método en la clase “Calculadora” que sea calcular. Recibirá tres parámetros:
- Una cadena que será “ADD”, “SUB”, “MUL” o “DIV”
- Dos números enteros
En función de la cadena recibida, se tendrá que sumar, restar, multiplicar o dividir los números
recibidos. Reutiliza los métodos ya creados en los ejercicios anteriores.
Declara las cadenas “ADD”, “SUB”, “MUL” o “DIV” como constantes.
Prueba el método nuevo con varias pruebas desde el main (usa las constantes).    
*/
package ejercicios_básicos_ejercicio8;
import java.util.Scanner;

public class App {	
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario = null;
		Integer num1 = null;
		Integer num2 = null;
		Integer resultado = null;
		Boolean check = false;
		
		do {
		
			System.out.println("MENÚ");
			System.out.println("1 SUMAR");
			System.out.println("2 RESTAR");
			System.out.println("3 MULTIPLICAR");
			System.out.println("4 DIVIDIR");
			entradaUsuario = sc.nextInt();
			
			if (entradaUsuario < 1 || entradaUsuario > 4) {
				System.err.println("Opción incorrecta, elige la opción correcta: 1, 2, 3, o 4");
				check = true;
			}
			else {
				check = false;
			}
		
		} while (check);
		
		System.out.println("Dame el primer número: ");
		num1 = sc.nextInt();
		System.out.println("Dame el segundo número: ");
		num2 = sc.nextInt();
		sc.close();
		
		if (entradaUsuario == 1) {
			resultado = Calculadora.calcular(Calculadora.SUMAR,num1,num2);
		}
		else if (entradaUsuario == 2) {
			resultado = Calculadora.calcular(Calculadora.RESTAR, num1, num2);
		}
		else if (entradaUsuario == 3) {
			resultado = Calculadora.calcular(Calculadora.MULTIPLICAR, num1, num2);
		}
		else if (entradaUsuario == 4) {
			resultado = Calculadora.calcular(Calculadora.DIVIDIR, num1,num2);
		}
		else {
			resultado = null;			
		}
		
		System.out.println(resultado);
		
		
		
		
		
		
			
	}	
}
