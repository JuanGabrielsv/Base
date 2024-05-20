package examen_3Trimestre_B.examen.services;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import examen_3Trimestre_A.examen.services.OpenConnection;
import examen_3Trimestre_B.examen.modelo.Pelicula;

public class PeliculasServices {

	private OpenConnection openConn;

	public PeliculasServices() {
		openConn = new OpenConnection();
	}

	public List<Pelicula> consultarPeliculas(LocalDate fecha1, LocalDate fecha2)
			throws PeliculaErrorException, PeliculaNotFoundException {

		List<Pelicula> listaResultadosPeliculas = new ArrayList<Pelicula>();
		String sql = "SELECT * FROM peliculas WHERE estreno BETWEEN ? AND ?";

		try (Connection conn = openConn.getNewConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setDate(1, Date.valueOf(fecha1));
			stmt.setDate(2, Date.valueOf(fecha2));

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Pelicula pelicula = new Pelicula(rs.getString("TITULO_PELICULA"));
				pelicula.setDuracionPelicula(rs.getInt("DURACION"));
				pelicula.setFechaInicioRodajePelicula(rs.getDate("FECHA_COMIENZO").toLocalDate());
				pelicula.setFechaEstrenoPelicula(rs.getDate("ESTRENO").toLocalDate());
				pelicula.setPresupuestoInicialPelicula(new BigDecimal(rs.getInt("PRESUPUESTO_INICIAL")));
				pelicula.setRecaudacionPelicula(new BigDecimal(rs.getInt("RECAUDACION_ACUMULADA")));
				listaResultadosPeliculas.add(pelicula);
			}

			if (listaResultadosPeliculas.isEmpty()) {
				throw new PeliculaNotFoundException();
			}

			return listaResultadosPeliculas;

		} catch (PeliculaNotFoundException e) {
			throw new PeliculaNotFoundException("No hay peliculas para estas fechas");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new PeliculaErrorException("Error consultando peliculas");
		}

	}

}
