/*
Partido.
	o Atributos privados con métodos get y set:
		- equipoLocal -> Equipo
		- equipoVisitante -> Equipo
		- resultado -> Resultado
	o Constructor por defecto
	o Método toString para que se imprima algo tal que así:
	
		Real Madrid C.F. vs F.C.Barcelona [0 – 0]
		
	o Métodos:
		• getEquipoGanador() que devuelve el Equipo que haya ganado. Si hay empate, devolverá null.
*/
package ejercicios_básicos_ejercicio_41;

public class Partido {

	// Atributos privados con métodos get y set:
	// - equipoLocal -> Equipo
	// - equipoVisitante -> Equipo
	// - resultado -> Resultado

	private Equipo equipoLocal;
	private Equipo equipoVisitante;
	private Resultado resultado;
	
	//GETTERS AND SETTERS

	public Equipo getEquipoLocal() {
		return equipoLocal;
	}

	public void setEquipoLocal(Equipo equipoLocal) {
		this.equipoLocal = equipoLocal;
	}

	public Equipo getEquipoVisitante() {
		return equipoVisitante;
	}

	public void setEquipoVisitante(Equipo equipoVisitante) {
		this.equipoVisitante = equipoVisitante;
	}

	public Resultado getResultado() {
		return resultado;
	}

	public void setResultado(Resultado resultado) {
		this.resultado = resultado;
	}
	
	// CONTRUCTOR
	// Constructor por defecto.
	
	public Partido() {
		
	}
	
	// Método toString para que se imprima algo tal que así:
	// Real Madrid C.F. vs F.C.Barcelona [0 – 0]
	
	@Override
	public String toString() {
		return equipoLocal.getNombreEquipo() + " vs " + equipoVisitante.getNombreEquipo() + " [" + resultado + "]";
	}
	
	// MÉTODOS.
	// getEquipoGanador() que devuelve el Equipo que haya ganado. Si hay empate, devolverá null.
	
	public Equipo getEquipoGanador() {
		if (this.getResultado().getGolesLocales() > this.getResultado().getGolesVisitante()) {
			return this.getEquipoLocal();
		} else if (this.getResultado().getGolesLocales() < this.getResultado().getGolesVisitante()) {
			return this.getEquipoVisitante();
		} else {
			return null;
		}
	}
	
	
	
	

}
