package Ejercicio_repaso_final_B.Servicios;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

import Ejercicio_repaso_final_B.modelo.Libro;

public class LibreriaService {

	private OpenConnection openConn;

	public LibreriaService() {
		openConn = new OpenConnection();
	}

	public void insertarLibro(Libro libro) throws LibroException {

		String sql = "INSERT INTO libros VALUES (?, ?, ?, ?)";

		try (Connection conn = openConn.getNewConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {		

			stmt.setString(1, libro.getIsbn());
			stmt.setString(2, libro.getTitulo());
			stmt.setString(3, libro.getAutor());
			stmt.setBigDecimal(4, libro.getPrecio());

			System.out.println(sql);

			System.out.println(stmt.execute());

		} catch (SQLException e) {
			throw new LibroException("NO SE HA PODIDO INTRODUCIR DATOS");
		}
	}
	
	public void actualizarPrecioLibro (Libro libro) throws LibroException {
		
		String sql = "UPDATE libros SET precio = ? WHERE isbn = ?";
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un precio: ");
		BigDecimal precio = sc.nextBigDecimal();
		String isbn = libro.getIsbn();
		
		try (Connection conn = openConn.getNewConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
			
			stmt.setBigDecimal(1, precio);
			stmt.setString(2, isbn);
			
			System.out.println(sql);
			
			System.out.println(stmt.execute());
			
		} catch (SQLException e) {
			throw new LibroException("NO SE HA PODIDO ACTUALIZAR LOS DATOS VER LA CONSULTA " + e.getMessage());
		} finally {
			sc.close();
		}
	}

}
