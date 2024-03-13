/*
EJERCICIO 38

Una pila es una especie de lista donde entran y salen objetos. Cuando entra un objeto, se
añade encima de la pila. Cuando sale un objeto, sale el que menos tiempo lleve esperando
dentro. Como si fuera una pila de platos o de documentos. El último que pongo encima será el
primero que coja.

Crea la clase PilaCadenas que tenga estos dos métodos:

1. añadirCadena(): recibe una cadena y no devuelve nada. Se tendrá que añadir esa cadena a la pila de espera.
2. sacarCadena(): no recibe nada y devuelve una cadena. Tendrá que devolver la palabra que hace menos tiempo que se añadió.
3. getTamaño(): no recibe nada y devuelve un entero con todos los elementos que hay en la pila.
4. toString(): debe imprimir el contenido de la pila.
5. Implementa esta clase utilizando internamente un atributo de tipo List<String>.
6. Cuando la tengas lista, haz un programa para probarla con estos pasos (después de cada paso, imprime la pila):
7. Crea un objeto pila.
8. Añade a la pila las palabras “primero” y “segundo”
9. Saca de la pila un elemento e imprímelo.
10. Añade a la pila la palabra “tercero”
11. Saca todos los elementos que queden en la pila e imprímelos.
12. Añade a la pila la palabra cuarto.  
*/

package ejercicios_básicos_ejercicio_38;

public class App {

	public static void main(String[] args) {

		// 7. Crea un objeto pila.
		PilaCadenas pila = new PilaCadenas();
		System.out.println("7:" + pila);

		// 8. Añade a la pila las palabras “primero” y “segundo”
		pila.añadirCadena("primero");
		pila.añadirCadena("segundo");
		System.out.println("8:" + pila);

		// 9. Saca de la pila un elemento e imprímelo.
		String elemento = pila.sacarCadena();
		System.out.println("9:" + elemento);
		System.out.println(pila);

		// 10. Añade a la pila la palabra “tercero”
		pila.añadirCadena("tercero");
		System.out.println("10:" + pila);

		// 11. Saca todos los elementos que queden en la pila e imprímelos.
		while (pila.getTamaño() > 0) {
			elemento = pila.sacarCadena();
			System.out.println(elemento);
		}
		System.out.println("11:" + pila);

		// 12. Añade a la pila la palabra cuarto.
		pila.añadirCadena("cuarto");
		System.out.println("12:" + pila);

	}
}
