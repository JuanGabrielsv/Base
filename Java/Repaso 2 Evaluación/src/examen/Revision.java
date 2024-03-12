package examen;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Revision extends EntradaCoche {

	private Integer kilometros;

	public Revision(String matricula, Boolean garantia) {
		super(matricula, garantia);
	}

	public Revision(LocalDate fecha, String matricula, Boolean garantia) {
		super(fecha, matricula, garantia);
	}

	@Override
	public BigDecimal getPrecioTrabajo() {
		return new BigDecimal(200);
	}

	public Integer getKilometros() {
		return kilometros;
	}

	public void setKilometros(Integer kilometros) {
		this.kilometros = kilometros;
	}
	
	
	

}
