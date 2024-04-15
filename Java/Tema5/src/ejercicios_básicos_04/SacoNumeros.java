/*
EJERCICIO 4
En el programa anterior, cuando te han indicado una posición que no existe en la lista, salta
una excepción y el programa termina. Captura dicha excepción para que en tal caso el número
devuelto sea null.  
*/
package ejercicios_básicos_04;

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
		this.listaNumeros = new ArrayList<Integer>();
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
		try {
			return this.listaNumeros.get(posicion);			
		} catch (IndexOutOfBoundsException e) {
			return null;			
		}	
		
	}
	
	

}
