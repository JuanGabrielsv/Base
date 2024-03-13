package ejercicio_a;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Normal extends Cita {

	public Normal(LocalDate fecha, Integer hora, String nombrePaciente, Boolean seguroPrivado) {
		super(fecha, hora, nombrePaciente, seguroPrivado);
	}

	public Normal(String nombrePaciente) {
		super(nombrePaciente);
	}

	@Override
	public BigDecimal getImporteFactura() {
		if (this.getSeguroPrivado()) {
			return new BigDecimal(100);
		} else {
			return new BigDecimal(150);
		}

	}

}
