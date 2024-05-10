/*
EJERCICIO 1
Para este ejercicio usaremos la tabla PERSONAS:
-- MySQL
CREATE TABLE IF NOT EXISTS personas (
 DNI varchar(50) NOT NULL,
 NOMBRE varchar(50) NOT NULL,
 APELLIDOS varchar(100) NOT NULL,
 FECHA_NACIMIENTO date DEFAULT NULL,
 PRIMARY KEY (DNI)
);
-- ORACLE
CREATE TABLE personas (
 DNI varchar2(50) NOT NULL,
 NOMBRE varchar2(50) NOT NULL,
 APELLIDOS varchar2(100) NOT NULL,
 FECHA_NACIMIENTO DATE DEFAULT NULL,
 PRIMARY KEY (DNI)
);

Ejecuta el script en tu BBDD para crear la tabla. Inserta una o dos personas 
manualmente como prefieras (con un script, con SQLDeveloper, HeidiSQL, etc.)

A continuación:
Realiza un programa que pida al usuario un DNI, consulte en la BBDD la persona
con ese DNI y muestre sus datos por pantalla.

Realiza el programa organizado en las siguientes clases:
	• Crea una clase Persona
	• Crea una clase PersonasService con el método consultarPersona()
	• Crea una clase App que se encargue de solicitar al usuario el DNI y llame
	 al método consultarPersona() cuando lo requiera.
Si hay algún error al conectar con la BBDD o ejecutar la consulta, tendrás que mostrárselo al
usuario con un texto amigable.
*/
package Ejercicios_basicos_01.app;

import java.sql.SQLException;
import java.util.Scanner;
import Ejercicios_basicos_01.modelo.Persona;
import Ejercicios_basicos_01.servicios.*;

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
		/*OpenConnection prueba = new OpenConnection();
		try {
			Connection c = prueba.getNewConnection();
			System.out.println(c);
		} catch (SQLException e) {			
			e.printStackTrace();
		}*/
		
		

	}

}
