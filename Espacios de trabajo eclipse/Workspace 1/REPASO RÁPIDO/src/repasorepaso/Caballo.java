package repasorepaso;

public class Caballo {
	
	private String nombre;
	private String color;
	private int edad;
	private int carrerasGanadas;	
	
// MÉTODO QUE NO DEVUELVE NADA
	public void imprimirCarrerasGanadas() {		
		System.out.println("el número de carreras ganadas es: " + this.carrerasGanadas);		
	}
	
// CONSTRUCTOR CON PARÁMETROS
	
public Caballo(String nombre, String color, int edad, int carrerasGanadas) {
	super();
	this.nombre = nombre;
	this.color = color;
	this.edad = edad;
	this.carrerasGanadas = carrerasGanadas;
}

// CONSTRUCTOR SIN PARÁMETROS
public Caballo() {
	this.nombre = "";
	this.color = "";
	this.edad = 0;
	this.carrerasGanadas = 0;
}

// MÉTODO QUE DEVUELVE UN ENTERO	
	public int anoNacimiento() {
		return 2024 - edad;
	}
	
// MÉTODO QUE NO DEVUELVE NADA 
	public void incrementarCarrerasGanadas() {
		carrerasGanadas = carrerasGanadas + 1;
	}

// MÉTODO QUE NO DEVUELVE NADA
	public void relincha() {
		System.out.println("iiIiIiIiIiI");
	}

	
//*****************************************************************************
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public int getCarrerasGanadas() {
		return carrerasGanadas;
	}

	public void setCarrerasGanadas(int carrerasGanadas) {
		this.carrerasGanadas = carrerasGanadas;
	}	
	
//TO STRING
	
	@Override
	public String toString() {
		return "Caballo [nombre=" + nombre + ", color=" + color + ", edad=" + edad + ", carrerasGanadas="
				+ carrerasGanadas + "]";
	}	

}
