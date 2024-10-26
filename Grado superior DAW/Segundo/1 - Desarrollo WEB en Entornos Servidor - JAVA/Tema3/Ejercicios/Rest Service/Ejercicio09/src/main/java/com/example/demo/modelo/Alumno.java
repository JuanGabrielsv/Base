package com.example.demo.modelo;

public class Alumno {

	private String id;
	private String nombre;
	private String email;
	private String edad;

	public Alumno(String id, String nombre, String email, String edad) {
		this.id = id;
		this.nombre = nombre;
		this.email = email;
		this.edad = edad;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEdad() {
		return edad;
	}

	public void setEdad(String edad) {
		this.edad = edad;
	}

}
