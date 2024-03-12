package examen_a;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Normal extends Cita {

	public Normal(LocalDate fecha, Integer hora, String nombrePaciente, Boolean seguroMedico) {
		super(fecha, hora, nombrePaciente, seguroMedico);
	}

	public Normal(String nombrePaciente) {
		super(nombrePaciente);
	}

	@Override
	public BigDecimal getImporteFactura() {
		if (getSeguroPrivado()) {
			return new BigDecimal(100);
		}
		return new BigDecimal(150);
	}

}
