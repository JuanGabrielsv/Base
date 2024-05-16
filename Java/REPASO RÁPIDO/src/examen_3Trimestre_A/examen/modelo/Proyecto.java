package examen_3Trimestre_A.examen.modelo;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

public class Proyecto {

	private String codigoProyecto;
	private String descripcionProyecto;
	private LocalDate fechaInicioProyecto;
	private LocalDate fechaEntregaProyecto;
	private BigDecimal presupuestoProyecto;
	private BigDecimal costeActualProyecto;
	private List<Programador> listaProgramadoresProyecto;

	public String getCodigoProyecto() {
		return codigoProyecto;
	}

	public void setCodigoProyecto(String codigoProyecto) {
		this.codigoProyecto = codigoProyecto;
	}

	public String getDescripcionProyecto() {
		return descripcionProyecto;
	}

	public void setDescripcionProyecto(String descripcionProyecto) {
		this.descripcionProyecto = descripcionProyecto;
	}

	public LocalDate getFechaInicioProyecto() {
		return fechaInicioProyecto;
	}

	public void setFechaInicioProyecto(LocalDate fechaInicioProyecto) {
		this.fechaInicioProyecto = fechaInicioProyecto;
	}

	public LocalDate getFechaEntregaProyecto() {
		return fechaEntregaProyecto;
	}

	public void setFechaEntregaProyecto(LocalDate fechaEntregaProyecto) {
		this.fechaEntregaProyecto = fechaEntregaProyecto;
	}

	public BigDecimal getPresupuestoProyecto() {
		return presupuestoProyecto;
	}

	public void setPresupuestoProyecto(BigDecimal presupuestoProyecto) {
		this.presupuestoProyecto = presupuestoProyecto;
	}

	public BigDecimal getCosteActualProyecto() {
		return costeActualProyecto;
	}

	public void setCosteActualProyecto(BigDecimal costeActualProyecto) {
		this.costeActualProyecto = costeActualProyecto;
	}

	public List<Programador> getListaProgramadoresProyecto() {
		return listaProgramadoresProyecto;
	}

	public void setListaProgramadoresProyecto(List<Programador> listaProgramadoresProyecto) {
		this.listaProgramadoresProyecto = listaProgramadoresProyecto;
	}

}
