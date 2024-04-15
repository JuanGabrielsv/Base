/*
EJERCICIO 5

Añade a tu clase un método que sea division() que devuelva un BigDecimal con el resultado de
dividir el primer número de la lista entre el segundo, y el resultado entre el tercero, y el
resultado entre el cuarto, y así sucesivamente hasta terminar la lista. El resultado de cada
división parcial estará siempre redondeado a 2 decimales con HALF_UP.

Si te encuentras con algún valor que sea 0, la división fallará. Captura la excepción para que en
ese caso el resultado sea igual a cero.

Prueba el nuevo método llamando desde tu programa tras lo hecho en el Ejercicio 4.  
*/
package SIN_TERMINAR_ejercicios_básicos_05;

import java.math.BigDecimal;
import java.math.RoundingMode;
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
	
	/* Añade a tu clase un método que sea division() que devuelva un BigDecimal con el resultado de
	dividir el primer número de la lista entre el segundo, y el resultado entre el tercero, y el
	resultado entre el cuarto, y así sucesivamente hasta terminar la lista. El resultado de cada
	división parcial estará siempre redondeado a 2 decimales con HALF_UP.

	Si te encuentras con algún valor que sea 0, la división fallará. Captura la excepción para que en
	ese caso el resultado sea igual a cero. */
	
	public BigDecimal division() {		
		BigDecimal resultado = new BigDecimal(this.listaNumeros.get(0) / this.listaNumeros.get(1));
		for (int i = 0; i < this.listaNumeros.size(); i++) {											
			if (this.listaNumeros.get(i) == 0) {
				return BigDecimal.ZERO;
			} else if (i != 0 && i != 1) {
				BigDecimal num = new BigDecimal(this.listaNumeros.get(i));
				resultado = resultado.divide(num, 2, RoundingMode.HALF_UP);
			}
		}
		return resultado;		
	}
	
	

}
