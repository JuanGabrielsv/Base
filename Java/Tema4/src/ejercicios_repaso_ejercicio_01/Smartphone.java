/*
EJERCICIO 1
Crea una clase llamada Smartphone con los siguientes atributos privados:
	• marca (Texto)
	• modelo (Texto)
	• imei (Texto)
	• precio (Número decimal)
	• fechaFabricacion (LocalDate)
	• activo (Booleano)
	
Añade 3 constructores:
	• Constructor por defecto
	• Constructor que reciba e inicialice el imei
	• Constructor que reciba e inicialice el imei, la marca y el modelo
Todos los constructores deben inicializar el smartphone como activo y a precio 0.

Añade los siguientes métodos:
	• setPrecio() -> permite cambiar el precio del Smartphone
	• activar -> activa el Smartphone
	• desactivar -> inactiva el Smartphone
	• getEdad() -> devuelve los años transcurridos desde el 1 de abril del 2000 hasta la fecha de fabricación del Smartphone
	• cambiarMarcaModelo() -> recibe una marca y modelo para cambiar los delSmartphone
	• establecerFabricacion() -> recibe y cambia la fecha de fabricación del Smartphone
	• getPrecioMasIva() -> devuelve el precio del Smartphone sumándole el IVA (21%)
	• isAltaGama() -> recibe un precio base y devolverá un booleano indicando si el
	  Smartphone es de alta gama o no. Los Smartphone de alta gama son aquellos cuyo precio es mayor al precio base recibido
	• isDatosCompletos() -> devuelve un booleano indicando si los datos del Smartphone
	  están completos. Para que lo estén, al menos el imai debe no estar vacío ni contener sólo espacios en blanco, y el precio no puede ser null.
	• isGratis() -> devuelve si el precio del Smartphone es o no es 0 euros.
	• rebajar() -> modifica el precio del Smartphone restándole 10 euros.
	• toString() -> sobrescribe el método toString de Object. Debe devolver una cadena con
	  el formato “marca (modelo)”. Si el Smartphone además está inactivo, la cadena será
	  así “marca (modelo) – INACTIVO”. 
*/
package ejercicios_repaso_ejercicio_01;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Month;
import java.time.Period;

public class Smartphone {

	private String marca;
	private String modelo;
	private String imei;
	private BigDecimal precio;
	private LocalDate fechaFabricacion;
	private Boolean activo;

	// Constructor por defecto.

	public Smartphone() {
		this.activo = true;
		this.precio = BigDecimal.ZERO;
	}

	// Constructor que reciba e inicialice el imei.

	public Smartphone(String inputImei) {
		this.imei = inputImei;
		this.activo = true;
		this.precio = BigDecimal.ZERO;
	}

	// Constructor que reciba e inicialice el imei, la marca y el modelo.

	public Smartphone(String inputImei, String inputMarca, String inputModelo) {
		this.imei = inputImei;
		this.activo = true;
		this.precio = BigDecimal.ZERO;
		this.marca = inputMarca;
		this.modelo = inputModelo;
	}

	// GETTERS ANS SETTERS

	public String getImei() {
		return imei;
	}

	// setPrecio() -> permite cambiar el precio del Smartphone.

	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}

	// activar -> activa el Smartphone.

	public void activar() {
		this.activo = true;
	}

	// desactivar -> inactiva el Smartphone.

	public void desactivar() {
		this.activo = false;
	}

	// getEdad() -> devuelve los años transcurridos desde el 1 de abril del 2000
	// hasta la fecha de fabricación del Smartphone.

	public Integer getEdad() {
		LocalDate fecha2000 = LocalDate.of(2000, Month.APRIL, 1);
		Period periodo = fecha2000.until(fechaFabricacion);
		return periodo.getYears();
	}

	// cambiarMarcaModelo() -> recibe una marca y modelo para cambiar los
	// delSmartphone.

	public void cambiarMarcaModelo(String marca, String modelo) {
		this.marca = marca;
		this.modelo = modelo;
	}

	// establecerFabricacion() -> recibe y cambia la fecha de fabricación del
	// Smartphone.

	public void establecerFabricacion(LocalDate fecha) {
		this.fechaFabricacion = fecha;
	}

	// getPrecioMasIva() -> devuelve el precio del Smartphone sumándole el IVA
	// (21%).

	public BigDecimal getPrecioMasIva() {
		return this.precio.multiply(new BigDecimal(1.21));
	}

	// isAltaGama() -> recibe un precio base y devolverá un booleano indicando si el
	// Smartphone es de alta gama o no. Los Smartphone de alta gama son aquellos
	// cuyo precio es mayor al precio base recibido

	public Boolean isAltaGama(BigDecimal precioBase) {
		if (this.precio.compareTo(precioBase) > 0) {
			return true;
		} else {
			return false;
		}
	}

	// isDatosCompletos() -> devuelve un booleano indicando si los datos del
	// Smartphone están completos.
	// Para que lo estén, al menos el imai debe no estar vacío ni contener sólo
	// espacios en blanco, y el precio no puede ser null.

	public Boolean isDatosCompletos() {
		if (this.imei == null || this.imei.isBlank() || this.imei.isEmpty() || this.precio == null) {
			return false;
		}
		return true;
	}

	// isGratis() -> devuelve si el precio del Smartphone es o no es 0 euros.

	public Boolean isGratis() {
		if (this.precio.equals(BigDecimal.ZERO)) {
			return true;
		}
		return false;
	}

	// rebajar() -> modifica el precio del Smartphone restándole 10 euros.

	public void rebajar() {
		this.precio.subtract(BigDecimal.TEN);
	}

	// toString() -> sobrescribe el método toString de Object. Debe devolver una
	// cadena con
	// el formato “marca (modelo)”. Si el Smartphone además está inactivo, la cadena
	// será
	// así “marca (modelo) – INACTIVO”.

	@Override
	public String toString() {
		
		String resultado = this.marca + " (" + this.modelo + ") ";
		
		if (this.activo == true) {
			resultado = resultado + " - ACTIVO";
		}
		
		
		
		
		return resultado;
	}

}
