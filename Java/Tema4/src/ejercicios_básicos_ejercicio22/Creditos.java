package ejercicios_básicos_ejercicio22;

public class Creditos {
	
	private String nombre = "";
	private Integer anoNacimiento = 0;
	private String nacionalidad = "";
	
//MÉTODO GET Y SET	
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Integer getAnoNacimiento() {
		return anoNacimiento;
	}
	public void setAnoNacimiento(Integer anoNacimiento) {
		this.anoNacimiento = anoNacimiento;
	}
	public String getNacionalidad() {
		return nacionalidad;
	}
	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}
}
