/*
EJERCICIO 3
• Amplia el programa anterior creando una clase que sea SacoNumeros que tenga como atributo una lista de Integer. 
• Haz que tu aplicación use esta clase en lugar de tenerlo todo “apiñado”.
• La clase SacoNumeros tendrá que tener un método addNumero() que te permita ir añadiendo
  dichos números
• Otro método toString() que imprima todos los números.
• Una vez que lo tengas modificado, añade otro método que sea getNumero() que recibe un
  Integer que será la posición y devuelve el número que está en dicha posición.
• Haz que tu programa pregunte al usuario qué números quiere ver solicitando posiciones y se
  los muestre. Hasta que el usuario indique la posición -1. En tal caso, dejarás de preguntarle. 
*/
package ejercicios_básicos_03;

import java.util.ArrayList;
import java.util.List;

public class SacoNumeros {
	
	List<Integer> listaNumeros;
	
	//GETTERS AND SETTERS.

	public List<Integer> getListaNumeros() {
		return listaNumeros;
	}

	public void setListaNumeros(List<Integer> listaNumeros) {
		this.listaNumeros = listaNumeros;
	}
	
	//CONSTRUCTORES.
	
	public SacoNumeros() {
		listaNumeros = new ArrayList<Integer>();
	}
	
	//MÉTODOS.
	// La clase SacoNumeros tendrá que tener un método addNumero() que te permita ir añadiendo dichos números.
	
	public void addNumero(Integer numero) {
		this.getListaNumeros().add(numero);
	}
	
	// Otro método toString() que imprima todos los números.

	@Override
	public String toString() {
		return "SacoNumeros [listaNumeros=" + listaNumeros + "]";
	}
	
	// Una vez que lo tengas modificado, añade otro método que sea getNumero() que recibe un
	// Integer que será la posición y devuelve el número que está en dicha posición.
	
	public Integer getNumero(Integer posicion) {
		return this.getListaNumeros().get(posicion);
	}
	
	

}
