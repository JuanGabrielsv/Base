/*
EJERCICIO 3

Amplía el programa anterior para que, después de la última parte, solicite al 
usuario los datos de una persona y lo inserte en BBDD.
 
Tendrás que crear en PersonasService un método llamado insertarPersona() que 
reciba una Persona y la inserte. Trata los errores con la BBDD del mismo modo.

Antes de intentar insertar, debes asegurar que todos los datos están completos.
Para ello, crea un método “validar()” en la clase Persona que lance una 
excepción si no es así. 
Por ejemplo, DatosIncompletosException. Si salta la excepción, contrólala y 
vuelve a pedir los datos al usuario.
*/
package Ejercicios_basicos_03.app;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Scanner;
import Ejercicios_basicos_03.modelo.Persona;
import Ejercicios_basicos_03.servicios.DatosIncompletosException;
import Ejercicios_basicos_03.servicios.PersonasService;

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

			System.out.println("Indica el filtro: ");
			String filtro = sc.nextLine();

			List<Persona> lista = service.buscarPersona(filtro);
			for (Persona persona : lista) {
				System.out.println(persona);
			}
			
			Persona pe = new Persona();
			
			pe.setDni("99999999");
			pe.setNombre("Cuñao");
			pe.setApellidos("Martín");
			pe.setFechaNacimiento(LocalDate.of(2022, 02, 22));
			
			service.insertarPersona(pe);

		} catch (SQLException e) {
			System.out.println("Exepción en main: " + e.getMessage());
		} catch (DatosIncompletosException e) {
			
		} finally {
			sc.close();
		}

		// PRUEBA DE CONEXIÓN

		// OpenConnection prueba = new OpenConnection();
		// try {
		// Connection c = prueba.getNewConnection();
		// System.out.println(c);
		// } catch (SQLException e) {
		// e.printStackTrace();
		// }
	}

}
