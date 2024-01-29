/*
EJERCICIO 37

Una cola es una especie de lista donde entran y salen objetos. Cuando entra un objeto, se
añade al final. Cuando sale un objeto, sale el que más tiempo lleve esperando dentro. Igual
que cuando hacemos cola para entrar en algún lugar.

Crea la clase ColaCadenas que tenga estos dos métodos:

	- añadirCadena(): recibe una cadena y no devuelve nada. Se tendrá que añadir esa
	cadena a la cola de espera.
	- sacarCadena(): no recibe nada y devuelve una cadena. Tendrá que devolver la cadena
	que hace más tiempo que se añadió.
	- getTamaño(): no recibe nada y devuelve un entero con todos los elementos que hay
	en la cola.
	- toString(): debe imprimir el contenido de la cola
	
Implementa esta clase utilizando internamente un atributo de tipo List<String>.
Cuando la tengas lista, haz un programa para probarla con estos pasos (después de cada paso,
imprime la cola):

1. Crea un objeto cola.
2. Añade a la cola las palabras “primero” y “segundo”
3. Saca de la cola un elemento e imprímelo.
4. Añade a la cola la palabra “tercero”
5. Saca todos los elementos que queden en la cola e imprímelos.
6. Añade a la cola la palabra cuarto. 
*/
package ejercicios_básicos_ejercicio37;

import java.util.ArrayList;
import java.util.List;

public class ColaCadenas {

	private List<String> cola;

	String cadena;
	String colaDeEspera;

	public ColaCadenas() {
		cola = new ArrayList<>();
	}

//AñadirCadena(): recibe una cadena y no devuelve nada. Se tendrá que añadir esa cadena a la cola de espera.

	public void añadirCadena(String cadena) {
		cola.add(cadena);
	}

//sacarCadena(): no recibe nada y devuelve una cadena. Tendrá que devolver la cadena que hace más tiempo que se añadió.	

	public String sacarCadena() {
		if (cola.isEmpty()) {
			return null;
		}
		String cadena = cola.get(0);
		cola.remove(0);
		return cadena;
	}

//MÉTODOS GET Y SET

	public Integer getTamaño() {
		return cola.size();

	}

	@Override
	public String toString() {
		return cola.toString();
	}

//

}
