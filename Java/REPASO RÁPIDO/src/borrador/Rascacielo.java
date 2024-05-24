package borrador;

import java.util.Objects;

public class Rascacielo {

	private String nombre;
	private Integer altura;
	private Integer pisos;
	private static String ciudad;

	public Rascacielo(String nombre) {
		this.nombre = nombre;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Integer getAltura() {
		return altura;
	}

	public void setAltura(Integer altura) {
		this.altura = altura;
	}

	public Integer getPisos() {
		return pisos;
	}

	public void setPisos(Integer pisos) {
		this.pisos = pisos;
	}

	public static String getCiudad() {
		return ciudad;
	}

	public static void setCiudad(String ciudad) {
		Rascacielo.ciudad = ciudad;
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
		Rascacielo other = (Rascacielo) obj;
		return Objects.equals(nombre, other.nombre);
	}

}
