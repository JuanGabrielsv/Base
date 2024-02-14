/* EJERCICIO 51
Crea un programa que haga lo siguiente:

1. Solicita al usuario 5 números BigDecimal y los metes en una lista. Cada número que te
   proporcione tiene que se mayor al anterior, si no es así, vuelve a solicitarlo.
2. Cuando termines, imprime la suma de todos los números. La suma debe estar
   redondeada a 1 decimal con HALF_DOWN
3. Luego imprime la división del primer número entre el segundo, redondeando el
   resultado a 3 decimales con HALF_UP. */

package ejercicios_básicos_ejercicio51;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);		
		List<BigDecimal> decimal = new ArrayList<>();
		boolean check = true;
		
		do {
			
			for (int i = 0; i < 5; i++) {
				System.out.println(i + " de 5 Introduce un número;");
				decimal.add(sc.nextBigDecimal());
				if (1 =) {
					
				}
			}
			
			
			
		} while (check);	
		
		
		System.out.println(decimal);
		
		
	}	

}

/*System.out.println("1 de 5 - Introduce un número: ");
decimal.add(sc.nextBigDecimal());
System.out.println("2 de 5 - Introduce un número mayor que el anterior: ");
decimal.add(sc.nextBigDecimal());
System.out.println("3 de 5 - Introduce un número mayor que el anterior: ");
decimal.add(sc.nextBigDecimal());
System.out.println("4 de 5 - Introduce un número mayor que el anterior: ");
decimal.add(sc.nextBigDecimal());
System.out.println("5 de 5 - Introduce un número mayor que el anterior: ");
decimal.add(sc.nextBigDecimal());*/
