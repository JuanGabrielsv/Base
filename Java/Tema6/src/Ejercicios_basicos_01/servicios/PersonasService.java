package Ejercicios_basicos_01.servicios;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Ejercicios_basicos_01.modelo.Persona;
/**
 * Clase que realiza servicios sobre una Persona
 * @version 1.0
 * @author Juan Gabriel
 * @since 15/05/2024
 */
public class PersonasService {
	
	private OpenConnection openConn;
	/**
	 * Constructor por defecto que abre una conexión.
	 */
	public PersonasService() {
		openConn = new OpenConnection();
	}
	/**
	 * Método que consulta una persona.
	 * @param dni esto es una descripció?
	 * @return Persona Retorna una persona
	 * @throws SQLException Lanza excepción de la base de datos
	 */
	public Persona consultarPersona(String dni) throws SQLException {
					
		ResultSet rs = null;
		
		try (Connection conn = openConn.getNewConnection();			
			Statement stmt = conn.createStatement()) {
			
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

}
