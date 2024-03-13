package ejercicio_a;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Revision extends Cita {

	private Integer numeroRevision;

	public Revision(LocalDate fecha, Integer hora, String nombrePaciente, Boolean seguroPrivado) {
		super(fecha, hora, nombrePaciente, seguroPrivado);
	}

	public Revision(String nombrePaciente) {
		super(nombrePaciente);
	}

	public Integer getNumeroRevision() {
		return numeroRevision;
	}

	public void setNumeroRevision(Integer numeroRevision) {
		this.numeroRevision = numeroRevision;
	}

	@Override
	public BigDecimal getImporteFactura() {
		return new BigDecimal(50 + (10 * getNumeroRevision()));
	}

}
