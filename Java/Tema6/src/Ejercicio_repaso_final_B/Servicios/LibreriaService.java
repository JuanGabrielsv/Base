package Ejercicio_repaso_final_B.Servicios;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;
import Ejercicio_repaso_final_B.modelo.Libro;
import Ejercicio_repaso_final_B.modelo.LibroNuevo;

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

	public void actualizarPrecioLibro(Libro libro) throws LibroException {

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

	public Libro consultarLibro() {

		String sql = "SELECT * FROM libros WHERE isbn = 00";

		try (Connection conn = openConn.getNewConnection(); PreparedStatement stmt = conn.prepareStatement(sql);) {

			ResultSet rs = stmt.executeQuery();
			Libro libro = new LibroNuevo();

			while (rs.next()) {
				libro.setIsbn(rs.getString("ISBN"));
				libro.setTitulo(rs.getString("TITULO"));
				libro.setAutor(rs.getString("AUTOR"));
				libro.setPrecio(rs.getBigDecimal("PRECIO"));
			}
			return libro;

		} catch (Exception e) {
			// TODO: handle exception
		}

		return null;

	}

	public Libro consultaPorIsbn(String isbn) {

		String sql = "SELECT * FROM libros WHERE isbn = ?";

		try (Connection conn = openConn.getNewConnection(); PreparedStatement stmt = conn.prepareStatement(sql);) {

			stmt.setString(1, isbn);

			ResultSet rs = stmt.executeQuery();
			Libro libro = new LibroNuevo();
			
			while (rs.next()) {
				libro.setIsbn(rs.getString("ISBN"));
				libro.setTitulo(rs.getString("TITULO"));
				libro.setAutor(rs.getString("AUTOR"));
				libro.setPrecio(rs.getBigDecimal("PRECIO"));
			}
			return libro;

		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public boolean borrarFila() {
		
		String sql = "DELETE FROM libros WHERE isbn = 05";
		
		try (Connection conn = openConn.getNewConnection(); PreparedStatement stmt = conn.prepareStatement(sql);) {
			
			stmt.executeQuery();
			Boolean hecho = stmt.execute();
			return hecho;
						
		} catch (Exception e) {
			// TODO: handle exception
		}
		return true;
	}
	
	public void borrarFilaPorIsbn(String Isbn) {
		
		String sql = "DELETE FROM libros WHERE isbn = ?";
		
		try (Connection conn = openConn.getNewConnection(); PreparedStatement stmt = conn.prepareStatement(sql);) {
			
			stmt.setString(1, Isbn);			
			stmt.executeQuery();
			System.out.println("Se ha borrado la línea correctamente");
						
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
