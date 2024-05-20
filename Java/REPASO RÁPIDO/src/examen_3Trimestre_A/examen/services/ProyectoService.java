package examen_3Trimestre_A.examen.services;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import examen_3Trimestre_A.examen.modelo.Proyecto;

public class ProyectoService {

	private OpenConnection openConn;

	public ProyectoService() {
		openConn = new OpenConnection();
	}

	public List<Proyecto> buscarProyecto(LocalDate fecha1, LocalDate fecha2)
			throws ProyectoErrorException, ProyectoNotFoundException {

		List<Proyecto> listaResultadoProyectos = new ArrayList<Proyecto>();
		String sql = "SELECT * FROM proyectos WHERE inicio BETWEEN ? AND ?";

		try (Connection conn = openConn.getNewConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setDate(1, Date.valueOf(fecha1));
			stmt.setDate(2, Date.valueOf(fecha2));

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Proyecto proyecto = new Proyecto(rs.getString("COD_PROYECTO"), rs.getString("DES_PROYECTO"));
				proyecto.setFechaInicioProyecto(rs.getDate("INICIO").toLocalDate());
				proyecto.setFechaEntregaProyecto(rs.getDate("ENTREGA").toLocalDate());
				proyecto.setPresupuestoProyecto(new BigDecimal(rs.getInt("PRESUPUESTO")));
				proyecto.setCosteActualProyecto(new BigDecimal(rs.getInt("COSTE")));
				listaResultadoProyectos.add(proyecto);
			}

			if (listaResultadoProyectos.isEmpty()) {
				throw new ProyectoNotFoundException();
			}

			return listaResultadoProyectos;

		} catch (ProyectoNotFoundException e) {
			throw new ProyectoNotFoundException("No hay proyectos para estas fechas");
		} catch (SQLException e) {
			throw new ProyectoErrorException(e.getMessage());
		}

	}
}
