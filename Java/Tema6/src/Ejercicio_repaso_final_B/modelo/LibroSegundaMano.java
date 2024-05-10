package Ejercicio_repaso_final_B.modelo;

public class LibroSegundaMano extends Libro {

	Integer antiguedad;

	public Integer getAntiguedad() {
		return antiguedad;
	}

	public void setAntiguedad(Integer antiguedad) {
		this.antiguedad = antiguedad;
	}
	
	@Override
	public String getTipo() {
		return SEGUNDA_MANO;
	}

}
