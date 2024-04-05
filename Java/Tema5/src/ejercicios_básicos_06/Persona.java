package ejercicios_básicos_06;

import java.math.BigDecimal;

public class Persona {

	// Construye la clase Persona que tenga como atributos el género (String) y la altura (BigDecimal).

	private String genero = "";
	BigDecimal altura = BigDecimal.ZERO;

	// GETTERS AND SETTERS

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public BigDecimal getAltura() {
		return altura;
	}

	public void setAltura(BigDecimal altura) {
		this.altura = altura;
	}
		
	// TO STRING
	
	@Override
	public String toString() {
		return "Persona [genero=" + genero + ", altura=" + altura + "]";
	}
	
	
	
	

}
