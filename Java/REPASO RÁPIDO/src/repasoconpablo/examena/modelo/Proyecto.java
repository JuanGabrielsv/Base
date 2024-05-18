package repasoconpablo.examena.modelo;

import java.math.BigDecimal;
import java.math.RoundingMode;
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
	private BigDecimal costeActualProyectos;
	private List<Programador> listaProgramadorProyectos;

	public Proyecto(String codigoProyecto, String descripcionProyecto) {
		super();
		this.codigoProyecto = codigoProyecto;
		this.descripcionProyecto = descripcionProyecto;
		this.listaProgramadorProyectos = new ArrayList<Programador>();
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

	public BigDecimal getCosteActualProyectos() {
		return costeActualProyectos;
	}

	public void setCosteActualProyectos(BigDecimal costeActualProyectos) {
		this.costeActualProyectos = costeActualProyectos;
	}

	public List<Programador> getListaProgramadorProyectos() {
		return listaProgramadorProyectos;
	}

	public void setListaProgramadorProyectos(List<Programador> listaProgramadorProyectos) {
		this.listaProgramadorProyectos = listaProgramadorProyectos;
	}

	public Integer getDuracion() {

		if (this.getFechaInicioProyecto() == null || this.getFechaEntregaProyecto() == null) {
			return 0;
		}

		Period periodo = this.fechaInicioProyecto.until(fechaEntregaProyecto);
		Integer meses = periodo.getMonths() + (periodo.getYears() * 12);
		return meses;

	}

	public BigDecimal getPresupuestoRestante() {
		
		if (this.getCosteActualProyectos().compareTo(getPresupuestoProyecto()) == 1) {
			return BigDecimal.ZERO;
		}

		return this.getPresupuestoProyecto().subtract(getCosteActualProyectos()).setScale(2, RoundingMode.HALF_DOWN);

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
	
	@Override
	public String toString() {
		DecimalFormat formato = new DecimalFormat("#,##0.00€");
	
		return this.getCodigoProyecto() + "-" + this.getDescripcionProyecto() + " // Presupuesto: " 
				+ formato.format(this.getPresupuestoProyecto()) + " " 
				+ "(" + formato.format(this.getCosteActualProyectos()) + ")";				
	}

}
