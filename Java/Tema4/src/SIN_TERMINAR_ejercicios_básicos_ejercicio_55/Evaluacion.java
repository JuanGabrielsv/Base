/*
EJERCICIO 55

Necesitamos un programa para registrar las notas de todos los alumnos. Para ello, crea una
clase que se llame Evaluacion que tenga dentro un mapa de String --> BigDecimal.

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
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class Evaluacion {

	// private String dni;
	// private BigDecimal nota;
	private Map<String, BigDecimal> mapNotas;
	private static final BigDecimal APROBADO = new BigDecimal(5);

	public Evaluacion(String dni, BigDecimal nota) {
		mapNotas = new HashMap<String, BigDecimal>();
		mapNotas.put(dni, nota);
	}

	/*
	 * 1. addNota() que reciba el dni del alumno, su nota, y lo añada al mapa. Si ya
	 * tenemos registrada una nota para el mismo alumno, no haremos nada (no
	 * sobrescribimos). El método debe devolver un booleano indicando si finalmente
	 * hemos añadido o no algo al mapa.
	 */

	public Boolean addNota(String dni, BigDecimal nota) {
		if (mapNotas.containsKey(dni) && mapNotas.get(dni) == null) {
			mapNotas.put(dni, nota);
			return true;
		} else {
			return false;
		}
	}

	/*
	 * 2. corregirNota() que reciba el dni del alumno y su nota. Si ya tenemos para
	 * el alumno una nota, la cambiamos. Si no tenemos ninguna, no hacemos nada. El
	 * método debe devolver un booleano indicando si finalmente hemos corregido algo
	 * o no en el mapa.
	 */

	public Boolean corregirNota(String dni, BigDecimal nota) {
		if (mapNotas.containsKey(dni) && mapNotas.get(dni) != null) {
			mapNotas.put(dni, nota);
			System.out.println("SE HA CAMBIADO LA NOTA");
			return true;
		} else {
			System.err.println("NO SE HA CAMBIADO LA NOTA");
			return false;
		}
	}

	/*
	 * 3. obtenerNotaAlumno() que recibe un dni y devuelve la nota de ese alumno. Si
	 * no la tuviéramos registrada, devolveremos un 0.
	 */

	public BigDecimal obtenerNotaAlumno(String dni) {
		if (!mapNotas.containsKey(dni) || mapNotas.get(dni) == null) {
			return new BigDecimal(0);
		} else {
			return mapNotas.get(dni);
		}
	}

	/*
	 * 4. obtenerNotaMedia() que no recibe nada y devuelve un BigDecimal con la nota
	 * media calculada de todos los alumnos.
	 */

	public BigDecimal obtenerNotaMedia() {
		BigDecimal sumaDeNotas = BigDecimal.ZERO;

		Collection<BigDecimal> values = mapNotas.values();
		for (BigDecimal val : values) {
			if (val != null) {
				sumaDeNotas = sumaDeNotas.add(val);
			}
		}
		return sumaDeNotas.divide(new BigDecimal(mapNotas.size()), 2, RoundingMode.HALF_DOWN);
	}

	/*
	 * 5. obtenerCantidadAprobados() que devuelva un entero con la cantidad de
	 * alumnos que tengan al menos un 5
	 */

	public Integer obtenerCantidadAprobados() {
		Integer sumaNumAlumnosAprobados = 0;

		Collection<BigDecimal> values = mapNotas.values();
		for (BigDecimal val : values) {
			if (val.compareTo(APROBADO) >= 0) {
				sumaNumAlumnosAprobados++;
			}
		}
		return sumaNumAlumnosAprobados;
	}

	/*
	 * 6. obtenerSuspensos() que devuelva una lista con todos los DNIs de los
	 * alumnos suspensos
	 */

	public List<String> obtenerSuspensos() {
		List<String> listaAlumnosSuspensos = new ArrayList<>();

		Set<Entry<String, BigDecimal>> pares = mapNotas.entrySet();
		for (Entry<String, BigDecimal> par : pares) {
			if (par.getValue().compareTo(APROBADO) == -1) {
				listaAlumnosSuspensos.add(par.getKey());
			}
		}
		return listaAlumnosSuspensos;
	}

	/*
	 * 7. borrarAprobados() que borre todos los alumnos del mapa que estén
	 * aprobados.
	 */

	public void borrarAprobados(Map<String, BigDecimal> mapNotas) {
		Iterator<Map.Entry<String, BigDecimal>> iterador = mapNotas.entrySet().iterator();
		while (iterador.hasNext()) {
			Map.Entry<String, BigDecimal> pares = iterador.next();
			if (pares.getValue().compareTo(APROBADO) >= 0) {
				iterador.remove();
			}
		}

		/*
		 * ESTE ASÍ NO DA ERROR.... Iterator<Map.Entry<String, BigDecimal>> iterador =
		 * mapNotas.entrySet().iterator(); while (iterador.hasNext()) {
		 * Map.Entry<String, BigDecimal> pares = iterador.next(); if
		 * (pares.getValue().compareTo(APROBADO) == 0 ||
		 * pares.getValue().compareTo(APROBADO) == 1) { mapNotas.remove(pares); } }
		 */

		/*
		 * Iterator<Map.Entry<String, BigDecimal>> iterador =
		 * mapNotas.entrySet().iterator(); while (iterador.hasNext()) {
		 * Map.Entry<String, BigDecimal> pares = iterador.next(); if
		 * (pares.getValue().compareTo(APROBADO) >= 0) {
		 * mapNotas.remove(pares.getKey()); }
		 * 
		 * }
		 */

		/*
		 * Iterator<Map.Entry<String, BigDecimal>> iterador =
		 * mapNotas.entrySet().iterator(); while (iterador.hasNext()) {
		 * Map.Entry<String, BigDecimal> entry = iterador.next(); if
		 * (entry.getValue().compareTo(APROBADO) >= 0) {
		 * mapNotas.remove(entry.getKey()); } }
		 */
	}

// MÉTODOS GET A SETS

	public Map<String, BigDecimal> getMapNotas() {
		return mapNotas;
	}

}
