/*
EJERCICIO 58

Imagino que habrás hecho el ejercicio anterior con una única clase todo apiñado en el método
main… como si acabaras de entrar al curso. Me has defraudado...

Modifícalo para que quede un programa más presentable:
	• Crea una clase diccionario que tenga como atributo el mapa.
	• Añade un método que se llame cargarDiccionario() que reciba una List<String> con la lista
	  de palabras que se quieren cargar (habrá palabras que empiecen por diferentes letras).
	• Añade otro método que sea borrarDiccionario() y borre todo.
	• Añade otro método que sea imprimirPalabras() que reciba un String con la letra que
	  queremos imprimir.
	  
En general, aplica siempre un divide y vencerás. Intenta dividir tus problemas en clases y
métodos. 

*/

package ejercicios_básicos_ejercicio_58;

import java.util.ArrayList;
import java.util.List;

public class App {

	public static void main(String[] args) {
		
		List<String> palabras = new ArrayList<String>();		
		
		palabras.add("Tomate");
		palabras.add("todo");
		palabras.add("lechuga");
		palabras.add("Luna");
		palabras.add("Pared");
		palabras.add("pelo");
		
		Diccionario diccionario = new Diccionario();		
		diccionario.cargarDiccionario(palabras);
		
		System.out.println(diccionario);
		
		diccionario.imprimirPalabras("L");
		
		//System.out.println(diccionario.imprimirPalabras("t"));
		
		diccionario.borrarDiccionario();	
	}

}
