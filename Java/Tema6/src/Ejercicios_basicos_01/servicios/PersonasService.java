package Ejercicios_basicos_01.servicios;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import Ejercicios_basicos_01.modelo.Persona;

public class PersonasService {
	
	private OpenConnection openConn;
	
	public PersonasService() {
		openConn = new OpenConnection();
	}
	
	/*public Persona consultarPersona(String dni) throws SQLException{
		
		String sql = "SELECT * FROM PERSONAS WHERE DNI = '" + dni + "'";
		
		try(Connection conn = openConn.getNewConnection();
				Statement stmt = conn.createStatement()){
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				String dni1 = rs.getString("DNI");
				if (dni1.equals(dni)) {
					
				}
				String nombre = rs.getString("NOMBRE");
				
			}
			
		}
		
	}*/
	
	public Persona consultarPersona(String dni) throws SQLException {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {			
			conn = openConn.getNewConnection();			
			stmt = conn.createStatement();
			
			String sql = "SELECT * FROM PERSONAS WHERE DNI = '" + dni + "'";
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {				
				Persona p = new Persona();
				p.setNombre(rs.getString("NOMBRE"));
				p.setDni(rs.getString("DNI"));				
				p.setApellidos(rs.getString("APELLIDOS"));
				p.setFecha(rs.getDate("FECHA_NACIMIENTO").toLocalDate());
				return p;
			} else {
				return null;	
			}	
			
		} finally {
			System.out.println("");
			conn.close();
			stmt.close();
		}
	}

}
