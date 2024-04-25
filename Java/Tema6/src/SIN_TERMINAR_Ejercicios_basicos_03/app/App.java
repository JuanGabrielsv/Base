/* EJERCICIO 3
Amplía el programa anterior para que, después de la última parte, solicite al usuario los datos
de una persona y lo inserte en BBDD. Tendrás que crear en PersonasService un método llamado
insertarPersona() que reciba una Persona y la inserte. Trata los errores con la BBDD del mismo
modo.
Antes de intentar insertar, debes asegurar que todos los datos están completos. Para ello, crea
un método “validar()” en la clase Persona que lance una excepción si no es así. Por ejemplo,
DatosIncompletosException. Si salta la excepción, contrólala y vuelve a pedir los datos al
usuario. */
package SIN_TERMINAR_Ejercicios_basicos_03.app;

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
				System.out.println("No existe persona con los datos"
						+ " solicitados");
			} else {
				System.out.println(p);
			}
		} catch (SQLException e) {
			System.out.println("Exepción en main: " + e.getMessage());
		} finally {
			sc.close();
		}		
		
		// PRUEBA DE CONEXIÓN
		
		/*OpenConnection prueba = new OpenConnection();
		try {
			Connection c = prueba.getNewConnection();
			System.out.println(c);
		} catch (SQLException e) {			
			e.printStackTrace();
		}*/
		
		

	}

}
