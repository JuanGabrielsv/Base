/* EJERCICIO 7
Crea en PersonasService un método que permita insertar una lista de Personas en
la BBDD. Se llamará insertarPersonas() y recibirá una lista. 
Importante: si hay algún error al guardar alguna persona, la transacción debe
deshacerse por completo. Es decir, si hay algún error, no se debe insertar
ninguna persona (tendrás que hacer un rollback).
Pruébalo creando una clase Test que cree 3 personas y llame al servicio. 
Prueba también a hacer que la segunda o tercera persona tenga un nombre muy
largo para que provoque un error en la base de datos y verificar que no se
inserta ninguna persona. 
*/
package SIN_TERMINAR_Ejercicios_basicos_07.app;

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
