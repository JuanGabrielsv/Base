package examen.services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import examen.modelo.Proyecto;

public class ProyectoService {
	
	private OpenConnection openConn;

	public ProyectoService() {
		openConn = new OpenConnection();
	}
	
	public Proyecto buscarProyectos(LocalDate fecha1, LocalDate fecha2) throws ProyectoErrorException {

		String sql = "SELECT * FROM proyectos WHERE inicio BETWEEN ? AND ?;";

		try (Connection conn = openConn.getNewConnection(); PreparedStatement stmt = conn.prepareStatement(sql);) {

			stmt.setDate(1, Date.valueOf(fecha1));
			stmt.setDate(2, Date.valueOf(fecha2));

			ResultSet rs = stmt.executeQuery();
			Proyecto p = new Proyecto(rs.getString("COD_PROYECTO"), rs.getString("DES_PROYECTO"));
			
			while (rs.next()) {
				
				p.setFechaInicio(rs.getDate("INICIO").toLocalDate());
				p.setFechaEntrega(rs.getDate("ENTREGA").toLocalDate());
				p.setPresupuestoProyecto(rs.getBigDecimal("PRESUPUESTO"));
				p.setCosteProyecto(rs.getBigDecimal("COSTE"));
			
			}
			return p;

		} catch (SQLException e) {
			throw new ProyectoErrorException("Error consultando Proyecto");
		}
	}

}
