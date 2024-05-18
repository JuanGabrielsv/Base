package examen_3TrimestreB.examen.modelo;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Pelicula {

	private String tituloPelicula;
	private Integer duracionPelicula;
	private LocalDate fechaInicioPelicula;
	private BigDecimal presupestoInicialPelicula;
	private BigDecimal recaudacionPelicula;
	private List<Actor> listaRepartoPelicula;

	public Pelicula(String nombre) {
		this.tituloPelicula = nombre;
		this.listaRepartoPelicula = new ArrayList<Actor>();
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

	public LocalDate getFechaInicioPelicula() {
		return fechaInicioPelicula;
	}

	public void setFechaInicioPelicula(LocalDate fechaInicioPelicula) {
		this.fechaInicioPelicula = fechaInicioPelicula;
	}

	public BigDecimal getPresupestoInicialPelicula() {
		return presupestoInicialPelicula;
	}

	public void setPresupestoInicialPelicula(BigDecimal presupestoInicialPelicula) {
		this.presupestoInicialPelicula = presupestoInicialPelicula;
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
