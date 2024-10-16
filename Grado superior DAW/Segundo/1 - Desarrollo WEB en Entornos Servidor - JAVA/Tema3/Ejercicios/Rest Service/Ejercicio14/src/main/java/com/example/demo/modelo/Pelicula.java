//un id, titulo, director, fecha de lanzamiento, duración (en minutos), y una lista de actores.
package com.example.demo.modelo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Pelicula {
	private String id;
	private String titulo;
	private String director;
	private Date fechaLanzamiento;
	private Integer duracion;

	public Pelicula(String id, String titulo, String director, Date fechaLanzamiento, Integer duracion) {
		this.id = id;
		this.titulo = titulo;
		this.director = director;
		this.fechaLanzamiento = fechaLanzamiento;
		this.duracion = duracion;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public Date getFechaLanzamiento() {
		return fechaLanzamiento;
	}

	public void setFechaLanzamiento(Date fechaLanzamiento) {
		this.fechaLanzamiento = fechaLanzamiento;
	}

	public Integer getDuracion() {
		return duracion;
	}

	public void setDuracion(Integer duracion) {
		this.duracion = duracion;
	}

	

}
