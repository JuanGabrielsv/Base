package examen_3Trimestre_B.examen.modelo;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import examen_3Trimestre_B.examen.services.PeliculaNotFoundException;

public class Productora {

	private String nombreProductora;
	private List<Actor> listaActoresProductora;
	private List<Pelicula> listaPeliculaProductora;

	public String getNombreProductora() {
		return nombreProductora;
	}

	public void setNombreProductora(String nombreProductora) {
		this.nombreProductora = nombreProductora;
	}

	public List<Actor> getListaActoresProductora() {
		return listaActoresProductora;
	}

	public void setListaActoresProductora(List<Actor> listaActoresProductora) {
		this.listaActoresProductora = listaActoresProductora;
	}

	public List<Pelicula> getListaPeliculaProductora() {
		return listaPeliculaProductora;
	}

	public void setListaPeliculaProductora(List<Pelicula> listaPeliculaProductora) {
		this.listaPeliculaProductora = listaPeliculaProductora;
	}

	public Map<String, List<Actor>> getMapaActores() {
		Map<String, List<Actor>> mapaActores = new HashMap<String, List<Actor>>();
		for (Pelicula pelicula : listaPeliculaProductora) {
			mapaActores.put(pelicula.getTituloPelicula(), pelicula.getListaRepartoPelicula());
		}
		return mapaActores;
	}

	public Pelicula getPeliculaMenorReparto() throws PeliculaNotFoundException {
		Pelicula peliculaMenorReparto = new Pelicula(null);
		Integer numerosActores = 0;
		if (this.listaPeliculaProductora.isEmpty()) {
			throw new PeliculaNotFoundException("No hay peliculas");
		}
		for (Pelicula pelicula : listaPeliculaProductora) {
			if (pelicula.getListaRepartoPelicula().size() > numerosActores) {
				numerosActores = pelicula.getListaRepartoPelicula().size();
				peliculaMenorReparto = pelicula;
			}
		}
		return peliculaMenorReparto;
	}

	public BigDecimal getCostePelicula(String titulo) {
		BigDecimal costePelicula = BigDecimal.ZERO;
		Boolean check = false;
		for (Pelicula pelicula : listaPeliculaProductora) {
			if (pelicula.getTituloPelicula().equals(titulo)) {
				check = true;
				break;
			}
		}
		if (check == true) {
			for (Pelicula pelicula : listaPeliculaProductora) {
				if (pelicula.getTituloPelicula().equals(titulo)) {
					for (Actor actor : pelicula.getListaRepartoPelicula()) {
						costePelicula.add(actor.getCoste());
					}
				}
			}
		}
		return costePelicula;
	}

	public List<Pelicula> getLargometrajesEstrenadosConBeneficios() {
		List<Pelicula> listaPeliculaEstrenadasConBeneficios = new ArrayList<Pelicula>();
		for (Pelicula pelicula : listaPeliculaProductora) {
			if (pelicula.getFechaEstrenoPelicula().isBefore(LocalDate.now()) && pelicula.getDuracionPelicula() > 60
					&& pelicula.getBeneficios().compareTo(BigDecimal.ZERO) == 1) {
				listaPeliculaEstrenadasConBeneficios.add(pelicula);
			}
		}
		return listaPeliculaEstrenadasConBeneficios;
	}

	@Override
	public String toString() {
		DecimalFormat formato = new DecimalFormat("#,##0.00 €");
		String mensaje = ">>>> Productora: " + this.getNombreProductora() + " <<<<\nPeliculas:\n\t";
		for (Pelicula pelicula : listaPeliculaProductora) {
			mensaje += pelicula.getTituloPelicula() + " (" + pelicula.getDuracionPelicula() + " min.) // Recaudación: "
					+ formato.format(pelicula.getRecaudacionPelicula()) + " ("
					+ formato.format(pelicula.getBeneficios()) + ")\n\t";
		}
		return mensaje;
	}

}
