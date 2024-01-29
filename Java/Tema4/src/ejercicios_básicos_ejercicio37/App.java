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

public class App {

	public static void main(String[] args) {
		
		//1. Crea un objeto cola.
		ColaCadenas cola = new ColaCadenas();
		System.out.println("1:" + cola);
		
		//2.Añade a la cola las palabras primero y segundo
		cola.añadirCadena("primero");
		cola.añadirCadena("segundo");
		System.out.println("2:" + cola);

		//3 Saca de la cola un elemento e imprimelo.
		String elemento = cola.sacarCadena();
		System.out.println("3:" + elemento);
		System.out.println(cola);
		
		//4. Añade a la cola la palabra tercero
		cola.añadirCadena("tercero");
		System.out.println("4:" + cola);		
		
		//5. Saca todos los elementos que queden en la cola e imprímelos.
		while(cola.getTamaño() > 0) {
			elemento = cola.sacarCadena();
			System.out.println(elemento);
		}
		System.out.println("5:" + cola);
		
		//6. Añade a la cola la palabra cuarto.
		cola.añadirCadena("cuarto");
		System.out.println("6:" + cola);
		
	}
}
