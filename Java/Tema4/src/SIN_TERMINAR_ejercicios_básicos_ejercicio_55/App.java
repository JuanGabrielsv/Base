/*
EJERCICIO 55

Necesitamos un programa para registrar las notas de todos los alumnos. Para ello, crea una
clase que se llame Evaluacion que tenga dentro un mapa de String --> BigDecimal
La clase tendrá estos métodos:

1. addNota() que reciba el dni del alumno, su nota, y lo añada al mapa. Si ya tenemos
   registrada una nota para el mismo alumno, no haremos nada (no sobrescribimos). El
   método debe devolver un booleano indicando si finalmente hemos añadido o no algo
   al mapa.
2. corregirNota() que reciba el dni del alumno y su nota. Si ya tenemos para el alumno
   una nota, la cambiamos. Si no tenemos ninguna, no hacemos nada. El método debe
   devolver un booleano indicando si finalmente hemos corregido algo o no en el mapa.
3. obtenerNotaAlumno() que recibe un dni y devuelve la nota de ese alumno. Si no la
   tuviéramos registrada, devolveremos un 0.
4. obtenerNotaMedia() que no recibe nada y devuelve un BigDecimal con la nota media
   calculada de todos los alumnos.
5. obtenerCantidadAprobados() que devuelva un entero con la cantidad de alumnos que
   tengan al menos un 5
6. obtenerSuspensos() que devuelva una lista con todos los DNIs de los alumnos
   suspensos
7. borrarAprobados() que borre todos los alumnos del mapa que estén aprobados.
8. toString() que imprima el listado con este formato:
	
		Aprobados:
		 2332323D (7,2)
		 6332363F (5,2)
		 0912399Z (9,1)
		Suspensos:
		 7561323B (3,2)
		 2913853R (4,9)

Luego, realiza un programa que use la clase anterior:

1. Crea un objeto evaluación
2. Introduce 5 notas de distintos valores e imprime la evaluación
3. Intenta volver a introducir una nota para un alumno repetido. Comprueba que no se
   modifique imprimiendo la evaluación de nuevo.
4. Intenta corregir dos notas, una de un alumno que esté ya registrado y otra de un
   alumno no registrado. Comprueba que funciona correctamente imprimiendo de nuevo
   la evaluación.
5. Obtén la nota de algún alumno y la nota media de todos. Imprímelas formateando
   correctamente los decimales
6. Obtén e imprime la cantidad de aprobados
7. Obtén e imprime la lista de suspensos
8. Borra los aprobados. Comprueba que funciona bien volviendo a imprimir la evaluación. 
*/
package SIN_TERMINAR_ejercicios_básicos_ejercicio_55;

import java.math.BigDecimal;
import java.util.Map.Entry;
import java.util.Set;

public class App {

	public static void main(String[] args) {		
		Evaluacion evaluacion1 = new Evaluacion("53279139F", new BigDecimal(8));		
		evaluacion1.getMapNotas().put("25885289D", new BigDecimal(5));
		evaluacion1.getMapNotas().put("33333333S", new BigDecimal(4));
		evaluacion1.getMapNotas().put("98654321L", new BigDecimal(3));
		evaluacion1.getMapNotas().put("21654852P", new BigDecimal(5));		
		
		evaluacion1.corregirNota("33333333S", new BigDecimal(2));		
		
		Set<Entry<String, BigDecimal>> pares = evaluacion1.getMapNotas().entrySet();
		for (Entry<String, BigDecimal> par : pares) {
			System.out.println("Clave: " + par.getKey());
			System.out.println("Valor: " + par.getValue());
		}
		
		System.out.println("OBTENER NOTA MEDIA DE TODOS LOS ALUMNOS: " + evaluacion1.obtenerNotaMedia());
		System.out.println("NÚMERO DE APROBADOS: " + evaluacion1.obtenerCantidadAprobados());
		
		for (String cadena : evaluacion1.obtenerSuspensos()) {
			System.out.println(cadena);
		}
		
		evaluacion1.borrarAprobados(evaluacion1.getMapNotas());
		
		Set<Entry<String, BigDecimal>> pares2 = evaluacion1.getMapNotas().entrySet();
		for (Entry<String, BigDecimal> par : pares2) {
			System.out.println("Clave: " + par.getKey());
			System.out.println("Valor: " + par.getValue());
		}
		
		
		
		
		
	}

}
