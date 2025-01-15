//De cada actor guardaremos su id, nombre y nacionalidad. 
package com.example.demo.modelo;

public class Actor {

	private String id;
	private String nombre;
	private String nacionalidad;

	public Actor(String id, String nombre, String nacionalidad) {

		this.id = id;
		this.nombre = nombre;
		this.nacionalidad = nacionalidad;

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getNacionalidad() {
		return nacionalidad;
	}

	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}

}
