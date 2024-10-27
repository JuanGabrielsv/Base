package com.example.demo.modelo;

public class Alumno {

	private Integer id;
	private String nombre;
	private String email;
	private Integer edad;
	private String curso;
	
	//1 Añadir un campo a la clase Alumno que sea de tipo Direccion. 
	private Direccion direccion;

	public Alumno(Integer id, String nombre, String email, Integer edad, String curso, Direccion direccion) {
		this.id = id;
		this.nombre = nombre;
		this.email = email;
		this.edad = edad;
		this.curso = curso;
		this.direccion = direccion;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edad) {
		this.edad = edad;
	}

	public String getCurso() {
		return curso;
	}

	public void setCurso(String curso) {
		this.curso = curso;
	}

	public Direccion getDireccion() {
		return direccion;
	}

	public void setDireccion(Direccion direccion) {
		this.direccion = direccion;
	}

}
