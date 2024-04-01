/*
Resultado.
	o Atributos privados con métodos get y set:
		• golesLocales -> Integer
		• golesVisitante -> Integer
	o Constructor por defecto que inicializa el resultado a 0
	o Método equals que compare los dos atributos
	o Método toString para que se imprima algo tal que así: 0 – 0
	o Métodos:
		• isVictoriaLocal() que devuelve Boolean si han ganado los locales
		• isVictoriaVisitante() que devuelve Boolean si han ganado los visitantes
		• isEmpate() que devuelve Boolean si ha sido empate.
*/
package ejercicios_básicos_ejercicio_41;

import java.util.Objects;

public class Resultado {

	// Atributos privados con métodos get y set:
	// golesLocales -> Integer
	// golesVisitante -> Integer

	private Integer golesLocales;
	private Integer golesVisitante;

	// Constructor por defecto que inicializa el resultado a 0.

	public Resultado() {
		this.golesLocales = 0;
		this.golesVisitante = 0;
	}

	// GETTERS AND SETTERS.

	public Integer getGolesLocales() {
		return golesLocales;
	}

	public void setGolesLocales(Integer golesLocales) {
		this.golesLocales = golesLocales;
	}

	public Integer getGolesVisitante() {
		return golesVisitante;
	}

	public void setGolesVisitante(Integer golesVisitante) {
		this.golesVisitante = golesVisitante;
	}

	@Override
	public int hashCode() {
		return Objects.hash(golesLocales, golesVisitante);
	}
	
	// Método equals que compare los dos atributos.
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Resultado other = (Resultado) obj;
		return Objects.equals(golesLocales, other.golesLocales) && Objects.equals(golesVisitante, other.golesVisitante);
	}
	
	// Método toString para que se imprima algo tal que así: 0 – 0.

	@Override
	public String toString() {
		return golesLocales + " - " + golesVisitante;
	}
	
	// MÉTODOS
	
	// isVictoriaLocal() que devuelve Boolean si han ganado los locales.
	
	public Boolean isVictoriaLocal() {
		if (this.getGolesLocales() > this.getGolesVisitante()) {
			return true;
		} else {
			return false;
		}
	}
	
	// isVictoriaVisitante() que devuelve Boolean si han ganado los visitantes.
	
	public Boolean isVictoriaVisitante() {
		if (this.getGolesVisitante() > this.getGolesLocales()) {
			return true;
		} else {
			return false;
		}
	}
	
	// isEmpate() que devuelve Boolean si ha sido empate.
	
	public Boolean isEmpate() {
		if (this.golesLocales.equals(golesVisitante)) {
			return true;
		} else {
			return false;
		}
	}	

}
