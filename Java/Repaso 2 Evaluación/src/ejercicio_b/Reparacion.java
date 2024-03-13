package ejercicio_b;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Reparacion extends EntradaCoche {

	public Reparacion(String matricula, Boolean garantia) {
		super(matricula, garantia);
	}

	public Reparacion(LocalDate fecha, String matricula, Boolean garantia) {
		super(fecha, matricula, garantia);
	}

	@Override
	public BigDecimal getPrecioTrabajo() {

		if (this.getGarantia()) {
			return new BigDecimal(0);
		} else {
			return new BigDecimal(50 * getTiempoEstimado());
		}

	}

}
