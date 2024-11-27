package com.example.demo.modelo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "entradas")
public class Entrada {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "nombre_comprador", nullable = false)
	private String nombreComprador;

	@Column(name = "pelicula", nullable = false)
	private String pelicula;

	@Column(name = "horario", nullable = false)
	private String horario;

	@Column(name = "numero_entradas", nullable = false)
	private Integer numeroEntradas;

	@Column(name = "precio_por_entrada", nullable = false)
	private Double precioPorEntrada;

	@Column(name = "taquilla")
	private Boolean taquilla = true;

	@Column(name = "precio_total")
	private Double precioTotal;

	public Entrada() {}

	public Entrada(Long id, String nombreComprador, String pelicula, String horario, Integer numeroEntradas,
			Double precioPorEntrada, Boolean taquilla, Double precioTotal) {

		this.id = id;
		this.nombreComprador = nombreComprador;
		this.pelicula = pelicula;
		this.horario = horario;
		this.numeroEntradas = numeroEntradas;
		this.precioPorEntrada = precioPorEntrada;
		this.taquilla = taquilla;
		this.precioTotal = precioTotal;
	}

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
