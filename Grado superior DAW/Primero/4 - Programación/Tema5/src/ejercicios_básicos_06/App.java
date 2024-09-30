/*
EJERCICIO 6
Construye la clase Persona que tenga como atributos el género (String) y la altura (BigDecimal).
Crea método toString() y sus métodos get() y set() teniendo en cuenta que:

• El método setGenero() sólo admitirá recibir por parámetro el valor H o M. 
  Si recibe cualquier otra cosa, tendrá que lanzar una excepción nueva llamada
  “ParametroIncorrectoException” indicando el detalle del error.
  
• El método setAltura() solo admitirá un BigDecimal comprendido entre 0 y 3, ambos
  excluidos. Si recibe cualquier otra cosa, tendrá que lanzar también una
  ParametroIncorrectoException indicando el detalle del error.
  
Haz una aplicación para permitir al usuario crear Personas indicando los datos por consola.
Cuando lo haga, imprime los datos. Controla las excepciones que pueden originarse e imprime
el mensaje de error correspondiente. 
*/
package ejercicios_básicos_06;

import java.math.BigDecimal;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		try {
			Persona persona = new Persona();
			while (true) {
				try {
					System.out.println("Indícame los datos de la persona. Empieza con el género (H/M)");
					String genero = sc.nextLine();
					persona.setGenero(genero);
					System.out.println("Dime la altura: ");
					BigDecimal altura = sc.nextBigDecimal();
					sc.nextLine();
					persona.setAltura(altura);
					System.out.println("Tu persona: " + persona);
					System.out.println("¿Quieres salir? (S)");
					if (sc.nextLine().equals("S")) {
						break;
					}
				} catch (ParametroIncorrectoException e) {
					System.err.println(e.getMessage());
				}
			}
		} finally {
			sc.close();
		}

	}

}
