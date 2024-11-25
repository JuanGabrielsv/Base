package com.example.demo.modelo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "reservas")
public class Reserva {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@Column(name = "nombre_cliente", nullable = false)
	private String nombreCliente;

	@Column(name = "tipo_habitacion", nullable = false)
	private String tipoHabitacion;

	@Column(name = "numero_noches", nullable = false)
	private Integer numeroNoches;

	@Column(name = "precio_habitacion", nullable = false)
	private Double precioHabitacion;

	@Column(name = "activa")
	private Boolean activa = true;

	@Column(name = "precio_total")
	private Double precioTotal;

	@Column(name = "codigo_venta")
	private Integer codigoVenta;

	public Reserva() {

	}

	public Reserva(Long id, String nombreCliente, String tipoHabitacion, Integer numeroNoches, Double precioHabitacion,
			Boolean activa, Double precioTotal, Integer codigoVenta) {

		this.id = id;
		this.nombreCliente = nombreCliente;
		this.tipoHabitacion = tipoHabitacion;
		this.numeroNoches = numeroNoches;
		this.precioHabitacion = precioHabitacion;
		this.activa = activa;
		this.precioTotal = precioTotal;
		this.codigoVenta = codigoVenta;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombreCliente() {
		return nombreCliente;
	}

	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}

	public String getTipoHabitacion() {
		return tipoHabitacion;
	}

	public void setTipoHabitacion(String tipoHabitacion) {
		this.tipoHabitacion = tipoHabitacion;
	}

	public Integer getNumeroNoches() {
		return numeroNoches;
	}

	public void setNumeroNoches(Integer numeroNoches) {
		this.numeroNoches = numeroNoches;
	}

	public Double getPrecioHabitacion() {
		return precioHabitacion;
	}

	public void setPrecioHabitacion(Double precioHabitacion) {
		this.precioHabitacion = precioHabitacion;
	}

	public Boolean getActiva() {
		return activa;
	}

	public void setActiva(Boolean activa) {
		this.activa = activa;
	}

	public Double getPrecioTotal() {
		return precioTotal;
	}

	public void setPrecioTotal(Double precioTotal) {
		this.precioTotal = precioTotal;
	}

	public Integer getCodigoVenta() {
		return codigoVenta;
	}

	public void setCodigoVenta(Integer codigoVenta) {
		this.codigoVenta = codigoVenta;
	}

	@Override
	public String toString() {
		return "Reserva ID: " + this.id + " - Número de noches: " + this.numeroNoches + " - Código venta: "
				+ this.codigoVenta;
	}

}
