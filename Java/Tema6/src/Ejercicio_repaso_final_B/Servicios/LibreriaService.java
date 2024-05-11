package Ejercicio_repaso_final_B.Servicios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Ejercicio_repaso_final_B.modelo.Libro;

public class LibreriaService {
	
	private OpenConnection openConn;
	
	public LibreriaService () {
		openConn = new OpenConnection();
	}
	
	public void insertarLibro(Libro libro) {
		
		String sql = "INSERT INTO libros VALUES (?, ?, ?, ?)";		
		
		try (Connection conn = openConn.getNewConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			
			//SQLException libroException = new SQLException();
			
			stmt.setString(1, libro.getIsbn());
			stmt.setString(2,  libro.getTitulo());
			stmt.setString(3, libro.getAutor());
			stmt.setBigDecimal(4, libro.getPrecio());
			
			System.out.println(sql);
			
			
			System.out.println(stmt.execute());
			
			
		} catch (SQLException libroException) {
			
			
		}
	}

}
