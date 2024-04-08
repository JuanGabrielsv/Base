package SIN_TERMINAR_ejercicios_básicos_06;

import java.lang.reflect.Parameter;
import java.math.BigDecimal;
import java.security.InvalidParameterException;

public class Persona {

	// Construye la clase Persona que tenga como atributos el género (String) y la altura (BigDecimal).

	private String genero = "";
	BigDecimal altura = BigDecimal.ZERO;

	// GETTERS AND SETTERS

	public String getGenero() {
		return genero;
	}
	
	// El método setGenero() sólo admitirá recibir por parámetro el valor H o M. Si recibe
    // cualquier otra cosa, tendrá que lanzar una excepción nueva llamada
    // “ParametroIncorrectoException” indicando el detalle del error.
	
	public void setGenero(String genero) {
		try {
			if (genero.equals("H") || genero.equals("M")) {
				this.genero = genero;
			} else {
				throw new InvalidParameterException("El caracter introducido debe ser H o M, en mayúsculas.");
			}	
		} catch (InvalidParameterException e) {
			System.out.println("El caracter introducido debe ser H o M, en mayúsculas.");			
		}
	}		

	public BigDecimal getAltura() {
		return altura;
	}
	
	// El método setAltura() solo admitirá un BigDecimal comprendido entre 0 y 3, ambos
	// excluidos. Si recibe cualquier otra cosa, tendrá que lanzar también una
	// ParametroIncorrectoException indicando el detalle del error.

	public void setAltura(BigDecimal altura) {
		this.altura = altura;
	}	
		
	// TO STRING
	
	@Override
	public String toString() {
		return "Persona [genero=" + genero + ", altura=" + altura + "]";
	}
	
	
	
	

}
