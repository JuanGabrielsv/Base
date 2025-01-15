package examen_3Trimestre_A.examen.modelo;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Proyecto {

	private String codigoProyecto;
	private String descripcionProyecto;
	private LocalDate fechaInicioProyecto;
	private LocalDate fechaEntregaProyecto;
	private BigDecimal presupuestoProyecto;
	private BigDecimal costeActualProyecto;
	private List<Programador> listaProgramadoresProyecto;

	public Proyecto(String codigo, String descripcion) {
		this.codigoProyecto = codigo;
		this.descripcionProyecto = descripcion;
		this.listaProgramadoresProyecto = new ArrayList<Programador>();
	}

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

	public Integer getDuracion() {
		Period periodo = this.fechaInicioProyecto.until(fechaEntregaProyecto);
		Integer meses = periodo.getYears() * 12;
		meses += periodo.getMonths();
		return meses;
	}

	public BigDecimal getPresupuestoRestante() {
		BigDecimal vPresupuestoRestanteProyecto = BigDecimal.ZERO;
		if (this.getPresupuestoProyecto().compareTo(getCosteActualProyecto()) == -1) {
			return BigDecimal.ZERO;
		}
		vPresupuestoRestanteProyecto = this.getPresupuestoProyecto().subtract(getCosteActualProyecto());
		return vPresupuestoRestanteProyecto;
	}

	@Override
	public String toString() {
		DecimalFormat formato = new DecimalFormat("#,##0.00 €");
		return this.codigoProyecto + "-" + this.descripcionProyecto + " // Presupuesto: "
				+ formato.format(this.presupuestoProyecto) + " (" + formato.format(this.costeActualProyecto) + ")";
	}

	@Override
	public int hashCode() {
		return Objects.hash(codigoProyecto);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Proyecto other = (Proyecto) obj;
		return Objects.equals(codigoProyecto, other.codigoProyecto);
	}

}
