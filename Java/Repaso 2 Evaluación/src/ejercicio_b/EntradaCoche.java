package ejercicio_b;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

public abstract class EntradaCoche {

	private LocalDate fecha;
	private String matricula;
	private Integer tiempoEstimado;
	private Boolean garantia;
	private Boolean terminado;
	private Boolean entregado;

	public EntradaCoche(String matricula, Boolean garantia) {
		this.matricula = matricula;
		this.garantia = garantia;
		this.fecha = LocalDate.now();
		this.terminado = false;
		this.entregado = false;
	}

	public EntradaCoche(LocalDate fecha, String matricula, Boolean garantia) {
		this.matricula = matricula;
		this.garantia = garantia;
		this.fecha = fecha;
		this.terminado = false;
		this.entregado = false;
	}

	// MÉTODOS GET AND SET

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public Integer getTiempoEstimado() {
		return tiempoEstimado;
	}

	public void setTiempoEstimado(Integer tiempoEstimado) {
		this.tiempoEstimado = tiempoEstimado;
	}

	public Boolean getGarantia() {
		return garantia;
	}

	public void setGarantia(Boolean garantia) {
		this.garantia = garantia;
	}

	public Boolean getTerminado() {
		return terminado;
	}

	public void setTerminado(Boolean terminado) {
		this.terminado = terminado;
	}

	public Boolean getEntregado() {
		return entregado;
	}

	public void setEntregado(Boolean entregado) {
		this.entregado = entregado;
	}

	public abstract BigDecimal getPrecioTrabajo();

	public Integer getDiasTaller() {

		LocalDate now = LocalDate.now();

		if (this.fecha.isBefore(now)) {
			return this.fecha.until(now).getDays();
		}
		return 0;
	}

	@Override
	public int hashCode() {
		return Objects.hash(fecha, matricula);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EntradaCoche other = (EntradaCoche) obj;
		return Objects.equals(fecha, other.fecha) && Objects.equals(matricula, other.matricula);
	}

	@Override
	public String toString() {

		DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		String sinoGarantia;
		String sinoTerminado;

		if (this.garantia) {
			sinoGarantia = "EN GARANTIA";
		} else {
			sinoGarantia = "SIN GARANTIA";
		}

		if (this.terminado) {
			sinoTerminado = "TERMINADO";
		} else {
			sinoTerminado = "PENDIENTE";
		}

		return matricula.toUpperCase() + " - " + fecha.format(formato) + " - " + sinoGarantia + " - " + sinoTerminado;
	}

}
