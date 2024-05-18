package examen_3TrimestreB.examen.modelo;

import java.util.List;

public class Productora {

	private String nombreProductora;
	private List<Actor> listaActorProductora;
	private List<Pelicula> listaPeliculasProductora;	

	public String getNombreProductora() {
		return nombreProductora;
	}

	public void setNombreProductora(String nombreProductora) {
		this.nombreProductora = nombreProductora;
	}

	public List<Actor> getListaActorProductora() {
		return listaActorProductora;
	}

	public void setListaActorProductora(List<Actor> listaActorProductora) {
		this.listaActorProductora = listaActorProductora;
	}

	public List<Pelicula> getListaPeliculasProductora() {
		return listaPeliculasProductora;
	}

	public void setListaPeliculasProductora(List<Pelicula> listaPeliculasProductora) {
		this.listaPeliculasProductora = listaPeliculasProductora;
	}

}
