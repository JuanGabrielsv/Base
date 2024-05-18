package examen_3Trimestre_A.examen.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import examen_3Trimestre_A.examen.modelo.Proyecto;

public class ProyectoService {
	
	private OpenConnection openConn;
	
	public ProyectoService() {
		openConn = new OpenConnection();
	}

	/*public List<Proyecto> buscarProyectos(String fecha1, String fecha2) {
		List<Proyecto> listaProyectosBuscados = new ArrayList<Proyecto>();
		
		String sql = "SELECT * FROM proyectos WHERE inicio BETWEEN ? AND ?";
		
		try (Connection conn = openConn.getNewConnection(); PreparedStatement stmt = conn.prepareStatement(sql);) {
			
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Proyecto proyecto = new Proyecto(rs.getString(0), sql);
				
			}
			
		}
		
		
	}*/

}
