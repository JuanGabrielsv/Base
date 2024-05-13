package examen.modelo;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;
import java.util.Objects;

public class Proyecto {

	private String codigoProyecto;
	private String descripcion;
	private LocalDate fechaInicio;
	private LocalDate fechaEntrega;
	private BigDecimal presupuestoProyecto;
	private BigDecimal costeProyecto;
	private List<Programador> lProgramadoresProyecto;
	
	public Proyecto(String codigo, String descrip) {
		this.codigoProyecto = codigo;
		this.descripcion = descrip;
	}

	public String getCodigoProyecto() {
		return codigoProyecto;
	}

	public void setCodigoProyecto(String codigoProyecto) {
		this.codigoProyecto = codigoProyecto;
	}

	public String getDescripción() {
		return descripcion;
	}

	public void setDescripción(String descripción) {
		this.descripcion = descripción;
	}

	public LocalDate getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(LocalDate fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public LocalDate getFechaEntrega() {
		return fechaEntrega;
	}

	public void setFechaEntrega(LocalDate fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}

	public BigDecimal getPresupuestoProyecto() {
		return presupuestoProyecto;
	}

	public void setPresupuestoProyecto(BigDecimal presupuestoProyecto) {
		this.presupuestoProyecto = presupuestoProyecto;
	}

	public BigDecimal getCosteProyecto() {
		return costeProyecto;
	}

	public void setCosteProyecto(BigDecimal costeProyecto) {
		this.costeProyecto = costeProyecto;
	}

	public List<Programador> getlProgramadoresProyecto() {
		return lProgramadoresProyecto;
	}

	public void setlProgramadoresProyecto(List<Programador> lProgramadoresProyecto) {
		this.lProgramadoresProyecto = lProgramadoresProyecto;
	}
	
	public Integer getDuracion() {
		if (this.fechaInicio == null || this.fechaEntrega == null) {
			return 0;
		} else {		
		Period periodo = this.fechaInicio.until(fechaEntrega);
		Integer meses = periodo.getMonths();		
		return meses;
		}
	}
	
	public BigDecimal getPresupuestoRestante() {
		if (this.costeProyecto.compareTo(presupuestoProyecto) == 1) {
			return BigDecimal.ZERO;
		} else {		
		BigDecimal total = this.presupuestoProyecto.subtract(costeProyecto);
		return total;
		}
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
