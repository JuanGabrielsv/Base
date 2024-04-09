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
	
	public Persona consultarPersona(String dni) throws SQLException{
		
		String sql = "SELECT * FROM PERSONAS WHERE DNI = '" + dni + "'";
		
		try(Connection conn = openConn.getNewConnection();
				Statement stmt = conn.createStatement()){
			
		}
		
	}

}
