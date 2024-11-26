package com.example.demo.modelo;

public class Entrada {
	
	private Long id;

	private String nombreComprador;

	private String pelicula;

	private String horario;

	private Integer numeroEntradas;

	private Double precioPorEntrada;

	private Boolean taquilla = true;

	private Double precioTotal;
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombreComprador() {
		return nombreComprador;
	}

	public void setNombreComprador(String nombreComprador) {
		this.nombreComprador = nombreComprador;
	}

	public String getPelicula() {
		return pelicula;
	}

	public void setPelicula(String pelicula) {
		this.pelicula = pelicula;
	}

	public String getHorario() {
		return horario;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public Integer getNumeroEntradas() {
		return numeroEntradas;
	}

	public void setNumeroEntradas(Integer numeroEntradas) {
		this.numeroEntradas = numeroEntradas;
	}

	public Double getPrecioPorEntrada() {
		return precioPorEntrada;
	}

	public void setPrecioPorEntrada(Double precioPorEntrada) {
		this.precioPorEntrada = precioPorEntrada;
	}

	public Boolean getTaquilla() {
		return taquilla;
	}

	public void setTaquilla(Boolean taquilla) {
		this.taquilla = taquilla;
	}

	public Double getPrecioTotal() {
		return precioTotal;
	}

	public void setPrecioTotal(Double precioTotal) {
		this.precioTotal = precioTotal;
	}

}
