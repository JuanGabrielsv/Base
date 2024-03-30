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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Diccionario {

	private Map<String, List<String>> diccionario;
	
	//CONSTRUCTOR
	
	public Diccionario() {
		this.diccionario = new HashMap<String, List<String>>();
	}

	// MÉTODOS

	// Añade un método que se llame cargarDiccionario() que reciba una List<String> con la lista
	// de palabras que se quieren cargar (habrá palabras que empiecen por diferentes letras).

	public void cargarDiccionario(List<String> lista) {
		
		for (String palabra : lista) {
			
			String minusculas = palabra.toLowerCase();
			String key = minusculas.substring(0, 1);
			
			if (diccionario.containsKey(key)) {
				diccionario.get(key).add(palabra);
			} else if (!diccionario.containsKey(key)) {
				diccionario.put(key, new ArrayList<String>());
				diccionario.get(key).add(palabra);
			}
		}
	}
	
	// Añade otro método que sea borrarDiccionario() y borre todo.
	
	public void borrarDiccionario() {
		this.diccionario.clear();
	}
	
	// Añade otro método que sea imprimirPalabras() que reciba un String con la letra que queremos imprimir.
	
	public void imprimirPalabras(String letra) {
		String minus = letra.toLowerCase();
		
		if (diccionario.containsKey(minus)) {						
			System.out.println(diccionario.get(minus));
		}		
	}

	@Override
	public String toString() {
		return "Diccionario [diccionario=" + diccionario + "]";
	}
	
	
}
