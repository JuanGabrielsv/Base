package borrador;

import java.util.Objects;

public class Libro {

	private String titulo;
	private Integer anoEdicion;
	private static String editorial;

	public Libro(String titulo) {
		this.titulo = titulo;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Integer getAnoEdicion() {
		return anoEdicion;
	}

	public void setAnoEdicion(Integer anoEdicion) {
		this.anoEdicion = anoEdicion;
	}

	public static String getEditorial() {
		return editorial;
	}

	public static void setEditorial(String editorial) {
		Libro.editorial = editorial;
	}

	@Override
	public int hashCode() {
		return Objects.hash(anoEdicion, titulo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Libro other = (Libro) obj;
		return Objects.equals(anoEdicion, other.anoEdicion) && Objects.equals(titulo, other.titulo);
	}

	

	
}
