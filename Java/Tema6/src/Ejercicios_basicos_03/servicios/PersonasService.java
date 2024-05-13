/*
EJERCICIO 3

Amplía el programa anterior para que, después de la última parte, solicite al 
usuario los datos de una persona y lo inserte en BBDD.
 
Tendrás que crear en PersonasService un método llamado insertarPersona() que 
reciba una Persona y la inserte. 

Trata los errores con la BBDD del mismo modo.

Antes de intentar insertar, debes asegurar que todos los datos están completos.
Para ello, crea un método “validar()” en la clase Persona que lance una 
excepción si no es así. 
Por ejemplo, DatosIncompletosException. Si salta la excepción, contrólala y 
vuelve a pedir los datos al usuario.
*/
package Ejercicios_basicos_03.servicios;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Ejercicios_basicos_03.modelo.Persona;

public class PersonasService {

	private OpenConnection openConn;

	public PersonasService() {
		openConn = new OpenConnection();
	}

	public Persona consultarPersona(String dni) throws SQLException {

		ResultSet rs = null;

		try (Connection conn = openConn.getNewConnection(); Statement stmt = conn.createStatement()) {

			String sql = "SELECT * FROM PERSONAS WHERE DNI = '" + dni + "'";
			System.out.println(sql);
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				Persona p = new Persona();
				p.setNombre(rs.getString("NOMBRE"));
				p.setDni(rs.getString("DNI"));
				p.setApellidos(rs.getString("APELLIDOS"));
				p.setFechaNacimiento(rs.getDate("FECHA_NACIMIENTO").toLocalDate());
				return p;
			} else {
				return null;
			}
		}
	}

	// Tendrás que crear un método en PersonasService llamado buscarPersonas() que
	// reciba el filtro y devuelva una lista de personas.

	public List<Persona> buscarPersona(String filtro) throws SQLException {

		try (Connection conn = openConn.getNewConnection(); Statement stmt = conn.createStatement()) {

			String sql = "SELECT * FROM personas WHERE nombre LIKE '%" + filtro + "%' OR apellidos LIKE '%" + filtro
					+ "%'";

			System.out.println(sql);

			ResultSet rs = stmt.executeQuery(sql);

			List<Persona> resultados = new ArrayList<Persona>();

			while (rs.next()) {
				Persona p = new Persona();

				p.setNombre(rs.getString("nombre"));
				p.setDni(rs.getString("dni"));
				p.setApellidos(rs.getString("apellidos"));
				p.setFechaNacimiento(rs.getDate("fecha_nacimiento").toLocalDate());

				resultados.add(p);

			}
			return resultados;

		}
	}

	// Tendrás que crear en PersonasService un método llamado insertarPersona()
	// que reciba una Persona y la inserte.

	public void insertarPersonaOld(Persona p) throws SQLException, DatosIncompletosException {

		try (Connection conn = openConn.getNewConnection(); Statement stmt = conn.createStatement()) {

			String sql = "INSERT INTO personas VALUES ('" + p.getDni() + "', " + "'" + p.getNombre() + "', " + "'"
					+ p.getApellidos() + "', " + "'" + Date.valueOf(p.getFechaNacimiento()) + "')";

			System.out.println(sql);
			stmt.execute(sql);
		}
	}

	public void insertarPersona(Persona p) {

		String sql = "INSERT INTO personas VALUES (?, ?, ?, ?)";
		

		try (Connection conn = openConn.getNewConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			
			p.validar();

			stmt.setString(1, p.getDni());
			stmt.setString(2, p.getNombre());
			stmt.setString(3, p.getApellidos());
			stmt.setDate(4, Date.valueOf(p.getFechaNacimiento()));

			System.out.println(sql);
			stmt.execute();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} catch (DatosIncompletosException e) {
			System.err.println("DatoIncompletosExection " + e.getMessage());
		}
	}

}
