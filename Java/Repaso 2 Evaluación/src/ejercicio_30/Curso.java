/*
EJERCICIO 30

• Añade a la clase Curso un atributo llamado “alumnos” que sea un array de Alumno. 
• Debe ser privado. 
• En el constructor de la clase Curso, haz que se reciba el número de alumnos totales
  que va a tener, de ese modo podrás inicializar el array de alumnos en el Constructor.
• Añade un método get() para el nuevo atributo, pero no un set().
• Añade además otro método que sea addAlumno() que recibe por parámetro un alumno. 
• El método debe añadir el alumno al array en la siguiente posición libre.
• Modifica el programa del ejercicio 25 para añadir todos los alumnos del array a la clase Curso. 
*/
package ejercicio_30;

public class Curso {

	private Long identificador;
	private String descripcion;
	private Alumno[] arrayAlumnos;
	private Integer indiceAlumnos;
	
// CONSTRUCTORES
	
	public Curso (Integer numAlumnos) {
		
		arrayAlumnos = new Alumno[numAlumnos];
		indiceAlumnos = 0;	
		
	}
	
// MÉTODOS
	
	public void addAlumno(Alumno alumno) {
		
		if (indiceAlumnos < arrayAlumnos.length) {
			
			arrayAlumnos[indiceAlumnos] = alumno;
			indiceAlumnos++;
			
		}
		else {
			
			System.err.println("NO HAY SITIO PARA MÁS ALUMNOS");
			
		}
		
	}
	
// MÉTODOS GET AND SET
	
	public Alumno[] getAlumnos() {
		return arrayAlumnos;
	}

	public Long getIdentificador() {
		return identificador;
	}

	public void setIdentificador(Long identificador) {
		this.identificador = identificador;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
// TO STRING

	@Override
	public String toString() {
		return "Curso [identificador=" + identificador + ", descripcion=" + descripcion + "]";
	}
	
	

}
