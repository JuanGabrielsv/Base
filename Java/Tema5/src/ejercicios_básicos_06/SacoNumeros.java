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
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

public class SacoNumeros {
	
	List<Integer> lNumeros;
	
	//GETTERS AND SETTERS.

	public List<Integer> getListaNumeros() {
		return lNumeros;
	}

	public void setListaNumeros(List<Integer> listaNumeros) {
		this.lNumeros = listaNumeros;
	}
	
	//CONSTRUCTORES.
	
	public SacoNumeros() {
		this.lNumeros = new ArrayList<Integer>();
	}
	
	//MÉTODOS.
	// La clase SacoNumeros tendrá que tener un método addNumero() que te permita ir añadiendo dichos números.
	
	public void addNumero(Integer numero) {
		this.getListaNumeros().add(numero);
	}
	
	// Otro método toString() que imprima todos los números.

	@Override
	public String toString() {
		return "SacoNumeros [listaNumeros=" + lNumeros + "]";
	}
	
	// Una vez que lo tengas modificado, añade otro método que sea getNumero() que recibe un
	// Integer que será la posición y devuelve el número que está en dicha posición.
	
	public Integer getNumero(Integer posicion) {
		try {
			return this.lNumeros.get(posicion);			
		} catch (IndexOutOfBoundsException e) {
			return null;			
		}	
		
	}
	
	public BigDecimal division() {
		try {		
			BigDecimal division = new BigDecimal(lNumeros.get(0));
			for (int i = 1; i < lNumeros.size(); i++) {
				BigDecimal siguiente = new BigDecimal(lNumeros.get(i));
				division = division.divide(siguiente, 2, RoundingMode.HALF_UP);			
			}		
			return division;
		} catch (ArithmeticException e) {
			return BigDecimal.ZERO;
		} catch (IndexOutOfBoundsException e) {
			return BigDecimal.ZERO;
		} finally {
			System.out.println("División completa");
		}
	}
	
	

}
