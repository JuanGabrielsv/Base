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

public class Profesor extends Persona {

	@Override
	public String toString() {
		return "Profesor [getNombre()=" + getNombre() + ", getEdad()=" + getEdad() + "]";
	}
}
