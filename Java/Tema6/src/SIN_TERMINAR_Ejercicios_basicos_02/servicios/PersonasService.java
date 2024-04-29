package SIN_TERMINAR_Ejercicios_basicos_02.servicios;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import Ejercicios_basicos_01.modelo.Persona;

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

	public List<Persona> buscarPersonas(String filtro) {
		return null;
	}

}
