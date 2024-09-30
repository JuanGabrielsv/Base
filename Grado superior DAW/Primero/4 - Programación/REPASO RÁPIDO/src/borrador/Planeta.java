package borrador;

import java.util.Objects;

public class Planeta {

	private String nombre;
	private Integer cantidadDeSatelites;
	private static String tipo;
	
	public Planeta(String nombre) {
		this.nombre = nombre;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Integer getCantidadDeSatelites() {
		return cantidadDeSatelites;
	}

	public void setCantidadDeSatelites(Integer cantidadDeSatelites) {
		this.cantidadDeSatelites = cantidadDeSatelites;
	}

	public static String getTipo() {
		return tipo;
	}

	public static void setTipo(String tipo) {
		Planeta.tipo = tipo;
	}

	@Override
	public int hashCode() {
		return Objects.hash(nombre);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Planeta other = (Planeta) obj;
		return Objects.equals(nombre, other.nombre);
	}

	@Override
	public String toString() {
		return "Planeta [nombre=" + nombre + ", cantidadDeSatelites=" + cantidadDeSatelites + "]";
	}
	
	

}
