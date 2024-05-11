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

import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Integer entradaUsuario;
		Boolean check = true;
		SacoNumeros listaNumeros = new SacoNumeros();

		try {
			do {
				try {
					System.out.println("INTRODUCE UN NÚMERO ENTERO: ");
					entradaUsuario = Integer.parseInt(sc.nextLine());
					if (entradaUsuario.equals(-1)) {
						check = false;
					} else {
						listaNumeros.addNumero(entradaUsuario);
					}
				} catch (NumberFormatException e) {
					System.out.println("Debes introducir un número entero, no valen letras, ni espacios en blanco.");
				}
			} while (check);

			System.out.println(listaNumeros);
			check = true;

			do {
				try {
					Integer entradaUsuario2;
					System.out.println("INTRODUCE UN NÚMERO ENTERO QUE INDICA LA POSICIÓN EN LA LISTA: ");
					entradaUsuario2 = Integer.parseInt(sc.nextLine());
					if (entradaUsuario2 == -1) {
						System.out.println("- SALIENDO DEL PROGRAMA -");
						check = false;
					} else {
						System.out.println(listaNumeros.getNumero(entradaUsuario2));
					}						
				} catch (NumberFormatException y) {
					System.err.println("NO SE ADMITE INTRODUCIR UN ESPACIO EN BLANCO o NO INTRODUCIR NADA");
				} 
			} while (check);
			
			System.out.println(listaNumeros.division());
			
		} finally {
			sc.close();
			System.out.println("Escaner cerrado correctamente");
		}

	}

}

