package examen_3Trimestre_B.examen.modelo;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;
import java.util.Objects;

public class Pelicula {

	private String tituloPelicula;
	private Integer duracionPelicula;
	private LocalDate fechaInicioRodajePelicula;
	private LocalDate fechaEstrenoPelicula;
	private BigDecimal presupuestoInicialPelicula;
	private BigDecimal recaudacionPelicula;
	private List<Actor> listaRepartoPelicula;

	public Pelicula(String titulo) {
		this.tituloPelicula = titulo;
	}

	public String getTituloPelicula() {
		return tituloPelicula;
	}

	public void setTituloPelicula(String tituloPelicula) {
		this.tituloPelicula = tituloPelicula;
	}

	public Integer getDuracionPelicula() {
		return duracionPelicula;
	}

	public void setDuracionPelicula(Integer duracionPelicula) {
		this.duracionPelicula = duracionPelicula;
	}

	public LocalDate getFechaInicioRodajePelicula() {
		return fechaInicioRodajePelicula;
	}

	public void setFechaInicioRodajePelicula(LocalDate fechaInicioRodajePelicula) {
		this.fechaInicioRodajePelicula = fechaInicioRodajePelicula;
	}

	public LocalDate getFechaEstrenoPelicula() {
		return fechaEstrenoPelicula;
	}

	public void setFechaEstrenoPelicula(LocalDate fechaEstrenoPelicula) {
		this.fechaEstrenoPelicula = fechaEstrenoPelicula;
	}

	public BigDecimal getPresupuestoInicialPelicula() {
		return presupuestoInicialPelicula;
	}

	public void setPresupuestoInicialPelicula(BigDecimal presupuestoInicialPelicula) {
		this.presupuestoInicialPelicula = presupuestoInicialPelicula;
	}

	public BigDecimal getRecaudacionPelicula() {
		return recaudacionPelicula;
	}

	public void setRecaudacionPelicula(BigDecimal recaudacionPelicula) {
		this.recaudacionPelicula = recaudacionPelicula;
	}

	public List<Actor> getListaRepartoPelicula() {
		return listaRepartoPelicula;
	}

	public void setListaRepartoPelicula(List<Actor> listaRepartoPelicula) {
		this.listaRepartoPelicula = listaRepartoPelicula;
	}

	public BigDecimal getBeneficios() {
		if (this.getRecaudacionPelicula().compareTo(presupuestoInicialPelicula) == -1) {
			return BigDecimal.ZERO;
		}
		return this.getRecaudacionPelicula().subtract(presupuestoInicialPelicula);
	}

	public Integer getTiempoRodaje() {
		Integer meses = 0;
		if (this.fechaInicioRodajePelicula == null || this.fechaEstrenoPelicula == null) {
			return meses;
		}
		Period periodo = this.getFechaInicioRodajePelicula().until(fechaEstrenoPelicula);
		meses = periodo.getYears() * 12;
		meses += periodo.getMonths();
		return meses;
	}

	@Override
	public String toString() {
		DecimalFormat formato = new DecimalFormat("#,##0.00 €");
		return this.tituloPelicula + " (" + this.duracionPelicula + ") // Recaudación: "
				+ formato.format(this.getRecaudacionPelicula()) + " (" + formato.format(getBeneficios()) + ")";
	}

	@Override
	public int hashCode() {
		return Objects.hash(tituloPelicula);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pelicula other = (Pelicula) obj;
		return Objects.equals(tituloPelicula, other.tituloPelicula);
	}

}
