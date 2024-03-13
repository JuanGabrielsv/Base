package ejercicio_a;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

public abstract class Cita {

	private LocalDate fecha;
	private Integer hora;
	private String nombrePaciente;
	private Boolean seguroPrivado;
	private Boolean facturado;

	public Cita(String nombrePaciente) {
		this.nombrePaciente = nombrePaciente;
		this.seguroPrivado = false;
		this.facturado = false;
	}

	public Cita(LocalDate fecha, Integer hora, String nombrePaciente, Boolean seguroPrivado) {
		this.fecha = fecha;
		this.hora = hora;
		this.nombrePaciente = nombrePaciente;
		this.seguroPrivado = seguroPrivado;
		this.facturado = false;
	}

	public abstract BigDecimal getImporteFactura();

	public Integer getDiasHastaCita() {		
		LocalDate date = LocalDate.now();
		
		if (getFecha().isAfter(date)) {
			return date.until(this.fecha).getDays();
		} else {
			return -1;
		}
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public Integer getHora() {
		return hora;
	}

	public void setHora(Integer hora) {
		this.hora = hora;
	}

	public String getNombrePaciente() {
		return nombrePaciente;
	}

	public void setNombrePaciente(String nombrePaciente) {
		this.nombrePaciente = nombrePaciente;
	}

	public Boolean getSeguroPrivado() {
		return seguroPrivado;
	}

	public void setSeguroPrivado(Boolean seguroPrivado) {
		this.seguroPrivado = seguroPrivado;
	}

	public Boolean getFacturado() {
		return facturado;
	}

	public void setFacturado(Boolean facturado) {
		this.facturado = facturado;
	}

	@Override
	public int hashCode() {
		return Objects.hash(fecha, hora);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cita other = (Cita) obj;
		return Objects.equals(fecha, other.fecha) && Objects.equals(hora, other.hora);
	}

	@Override
	public String toString() {

		DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		String snSeguro;

		if (getSeguroPrivado()) {
			snSeguro = "CON SEGURO";
		}
		snSeguro = "SIN SEGURO";

		return nombrePaciente + " - " + fecha.format(formatoFecha) + " - " + hora + " horas - " + snSeguro;
	}

}
