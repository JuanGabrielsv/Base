/*
EJERCICIO 2

Completa el ejercicio anterior solicitando después al usuario un filtro para
buscar personas.
Consulta en la BBDD todas las personas cuyo nombre o apellidos contengan este
filtro.
Luego muestra al usuario el listado de los resultados encontrados.
Tendrás que crear un método en PersonasService llamado buscarPersonas() que 
reciba el filtro y devuelva una lista de personas. Si hay código que se repita 
del método consultarPersona() intenta extraerlo a un método privado para 
reutilizarlo.
Trata los errores del mismo modo.
Intenta dividir tu clase App en método para que no esté todo “apiñado” en el main 
*/
package SIN_TERMINAR_Ejercicios_basicos_02.app;

import Ejercicios_basicos_01.modelo.Persona;
import Ejercicios_basicos_01.servicios.*;
//import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {

		PersonasService service = new PersonasService();

		Scanner sc = new Scanner(System.in);

		System.out.println("Indica el dni de la persona:");
		String vDni = sc.nextLine();

		try {

			Persona p = service.consultarPersona(vDni);

			if (p == null) {
				System.out.println("No existe persona con los datos solicitados");
			} else {
				System.out.println(p);
			}

		} catch (SQLException e) {
			System.out.println("Exepción en main: " + e.getMessage());
		} finally {
			sc.close();
		}

		// PRUEBA DE CONEXIÓN

		/*
		 * OpenConnection prueba = new OpenConnection(); try { Connection c =
		 * prueba.getNewConnection(); System.out.println(c); } catch (SQLException e) {
		 * e.printStackTrace(); }
		 */

	}

}
